varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_theta;
void main()
{
gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
vec3 yiqColor = mat3( 0.299, 1.0, 0.40462981, 0.587, -0.46081557, -1.0, 0.114, -0.53918443, 0.59537019 ) * gl_FragColor.rgb;
yiqColor.yz = mat2( cos( u_theta ), sin( u_theta ), -sin( u_theta ), cos( u_theta ) ) * yiqColor.yz;
gl_FragColor.rgb = mat3( 1.0, 1.0, 1.0, 0.5696804, -0.1620848, -0.6590654, 0.3235513, -0.3381869, 0.8901581 ) * yiqColor;
}