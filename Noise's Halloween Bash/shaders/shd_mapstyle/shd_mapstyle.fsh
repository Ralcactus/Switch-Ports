varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 u_Texel;
uniform vec2 u_Offset;
uniform vec4 u_UVs[5];
uniform sampler2D s_Patterns;
uniform sampler2D s_Surface0;
uniform sampler2D s_Surface1;
uniform sampler2D s_Surface2;
uniform sampler2D s_Surface3;
uniform vec3 u_OutlineCol[5];
vec4 pattern() {
	//get the rgb value of the current pixel (the actual pixel colour isn't used for colour here, it's only used to send data about a specific part of the map to the shader)
	vec4 rgbval[4];
	rgbval[0] = texture2D(s_Surface0, v_vTexcoord);
	rgbval[1] = texture2D(s_Surface1, v_vTexcoord);
	rgbval[2] = texture2D(s_Surface2, v_vTexcoord);
	rgbval[3] = texture2D(s_Surface3, v_vTexcoord);
	
	//red: used to send the current rooms state (has pumpkins, has crates, has nitros, has nothing)
	//green: 0.2 for no platforms, 0.4 for greyed out rooms, 0.6 for both, 0 for neither
	//blue: used for the inside of platforms
	
	//patterns
	vec2 pixPos = vec2(v_vTexcoord.x, v_vTexcoord.y) / u_Texel.zw;
	vec4 colour = vec4(0.);
	
	for (int surf = 0; surf < 4; ++surf) {
		vec4 newColour = vec4(0.);
		int curpat = int(rgbval[surf].r * 5.);
		bool zoomedout = (rgbval[surf].g > 0.1 && rgbval[surf].g < 0.4) || rgbval[surf].g > 0.5;
		float alpha = 1.0;
		if(zoomedout && rgbval[surf].b > 0.) {
			alpha = 0.0;
			curpat = 0;
		}
		if(rgbval[surf].g >= 0.4) // if the room is greyed out
			newColour.rgb = u_OutlineCol[curpat - 1].rgb / 2.0;
		else {
			if (curpat > 0) {
				vec4 curuv = u_UVs[curpat - 1];
				vec2 patSize = vec2(curuv[2] - curuv[0], curuv[3] - curuv[1]) / u_Texel.xy;
				vec2 patcoord = vec2(mod(pixPos.x + u_Offset[0], patSize.x), mod(pixPos.y + u_Offset[1], patSize.y)) * u_Texel.xy + curuv.xy;
				newColour = texture2D(s_Patterns, patcoord);
		
				//outline
				for(float oX = -2.; oX <= 2.; ++oX) {
					for(float oY = -2.; oY <= 2.; ++oY) {
						vec2 coord = v_vTexcoord + vec2(oX, oY) * u_Texel.zw;
						vec3 pixel;
						if (surf == 0) 
							pixel = texture2D(s_Surface0, coord).rgb;
						else if (surf == 1) 
							pixel = texture2D(s_Surface1, coord).rgb;
						else if (surf == 2) 
							pixel = texture2D(s_Surface2, coord).rgb;
						else if (surf == 3) 
							pixel = texture2D(s_Surface3, coord).rgb;
					
						if (curpat > 0 && (pixel.r == 0. || (zoomedout && pixel.b > 0.) || pixel.g >= 0.4))
							return vec4(u_OutlineCol[curpat - 1], 1.);
					}
				}
			}
		}
		
		alpha = float(curpat > 0);
		colour.a += alpha;
		colour.rgb += newColour.rgb * alpha;
	}
	colour /= 4.;
	return colour;
}
	
void main()
{	
	vec4 colour = pattern();
	
	//set pixel colour
	colour.a *= v_vColour.a;
	colour.rgb *= colour.a;
	gl_FragColor = colour;
}