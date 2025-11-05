attribute vec3 in_Position; // (x, y, z)
attribute vec2 in_TextureCoord; // (u, v)
attribute float in_IsTop;
varying vec2 v_vTexcoord;
varying float v_IsTop;
void main() {
	vec4 object_space_pos = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	v_vTexcoord = in_TextureCoord;
	v_IsTop = in_IsTop;
}