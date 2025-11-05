varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;
uniform vec2 u_Texel;
void main() {
	vec4 colour = texture2D(gm_BaseTexture, v_vTexcoord);
	vec2 neighbours[4];
	neighbours[0] = vec2(u_Texel.x, 0.0);
	neighbours[1] = vec2(0.0, u_Texel.y);
	neighbours[2] = vec2(-u_Texel.x, 0.0);
	neighbours[3] = vec2(0.0, -u_Texel.y);
		
	for (int i = 0; i < 4; ++i) {
		vec4 pixel = texture2D(gm_BaseTexture, v_vTexcoord + neighbours[i]);
		if(pixel.a > 0.05 && colour.a < 0.05) {
			colour = vec4(0., 0., 0., 1.);
			break;
		}
	}
	colour *= v_vColour;
	gl_FragColor = vec4(colour.rgb * colour.a, colour.a);
}