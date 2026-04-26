#define Transparent vec4(.0,.0,.0,.0)
#define Tolerance 0.004 
//If you feel like your colors should be matching but aren't, increase this number a bit.
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D u_palTexture;
uniform sampler2D s_Pattern;
uniform vec4 u_Uvs;
uniform float u_paletteId;
uniform vec2 u_pixelSize;
uniform vec4 u_SprRect;
uniform vec4 u_PatRect;
uniform vec4 u_TexelScl;
uniform vec2 u_SprOffset;
uniform float color_array[2];
uniform int pattern_enabled;
vec4 findAltColor(vec4 inCol, vec2 corner)
{
	if(inCol.a == 0.) return Transparent;
	
	float dist;
	vec2 testPos;
	vec4 leftCol;
	for(float i = corner.y; i < u_Uvs.w; i+=u_pixelSize.y )
	{
		testPos = vec2(corner.x,i);
		leftCol = texture2D( u_palTexture, testPos);
		dist = distance(leftCol,inCol);
		if(dist < Tolerance)
		{
			testPos = vec2(corner.x + u_pixelSize.x * floor(u_paletteId + 1.0), i);
			vec4 palettedColor = mix(texture2D(u_palTexture, vec2(testPos.x - u_pixelSize.x, testPos.y)), texture2D(u_palTexture, testPos), fract(u_paletteId));
			
			if (pattern_enabled == 1) {
				
				for (int j = 0; j < 2; j += 1) {
					if (color_array[j] == floor((i - corner.y) * (1.0 / u_pixelSize.y))) {
						vec2 pixPos = vec2((v_vTexcoord.x - u_SprRect[0]) / u_TexelScl[2], (v_vTexcoord.y - u_SprRect[1]) / u_TexelScl[3]);
						vec2 patSize = vec2((u_PatRect[2] - u_PatRect[0]) / u_TexelScl[0], (u_PatRect[3] - u_PatRect[1]) / u_TexelScl[1]);
						vec2 patcoord = vec2(mod(pixPos.x + u_SprOffset[0], patSize.x) * u_TexelScl[0] + u_PatRect[0], mod(pixPos.y + u_SprOffset[1], patSize.y) * u_TexelScl[1] + u_PatRect[1]);
						vec4 patcol = texture2D(s_Pattern, patcoord);
						vec3 mixedCol = mix(patcol.rgb, palettedColor.rgb, palettedColor.a);
						palettedColor = vec4(mixedCol, patcol.a);
					}
					
				}
				
			}
			
			return palettedColor;
			
		}
	}
	return inCol;
}
void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord);
	DoAlphaTest( col );
	col = findAltColor(col, u_Uvs.xy);
	gl_FragColor = v_vColour * col;
}