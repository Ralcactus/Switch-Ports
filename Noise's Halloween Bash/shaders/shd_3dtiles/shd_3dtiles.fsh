varying vec2 v_vTexcoord;
varying float v_IsTop;
uniform int u_Outlining;
uniform float u_LightLevel;
void main() {
	gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
	if (gl_FragColor.a < 0.05)
		discard;
	
	if (u_Outlining == 1) {
		// dot product by a vector of all 1 gives sum of components
		float sum = dot(gl_FragColor.rgb * gl_FragColor.rgb * gl_FragColor.a, vec3(1.));
		vec3 factor = vec3(0.5 * (1. - step(3., 3. - sum)), float(gl_FragColor.rgb != vec3(31. / 255.) && gl_FragColor.rgb != vec3(38. / 255.)), v_IsTop); // hack
		gl_FragColor = vec4(factor, 1.);
	} else
		gl_FragColor.rgb *= u_LightLevel;
}