varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main() {
	vec4 colour = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	if (colour.a < 0.05)
		discard;
	
	// dot product by a vector of all 1 gives sum of components
	float sum = dot(colour.rgb * colour.rgb * colour.a, vec3(1.));
	vec3 factor = vec3(0.5 * (1. - step(3., 3. - sum)), 1., 0.);
	gl_FragColor = vec4(factor, 1.);
}