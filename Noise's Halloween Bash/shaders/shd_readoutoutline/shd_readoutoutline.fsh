varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
uniform vec2 u_Texel;
void main() {
	vec4 colour = vec4(0.0);
	vec2 neighbours[8];
	neighbours[0] = vec2(u_Texel.x, 0.0);
	neighbours[1] = vec2(u_Texel.x, u_Texel.y);
	neighbours[2] = vec2(0.0, u_Texel.y);
	neighbours[3] = vec2(-u_Texel.x, u_Texel.y);
	neighbours[4] = vec2(-u_Texel.x, 0.0);
	neighbours[5] = vec2(-u_Texel.x, -u_Texel.y);
	neighbours[6] = vec2(0.0, -u_Texel.y);
	neighbours[7] = vec2(u_Texel.x, -u_Texel.y);
		
	for (int i = 0; i < 8; ++i) {
		vec4 pixel = texture2D(gm_BaseTexture, v_vTexcoord + neighbours[i]);
		colour.a = max(colour.a, pixel.a);
	}
	colour.a *= 1.0 - floor(texture2D(gm_BaseTexture, v_vTexcoord).a);
	gl_FragColor = vec4(colour.rgb * colour.a, colour.a);
}