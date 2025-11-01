/*
originally created by: Clickteam
original rip by: Rhadamus
original port to GLSL by: Murix Studios
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
float fPixelWidth = 0.001;
float fPixelHeight = 0.001;
//Mess with these values (KEEP it as a decimal!)
//Vertical - 0 means no and 1 means yes.
float pDir = 0.0;
uniform float zDir;
//Self explanatory. Increase this value to make it stronger or weaker.
// 210.0 default
uniform float zoom;
//No black edges (Keep either 0.0 or 1.0)
float noWrap = 1.0;
void main ()
{
	float fB;
	float fC;
  
	vec2 posTex;
	vec4 color = vec4(0.0, 0.0, 0.0, 1.0);
  
	if(pDir == 0.0)
	{
		fB = 1.0 - (zoom * fPixelHeight);
	    fC = max(0.02, 1.0 + (fB - 1.0) * 4.0 * pow((v_vTexcoord.x - 0.5), 2.0));
    
	    float offsetY = (1.0 - fC) / 2.0;
	    posTex = v_vTexcoord * vec2(1.0, fC) + vec2(0.0, zDir * offsetY);
    
		if(noWrap == 0.0 || (posTex.y >= 0.0 && posTex.y <= 1.0))
		{
			gl_FragColor = v_vColour * texture2D(gm_BaseTexture, posTex);
		}
	} 
	
	else
	{
		fB = 1.0 - (zoom * fPixelWidth);
		fC = max(0.05, 1.0 + (fB - 1.0) * 4.0 * pow((v_vTexcoord.y - 0.5), 2.0));
		
		posTex = v_vTexcoord * vec2(fC, 1.0) + vec2((1.0 - fC) / 2.0, 0.0);
    
		if(noWrap == 0.0 || (posTex.x >= 0.0 && posTex.x <= 1.0))
		{
			gl_FragColor = v_vColour * texture2D(gm_BaseTexture, posTex);
		}
	
	}
  
}