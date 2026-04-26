function __scribble_font_add_msdf_from_project(arg0)
{
    var _name = sprite_get_name(arg0);
    
    if (ds_map_exists(global.__scribble_font_data, _name))
    {
        __scribble_trace("Warning! An MSDF font for \"", _name, "\" has already been added. Destroying the old MSDF font and creating a new one");
        ds_map_find_value(global.__scribble_font_data, _name).__destroy();
    }
    
    if (global.__scribble_default_font == undefined)
        global.__scribble_default_font = _name;
    
    var _is_krutidev = __scribble_asset_is_krutidev(arg0, 1);
    var _global_glyph_bidi_map = global.__scribble_glyph_data.__bidi_map;
    var _sprite_width = sprite_get_width(arg0);
    var _sprite_height = sprite_get_height(arg0);
    var _sprite_uvs = sprite_get_uvs(arg0, 0);
    var _texture = sprite_get_texture(arg0, 0);
    var _texel_w = texture_get_texel_width(_texture);
    var _texel_h = texture_get_texel_height(_texture);
    _sprite_uvs[0] -= _texel_w * _sprite_uvs[4];
    _sprite_uvs[1] -= _texel_h * _sprite_uvs[5];
    _sprite_uvs[2] += _texel_w * _sprite_width * (1 - _sprite_uvs[6]);
    _sprite_uvs[3] += _texel_h * _sprite_height * (1 - _sprite_uvs[7]);
    var _json_buffer = buffer_load(global.__scribble_font_directory + _name + ".json");
    
    if (_json_buffer < 0)
        _json_buffer = buffer_load(global.__scribble_font_directory + _name);
    
    if (_json_buffer < 0)
        __scribble_error("Could not find \"", global.__scribble_font_directory + _name + ".json\"\nPlease add it to the project's Included Files");
    
    var _json_string = buffer_read(_json_buffer, buffer_text);
    buffer_delete(_json_buffer);
    var _json = json_decode(_json_string);
    var _metrics_map = ds_map_find_value(_json, "metrics");
    var _json_glyph_list = ds_map_find_value(_json, "glyphs");
    var _atlas_map = ds_map_find_value(_json, "atlas");
    var _em_size = ds_map_find_value(_atlas_map, "size");
    var _msdf_pxrange = ds_map_find_value(_atlas_map, "distanceRange");
    var _json_line_height = _em_size * ds_map_find_value(_metrics_map, "lineHeight");
    var _size = ds_list_size(_json_glyph_list);
    var _font_data = new __scribble_class_font(_name, _size, true);
    _font_data.__runtime = true;
    var _font_glyphs_map = _font_data.__glyphs_map;
    var _font_glyph_data_grid = _font_data.__glyph_data_grid;
    
    if (_is_krutidev)
        _font_data.__is_krutidev = true;
    
    _font_data.__msdf_pxrange = _msdf_pxrange;
    var _i = 0;
    
    repeat (_size)
    {
        var _json_glyph_map = ds_list_find_value(_json_glyph_list, _i);
        var _plane_map = ds_map_find_value(_json_glyph_map, "planeBounds");
        _atlas_map = ds_map_find_value(_json_glyph_map, "atlasBounds");
        var _unicode = ds_map_find_value(_json_glyph_map, "unicode");
        var _char = chr(_unicode);
        var _tex_r, _tex_l, _tex_b, _tex_t;
        
        if (_atlas_map != undefined)
        {
            _tex_l = ds_map_find_value(_atlas_map, "left") + 1;
            _tex_t = (_sprite_height - ds_map_find_value(_atlas_map, "top")) + 1;
            _tex_r = ds_map_find_value(_atlas_map, "right") - 1;
            _tex_b = _sprite_height - ds_map_find_value(_atlas_map, "bottom") - 1;
        }
        else
        {
            _tex_l = 0;
            _tex_t = 0;
            _tex_r = 0;
            _tex_b = 0;
        }
        
        var _w = _tex_r - _tex_l;
        var _h = _tex_b - _tex_t;
        var _xoffset, _yoffset, _xadvance;
        
        if (_plane_map != undefined)
        {
            _xoffset = _em_size * ds_map_find_value(_plane_map, "left");
            _yoffset = _em_size - (_em_size * ds_map_find_value(_plane_map, "top"));
            _xadvance = round(_em_size * ds_map_find_value(_json_glyph_map, "advance"));
        }
        else
        {
            _xoffset = 0;
            _yoffset = 0;
            _xadvance = round(_em_size * ds_map_find_value(_json_glyph_map, "advance"));
        }
        
        var _u0 = lerp(_sprite_uvs[0], _sprite_uvs[2], _tex_l / _sprite_width);
        var _v0 = lerp(_sprite_uvs[1], _sprite_uvs[3], _tex_t / _sprite_height);
        var _u1 = lerp(_sprite_uvs[0], _sprite_uvs[2], _tex_r / _sprite_width);
        var _v1 = lerp(_sprite_uvs[1], _sprite_uvs[3], _tex_b / _sprite_height);
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
        
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_0, _char);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_1, _unicode);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_2, _bidi);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_3, _xoffset);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_4, _yoffset);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_5, _w);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_6, _h);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_7, _json_line_height);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_8, _xadvance);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_9, 1 - _xoffset - (0.5 * _msdf_pxrange));
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_10, 1);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_11, _texture);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_12, _u0);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_14, _v0);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_13, _u1);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_15, _v1);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_16, _msdf_pxrange);
        ds_grid_set(_font_glyph_data_grid, _i, UnknownEnum.Value_17, true);
        ds_map_set(_font_glyphs_map, _unicode, _i);
        _i++;
    }
    
    var _space_index = ds_map_find_value(_font_glyphs_map, 32);
    
    if (_space_index == undefined)
    {
        __scribble_error("Space character not found in character string for MSDF font \"", _name, "\"");
    }
    else
    {
        ds_grid_set(_font_glyph_data_grid, _space_index, UnknownEnum.Value_5, ds_grid_get(_font_glyph_data_grid, _space_index, UnknownEnum.Value_8));
        ds_grid_set(_font_glyph_data_grid, _space_index, UnknownEnum.Value_6, _json_line_height);
    }
    
    ds_map_destroy(_json);
    _font_data.__calculate_font_height();
}
