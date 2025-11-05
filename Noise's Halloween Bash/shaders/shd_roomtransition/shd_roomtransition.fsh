//
// Simple passthrough fragment shader
//
#define WIDTH 96.0
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform bool u_Flipped;
uniform float u_Animation;
uniform vec2 u_Size;
void main()
{
	vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float alpha = colour.a;
	colour.a = 0.0;
	vec2 uv = vec2(gl_FragCoord.xy / u_Size.xy);
	if(u_Animation <= 1.0) {
		if(u_Flipped == true)
			colour.a = alpha * (((uv.x + 1.0-uv.y) + (u_Animation * 4.0) - 2.0) * 0.5);
		else
			colour.a = alpha * (((1.0-uv.x + 1.0-uv.y) + (u_Animation * 4.0) - 2.0) * 0.5);
	}
	else {
		if(u_Flipped == true)
			colour.a = alpha * (((1.0-uv.x + uv.y) + ((1.0-(u_Animation-1.0)) * 4.0) - 2.0) * 0.5);
		else
			colour.a = alpha * (((uv.x + uv.y) + ((1.0-(u_Animation-1.0)) * 4.0) - 2.0) * 0.5);
	}
    gl_FragColor = vec4(colour.rgb * colour.a, colour.a);
}