//
// Simple passthrough fragment shader
//
#define SPACING	96.0
#define RADIUS	96.0
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_Animation;
uniform vec2 u_Size;
void main()
{
	vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float alpha = colour.a;
	colour.a = 0.0;
	vec2 circlecountdir = ceil(u_Size / SPACING) + 1.0;
	int circlecount = int(ceil(circlecountdir.x * circlecountdir.y));
	bool flipped = false;
	if(u_Animation > 1.0)
		flipped = true;
	vec2 uv = vec2(gl_FragCoord.xy / u_Size.xy);
	for(int i = 0; i < circlecount; i++) {
		vec2 circlepos = vec2(mod(float(i), circlecountdir.x) * RADIUS, floor(float(i) / circlecountdir.x) * RADIUS);
		float circlerad = 0.0;
		if(flipped == false)
			circlerad = RADIUS * (((1.0-uv.x + 1.0-uv.y) + (u_Animation * 4.0) - 2.0) * 0.5);
		else
			circlerad = RADIUS * (((uv.x + uv.y) + ((1.0-(u_Animation-1.0)) * 4.0) - 2.0) * 0.5);
		
		float dist = distance(circlepos.xy, gl_FragCoord.xy);
		if(dist <= circlerad)
			colour.a = alpha;
	}
    gl_FragColor = vec4(colour.rgb * colour.a, colour.a);
}