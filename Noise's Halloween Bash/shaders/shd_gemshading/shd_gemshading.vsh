//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;				     // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec3 v_vPosition;
varying vec3 v_vNormal;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    vec4 world_space_pos = gm_Matrices[MATRIX_WORLD] * vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * gm_Matrices[MATRIX_VIEW] * world_space_pos;
    
	v_vPosition = world_space_pos.xyz;
	v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal.x, in_Normal.y, in_Normal.z, 0.0)).xyz;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}