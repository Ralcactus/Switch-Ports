//
// Simple passthrough fragment shader
//
varying vec3 v_vPosition;
varying vec3 v_vNormal;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_Colour;
uniform vec3 u_Light;
uniform vec3 u_View;
void main()
{
	float fulllambert = max(dot(normalize(v_vNormal), normalize(u_Light)), 0.0);
	float halflambert = (fulllambert * 0.5) + 0.5;
	halflambert = min(halflambert, 1.);
	
	vec3 vdir = normalize(-u_View);
	vec3 rdir = reflect(normalize(u_Light), normalize(v_vNormal));
	float specular = pow(max(-dot(vdir, rdir), 0.0), 2.0) * fulllambert;
	
	gl_FragColor = vec4((u_Colour * halflambert) + specular, 0.9);
    gl_FragColor.rgb *= gl_FragColor.a;
}