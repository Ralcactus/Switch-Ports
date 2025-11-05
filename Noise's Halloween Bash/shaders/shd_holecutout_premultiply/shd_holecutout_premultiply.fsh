//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 u_PlayerPos;
uniform float u_Radius;
void main()
{
	float dist = 1. - clamp(-(distance(u_PlayerPos, gl_FragCoord.xy) - u_Radius) + 0.5, 0., 1.);
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a *= dist;
	gl_FragColor.rgb *= gl_FragColor.a;
}