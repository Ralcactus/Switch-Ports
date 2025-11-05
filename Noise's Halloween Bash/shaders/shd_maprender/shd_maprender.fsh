//
// Simple passthrough fragment shader
//
varying vec4 v_vColour;
uniform vec3 u_Colour;
void main()
{
    gl_FragColor = v_vColour * vec4(u_Colour, 1.);
}