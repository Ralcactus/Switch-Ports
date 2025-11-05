varying vec2 v_vTexcoord;
varying vec2 v_vClip;
varying float v_Depth;	
uniform sampler2D u_Mask;
uniform float u_LightLevel;
void main() {
	if (texture2D(u_Mask, v_vClip).b < 1.)
		discard;
	gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor.rgb *= u_LightLevel;
}