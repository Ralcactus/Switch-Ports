vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_custom(vertex_type_float1, vertex_usage_texcoord);
global.vFormat = vertex_format_end();

function vertex_create_face(_vbuff, _vec3A, _vec3B, _vec3C, _vec3D, _sprite, _reverse = false, _vec_float = 0, _spr_index = 0)
{
    var _tex = sprite_get_texture(_sprite, _spr_index);
    var _uvs = sprite_get_uvs(_sprite, _spr_index);
    var _uvSx = _uvs[0];
    var _uvSy = _uvs[1];
    var _uvEx = _uvs[2];
    var _uvEy = _uvs[3];
    
    if (_reverse)
    {
        vertex_position_3d(_vbuff, _vec3D.x, _vec3D.y, _vec3D.z);
        vertex_texcoord(_vbuff, _uvSx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3C.x, _vec3C.y, _vec3C.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3A.x, _vec3A.y, _vec3A.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3C.x, _vec3C.y, _vec3C.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3B.x, _vec3B.y, _vec3B.z);
        vertex_texcoord(_vbuff, _uvEx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3A.x, _vec3A.y, _vec3A.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
    }
    else
    {
        vertex_position_3d(_vbuff, _vec3A.x, _vec3A.y, _vec3A.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3B.x, _vec3B.y, _vec3B.z);
        vertex_texcoord(_vbuff, _uvEx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3C.x, _vec3C.y, _vec3C.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3A.x, _vec3A.y, _vec3A.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3C.x, _vec3C.y, _vec3C.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _vec3D.x, _vec3D.y, _vec3D.z);
        vertex_texcoord(_vbuff, _uvSx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
    }
}

function vertex_create_face_tile(_vbuff, _x, _y, _tileDepth, _tileW, _tileH, _tileHSep, _tileVSep, _xscale, _yscale, _tile, _ts_x, _reverse = false, _vec_float = 0)
{
    var _tex = tileset_get_texture(_tile);
    var _uvs = texture_get_uvs(_tex);
    var _tileTexels = 
    {
        width: texture_get_texel_width(_tex),
        height: texture_get_texel_height(_tex)
    };
    var _texX = _uvs[0] / _tileTexels.width;
    var _texY = _uvs[1] / _tileTexels.width;
    var _texW = (_uvs[2] / _tileTexels.width) - _texX;
    var _texH = (_uvs[3] / _tileTexels.width) - _texY;
    var _tiledX = _ts_x * (_tileW + (_tileHSep * 2));
	
    var _uvSx = _texX + (_tiledX % _texW) + _tileHSep;
    var _uvSy = _texY + ((_tiledX div _texW) * (_tileH + (_tileVSep * 2))) + _tileVSep;
    var _uvEx = _uvSx + _tileW;
    var _uvEy = _uvSy + _tileW;
	
    _uvSx *= _tileTexels.width;
    _uvSy *= _tileTexels.height;
    _uvEx *= _tileTexels.width;
    _uvEy *= _tileTexels.height;
	
    var _p1 = new Vec3(_x + (_tileW * (_xscale == -1)), _y + (_tileH * (_yscale == -1)), _tileDepth);
    var _p2 = new Vec3(_x + (_tileW * (_xscale == 1)), _y + (_tileH * (_yscale == -1)), _tileDepth);
    var _p3 = new Vec3(_x + (_tileW * (_xscale == 1)), _y + (_tileH * (_yscale == 1)), _tileDepth);
    var _p4 = new Vec3(_x + (_tileW * (_xscale == -1)), _y + (_tileH * (_yscale == 1)), _tileDepth);
    
    if (_reverse)
    {
        vertex_position_3d(_vbuff, _p4.x, _p4.y, _p4.z);
        vertex_texcoord(_vbuff, _uvSx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p3.x, _p3.y, _p3.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p1.x, _p1.y, _p1.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p3.x, _p3.y, _p3.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p2.x, _p2.y, _p2.z);
        vertex_texcoord(_vbuff, _uvEx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p1.x, _p1.y, _p1.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
    }
    else
    {
        vertex_position_3d(_vbuff, _p1.x, _p1.y, _p1.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p2.x, _p2.y, _p2.z);
        vertex_texcoord(_vbuff, _uvEx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p3.x, _p3.y, _p3.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p1.x, _p1.y, _p1.z);
        vertex_texcoord(_vbuff, _uvSx, _uvSy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p3.x, _p3.y, _p3.z);
        vertex_texcoord(_vbuff, _uvEx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
		
        vertex_position_3d(_vbuff, _p4.x, _p4.y, _p4.z);
        vertex_texcoord(_vbuff, _uvSx, _uvEy);
        vertex_float1(_vbuff, _vec_float);
    }
}

function map_create_face(_vbuff, _vec1, _vec2, _vec3, _vec4, _col)
{
    vertex_position(_vbuff, _vec1.x, _vec1.y);
    vertex_color(_vbuff, _col, 1);
	
    vertex_position(_vbuff, _vec2.x, _vec2.y);
    vertex_color(_vbuff, _col, 1);
	
    vertex_position(_vbuff, _vec3.x, _vec3.y);
    vertex_color(_vbuff, _col, 1);
	
    vertex_position(_vbuff, _vec1.x, _vec1.y);
    vertex_color(_vbuff, _col, 1);
	
    vertex_position(_vbuff, _vec3.x, _vec3.y);
    vertex_color(_vbuff, _col, 1);
	
    vertex_position(_vbuff, _vec4.x, _vec4.y);
    vertex_color(_vbuff, _col, 1);
}
