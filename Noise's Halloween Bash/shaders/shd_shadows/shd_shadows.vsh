attribute vec3 in_Position; // (x, y, z)
attribute vec2 in_TextureCoord; // (u, v)
varying vec2 v_vTexcoord;
varying vec2 v_vClip;
// https://mini.gmshaders.com/p/func-mix
vec2 remap(vec2 a, vec2 b, vec2 c, vec2 d, vec2 x) {
    return (x-a) / (b-a) * (d-c) + c;
}
void main() {
	vec4 object_space_pos = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	v_vTexcoord = in_TextureCoord;
	v_vClip = gl_Position.xy / gl_Position.w;
	v_vClip.y *= -1.; // Better flip that
	v_vClip = remap(vec2(-1.), vec2(1.), vec2(0.), vec2(1.), v_vClip);
}