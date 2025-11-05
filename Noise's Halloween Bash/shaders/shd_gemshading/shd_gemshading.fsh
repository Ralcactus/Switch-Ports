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
uniform float u_LightLevel;
uniform int u_Outlining;
void main()
{
	float fulllambert = max(dot(normalize(v_vNormal), normalize(u_Light)), 0.0);
	float halflambert = (fulllambert * 0.5) + 0.5;
	halflambert = min(halflambert, u_LightLevel);
	
	vec3 vdir = normalize(-u_View);
	vec3 rdir = reflect(normalize(u_Light), normalize(v_vNormal));
	float specular = pow(max(-dot(vdir, rdir), 0.0), 2.0) * fulllambert;
	
	vec4 colour = vec4((u_Colour * halflambert) + (specular*u_LightLevel), 0.9);
    if (u_Outlining == 0)
		gl_FragColor = colour;
	else {
		float sum = dot(colour.rgb * colour.rgb * colour.a, vec3(1.));
		vec3 factor = vec3(1. - step(3., 3. - sum), colour.a, float(v_vNormal.y < 0.));
		gl_FragColor = vec4(factor, 1.);
	}
}