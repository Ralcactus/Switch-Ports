//
// Simple passthrough fragment shader
//
#define M_PI 3.14159265358979323384626433832795
#define WAVE_BLUR 0.2
#define WAVE_SIZE 0.5
#define WAVE_COUNT 8.
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_Animation;
uniform vec2 u_Size;
float ease(float x) {
    return 1. - pow(1. - x, 4.);
}
void main() {
	vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float alpha = colour.a;
	colour.a = 0.0;
	vec2 uv = vec2(gl_FragCoord.xy / u_Size.xy);
	uv.y = 1. - uv.y;
	
    float bump = (cos(uv.x * M_PI * WAVE_COUNT) + 1.) / 2.;
    float bumpScalar = (1. - abs(uv.x - 0.5)) * WAVE_SIZE;
    float bumpFinal = (1. - abs(u_Animation - 1.)) / WAVE_SIZE - WAVE_SIZE + bump * bumpScalar;
	
	float factor;
	if (u_Animation < 1.)
		factor = uv.y;
	else
		factor = 1. - uv.y;
		
	colour.a = 1. - smoothstep(
		bumpFinal - WAVE_BLUR * float(u_Animation > 1.), 
		bumpFinal + WAVE_BLUR * float(u_Animation < 1.), 
		factor
	);
    gl_FragColor = vec4(colour.rgb * colour.a, colour.a);
}