//Made by Charles "cCharkes" Greivelding
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec3 v_vNormal;
varying vec3 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    vec3 vertexPrecision = vec3(0.7);
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    vec4 viewPos = gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos;
    viewPos.xyz = floor((viewPos.xyz * vertexPrecision) + vec3(0.5)) / vertexPrecision;
 
    vec4 viewProj = gm_Matrices[MATRIX_PROJECTION] * viewPos;
    gl_Position = viewProj;
	
	v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal.x, in_Normal.y, in_Normal.z, 0.0)).xyz;
    
    vec2 uv = in_TextureCoord;
    v_vTexcoord = vec3(uv * viewProj.w, viewProj.w); // Affine texture projection
    
    v_vColour = in_Colour;
}