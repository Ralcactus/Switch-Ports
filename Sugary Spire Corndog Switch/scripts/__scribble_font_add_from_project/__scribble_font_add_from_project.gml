function __scribble_font_add_from_project(arg0)
{
    var _name = font_get_name(arg0);
    
    if (ds_map_exists(global.__scribble_font_data, _name))
    {
        __scribble_trace("Warning! A font for \"", _name, "\" has already been added. Destroying the old font and creating a new one");
        ds_map_find_value(global.__scribble_font_data, _name).__destroy();
    }
    
    if (global.__scribble_default_font == undefined)
        global.__scribble_default_font = _name;
    
    var _is_krutidev = __scribble_asset_is_krutidev(arg0, 7);
    var _global_glyph_bidi_map = global.__scribble_glyph_data.__bidi_map;
    var _font_info = font_get_info(arg0);
    var _info_glyphs_dict = _font_info.glyphs;
    var _info_glyph_names = variable_struct_get_names(_info_glyphs_dict);
    var _size = array_length(_info_glyph_names);
    var _info_glyphs_array = array_create(array_length(_info_glyph_names));
    var _i = 0;
    
    repeat (_size)
    {
        var _glyph = _info_glyph_names[_i];
        var _struct = variable_struct_get(_info_glyphs_dict, _glyph);
        _info_glyphs_array[_i] = _struct;
        _i++;
    }
    
    var _asset = asset_get_index(_name);
    var _texture = font_get_texture(_asset);
    var _texture_uvs = font_get_uvs(_asset);
    var _texture_tw = texture_get_texel_width(_texture);
    var _texture_th = texture_get_texel_height(_texture);
    var _texture_w = (_texture_uvs[2] - _texture_uvs[0]) / _texture_tw;
    var _texture_h = (_texture_uvs[3] - _texture_uvs[1]) / _texture_th;
    var _texture_l = round(_texture_uvs[0] / _texture_tw);
    var _texture_t = round(_texture_uvs[1] / _texture_th);
    var _font_data = new __scribble_class_font(_name, _size, false);
    var _font_glyphs_map = _font_data.__glyphs_map;
    var _font_glyph_data_grid = _font_data.__glyph_data_grid;
    
    if (_is_krutidev)
        _font_data.__is_krutidev = true;
    
    _i = 0;
    
    repeat (_size)
    {
        var _glyph_dict = _info_glyphs_array[_i];
        var _unicode = _glyph_dict.char;
        var _bidi;
        
        if (_unicode >= 12288 && _unicode <= 12351)
        {
            _bidi = UnknownEnum.Value_1;
        }
        else if (_unicode >= 12352 && _unicode <= 12543)
        {
            _bidi = UnknownEnum.Value_3;
        }
        else if (_unicode >= 19968 && _unicode <= 40959)
        {
            _bidi = UnknownEnum.Value_3;
        }
        else if (_unicode >= 65280 && _unicode <= 65295)
        {
            _bidi = UnknownEnum.Value_1;
        }
        else if (_unicode >= 65306 && _unicode <= 65311)
        {
            _bidi = UnknownEnum.Value_1;
        }
        else if (_unicode >= 65371 && _unicode <= 65380)
        {
            _bidi = UnknownEnum.Value_1;
        }
        else
        {
            _bidi = ds_map_find_value(_global_glyph_bidi_map, _unicode);
            
            if (_bidi == undefined)
                _bidi = UnknownEnum.Value_4;
        }
        
        if (_is_krutidev)
        {
            if (_bidi != UnknownEnum.Value_0)
            {
                _bidi = UnknownEnum.Value_5;
                _unicode += 65535;
            }
        }
        
        var _char = chr(_unicode);
        var _x = variable_struct_get(_glyph_dict, "x");
        var _y = variable_struct_get(_glyph_dict, "y");
        var _w = _glyph_dict.w;
        var _h = _glyph_dict.h;
        var _u0 = _x * _texture_tw;
        var _v0 = _y * _texture_th;
        var _u1 = _u0 + (_w * _texture_tw);
        var _v1 = _v0 + (_h * _texture_th);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_0, _char);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_1, _unicode);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_2, _bidi);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_3, _glyph_dict.offset);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_4, 0);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_5, _w);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_6, _h);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_7, _h);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_8, _glyph_dict.shift);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_9, -_glyph_dict.offset);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_10, 1);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_11, _texture);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_12, _u0);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_13, _u1);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_14, _v0);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_15, _v1);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_16, undefined);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_17, undefined);
        ds_map_set(_font_glyphs_map, _unicode, _i);
        _i++;
    }
    
    _font_data.__calculate_font_height();
    var _GM_scaling = ds_grid_get(_font_glyph_data_grid, ds_map_find_value(_font_glyphs_map, 32), UnknownEnum.Value_6) / _font_info.size;
    
    if (_GM_scaling < 1)
    {
        __scribble_trace("Warning! Font \"", _name, "\" may have been scaled during compilation (font size = ", _font_info.size, ", space height = ", ds_grid_get(_font_glyph_data_grid, ds_map_find_value(_font_glyphs_map, 32), UnknownEnum.Value_6), ", scaling factor = ", _GM_scaling, ")");
        scribble_font_scale(_name, 1 / _GM_scaling);
    }
}
