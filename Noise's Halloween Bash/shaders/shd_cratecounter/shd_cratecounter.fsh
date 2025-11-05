varying vec3 v_vNormal;
varying vec3 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_Alpha;
uniform int u_Outlining;
void main()
{
    vec2 uv = v_vTexcoord.xy / v_vTexcoord.z;
    
	vec4 colour = v_vColour * texture2D( gm_BaseTexture, uv );
	colour.a *= u_Alpha;
	
	DoAlphaTest(colour);
	if (colour.a <= 0.)
		discard;
		
	if (u_Outlining == 0)
		gl_FragColor = colour;
	else {
		float sum = dot(colour.rgb * colour.rgb * colour.a, vec3(1.));
		vec3 factor = vec3(1. - step(3., 3. - sum), u_Alpha, float(v_vNormal.y < 0.));
		gl_FragColor = vec4(factor, 1.);
	}
}