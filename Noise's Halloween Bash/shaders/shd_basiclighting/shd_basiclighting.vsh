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
uniform float u_Time;
uniform float u_BoilScale;
// https://www.shadertoy.com/view/4djSRW
vec4 hash44(vec4 p4)
{
	p4 = fract(p4  * vec4(.1031, .1030, .0973, .1099));
    p4 += dot(p4, p4.wzxy+33.33);
    return fract((p4.xxyz+p4.yzzw)*p4.zywx);
}
void main()
{
    vec4 world_space_pos = gm_Matrices[MATRIX_WORLD] * vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
	world_space_pos.xyz += (hash44(vec4(world_space_pos.xyz, u_Time)).xyz - 0.5) * u_BoilScale;
	gl_Position = gm_Matrices[MATRIX_PROJECTION] * gm_Matrices[MATRIX_VIEW] * world_space_pos;
    
	v_vPosition = world_space_pos.xyz;
	v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.)).xyz;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}