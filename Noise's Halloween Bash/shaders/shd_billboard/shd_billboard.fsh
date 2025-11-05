//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	//this is very inefficient. too bad!
	if(col.a < 0.05)
		discard;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}