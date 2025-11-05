//
// Simple passthrough fragment shader
//
#define Transparent vec4(.0)
#define Tolerance 0.004 
varying vec3 v_vPosition;
varying vec3 v_vNormal;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_Light;
uniform vec4 u_FlashCol;
uniform float u_ShadingMul;
uniform float u_LightLevel;
uniform int u_Paletted;
uniform sampler2D u_palTexture;
uniform vec4 u_Uvs;
uniform float u_paletteId;
uniform vec2 u_pixelSize;
uniform int u_Outlining;
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
        return mix(texture2D(u_palTexture, vec2(testPos.x - u_pixelSize.x, testPos.y)), texture2D(u_palTexture, testPos), fract(u_paletteId));
      }
    }
    return inCol;
}
void main()
{
	float halflambert = (max(dot(normalize(v_vNormal), normalize(u_Light)), 0.0) * 0.5) + 0.5;
	halflambert = min(halflambert, u_LightLevel);
	
	vec4 palcol = texture2D( gm_BaseTexture, v_vTexcoord );
	DoAlphaTest( palcol );
	if (u_Paletted == 1)
		palcol = findAltColor(palcol, u_Uvs.xy);
	vec4 col = v_vColour * palcol;
	if(col.a < 0.05)
		discard;
	
	if (u_Outlining == 0) {
		vec4 flashcol = col;
		flashcol.rgb = u_FlashCol.rgb;
		vec4 finalcol = mix(col, flashcol, u_FlashCol.a);
		vec3 shadedcol = vec3(finalcol.rgb * halflambert);
		gl_FragColor = vec4(mix(finalcol.rgb, shadedcol, u_ShadingMul - min(u_LightLevel-1.0, 0.0)), finalcol.a);
	} else {
		float sum = dot(col.rgb * col.rgb * col.a, vec3(1.));
		vec3 factor = vec3(1. - step(3., 3. - sum), 1., float(v_vNormal.y < 0.));
		gl_FragColor = vec4(factor, 1.);
	}
}