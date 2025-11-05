//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform int u_Outlining;
void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (u_Outlining == 0) {
		if(mod(gl_FragCoord.x + gl_FragCoord.y, 2.0) == 1.0)
			discard; // very wasteful but ehhhhh who gaf
		gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	} else {
		float sum = dot(gl_FragColor.rgb * gl_FragColor.rgb * gl_FragColor.a, vec3(1.));
		vec3 factor = vec3(1. - step(3., 3. - sum), 1., 0.);
		gl_FragColor = vec4(factor, 1.);
	}
}