//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D u_Mask;
uniform sampler2D u_Layers;
uniform vec2 u_Texel;
uniform vec4 u_UVs;
uniform float u_LineWidth;
// https://mini.gmshaders.com/p/func-mix
vec2 remap(vec2 a, vec2 b, vec2 c, vec2 d, vec2 x) {
    return (x-a) / (b-a) * (d-c) + c;
}
void main() {
	vec2 maskCoord = remap(u_UVs.xy, u_UVs.zw, vec2(0.), vec2(1.), v_vTexcoord);
	vec4 colour = vec4(v_vColour.rgb, 0.);
	
	vec4 maskCheck = texture2D(u_Mask, maskCoord);
	
	vec2 neighbours[4];
	neighbours[0] = vec2(u_Texel.x, 0.);
	neighbours[1] = vec2(0., -u_Texel.y);
	neighbours[2] = vec2(-u_Texel.x, 0.);
	neighbours[3] = vec2(0., u_Texel.y);
	
	for (int i = 0; i < 4; ++i) {
		vec2 coord = maskCoord + neighbours[i];
		if (coord.x < 0. || coord.x > 1.)
			continue;
		if (coord.y < 0. || coord.y > 1.)
			continue;
			
		vec4 depth = texture2D(u_Mask, coord);
		colour.a += depth.g * float(depth.r > maskCheck.r);
	}
	colour.a = min(colour.a, 1.);
	
    gl_FragColor = colour;
}