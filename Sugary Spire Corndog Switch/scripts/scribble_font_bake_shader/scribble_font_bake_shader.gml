function scribble_font_bake_shader(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10 = 2048)
{
    if (!is_string(arg0))
    {
        __scribble_error("Fonts should be specified using their name as a string.\n(Input was an invalid datatype)");
        exit;
    }
    
    if (!is_string(arg1))
    {
        __scribble_error("Fonts should be specified using their name as a string.\n(Input was an invalid datatype)");
        exit;
    }
    
    if (arg0 == arg1)
    {
        __scribble_error("Source font and new font cannot share the same name");
        return undefined;
    }
    
    var _src_font_data = ds_map_find_value(global.__scribble_font_data, arg0);
    
    if (!is_struct(_src_font_data))
    {
        __scribble_error("Source font \"", arg0, "\" not found\n\"", arg1, "\" will not be available");
        return undefined;
    }
    
    if (_src_font_data.__msdf)
    {
        __scribble_error("Source font cannot be an MSDF font");
        return undefined;
    }
    
    var _src_glyph_grid = _src_font_data.__glyph_data_grid;
    var _glyph_count = ds_grid_width(_src_glyph_grid);
    var _new_font_data = new __scribble_class_font(arg1, _glyph_count, false);
    _new_font_data.__runtime = true;
    var _new_glyphs_grid = _new_font_data.__glyph_data_grid;
    _src_font_data.__copy_to(_new_font_data, false);
    var _vbuff_data_map = ds_map_create();
    var _line_x = 0;
    var _line_y = 0;
    var _line_height = 0;
    var _i = 0;
    
    repeat (_glyph_count)
    {
        _texture = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_11);
        var _width = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_5);
        var _height = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_6);
        var _u0 = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_12);
        var _v0 = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_14);
        var _u1 = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_13);
        var _v1 = ds_grid_get(_src_glyph_grid, _i, UnknownEnum.Value_15);
        
        if (is_numeric(_texture) || is_undefined(_texture))
        {
            _i++;
        }
        else
        {
            var _width_ext = _width + arg3 + arg4 + arg6;
            var _height_ext = _height + arg3 + arg5 + arg7;
            
            if ((_line_y + _height_ext) >= arg10)
            {
                __scribble_error("No space left on ", arg10, "x", arg10, " texture page\nPlease increase the size of the texture page");
                vertex_end(_vbuff);
                vertex_delete_buffer(_vbuff);
                exit;
            }
            
            if ((_line_x + _width_ext) >= arg10)
            {
                _line_x = 0;
                _line_y += _line_height;
                _line_height = 0;
            }
            
            var _vbuff_data = ds_map_find_value(_vbuff_data_map, string(_texture));
            var _vbuff;
            
            if (_vbuff_data == undefined)
            {
                _vbuff = vertex_create_buffer();
                vertex_begin(_vbuff, global.__scribble_passthrough_vertex_format);
                ds_map_set(_vbuff_data_map, string(_texture), 
                {
                    __vertex_buffer: _vbuff,
                    __texture: _texture
                });
            }
            else
            {
                _vbuff = _vbuff_data.__vertex_buffer;
            }
            
            var _l = arg4 + _line_x;
            var _t = arg5 + _line_y;
            var _r = _l + _width;
            var _b = _t + _height;
            vertex_position(_vbuff, _l, _t);
            vertex_color(_vbuff, c_white, 1);
            vertex_texcoord(_vbuff, _u0, _v0);
            vertex_position(_vbuff, _r, _t);
            vertex_color(_vbuff, c_white, 1);
            vertex_texcoord(_vbuff, _u1, _v0);
            vertex_position(_vbuff, _l, _b);
            vertex_color(_vbuff, c_white, 1);
            vertex_texcoord(_vbuff, _u0, _v1);
            vertex_position(_vbuff, _r, _t);
            vertex_color(_vbuff, c_white, 1);
            vertex_texcoord(_vbuff, _u1, _v0);
            vertex_position(_vbuff, _r, _b);
            vertex_color(_vbuff, c_white, 1);
            vertex_texcoord(_vbuff, _u1, _v1);
            vertex_position(_vbuff, _l, _b);
            vertex_color(_vbuff, c_white, 1);
            vertex_texcoord(_vbuff, _u0, _v1);
            ds_grid_set(_new_glyphs_grid, _i, UnknownEnum.Value_12, _line_x);
            ds_grid_set(_new_glyphs_grid, _i, UnknownEnum.Value_14, _line_y);
            ds_grid_set(_new_glyphs_grid, _i, UnknownEnum.Value_13, _line_x + _width + arg4 + arg6);
            ds_grid_set(_new_glyphs_grid, _i, UnknownEnum.Value_15, _line_y + _height + arg5 + arg7);
            _line_x += _width_ext;
            _line_height = max(_line_height, _height_ext);
            _i++;
        }
    }
    
    var _surface_0 = surface_create(arg10, arg10);
    surface_set_target(_surface_0);
    draw_clear_alpha(c_white, 0);
    gpu_set_blendenable(false);
    var _vbuff_data_array = ds_map_values_to_array(_vbuff_data_map);
    _i = 0;
    
    repeat (array_length(_vbuff_data_array))
    {
        var _vbuff_data = _vbuff_data_array[_i];
        var _vbuff = _vbuff_data.__vertex_buffer;
        vertex_end(_vbuff);
        vertex_submit(_vbuff, pr_trianglelist, _vbuff_data.__texture);
        vertex_delete_buffer(_vbuff);
        _i++;
    }
    
    ds_map_destroy(_vbuff_data_map);
    var _surface_1 = surface_create(arg10, arg10);
    gpu_set_blendenable(true);
    surface_reset_target();
    var _texture = surface_get_texture(_surface_0);
    surface_set_target(_surface_1);
    draw_clear_alpha(c_white, 0);
    var _old_filter = gpu_get_tex_filter();
    gpu_set_tex_filter(arg9);
    gpu_set_blendenable(false);
    shader_set(arg2);
    shader_set_uniform_f(shader_get_uniform(arg2, "u_vTexel"), texture_get_texel_width(_texture), texture_get_texel_height(_texture));
    draw_surface(_surface_0, 0, 0);
    shader_reset();
    gpu_set_tex_filter(_old_filter);
    gpu_set_blendenable(true);
    surface_reset_target();
    surface_free(_surface_0);
    var _sprite = sprite_create_from_surface(_surface_1, 0, 0, arg10, arg10, false, false, 0, 0);
    _new_font_data.__source_sprite = _sprite;
    surface_free(_surface_1);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_3, _glyph_count - 1, UnknownEnum.Value_3, -arg4);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_4, _glyph_count - 1, UnknownEnum.Value_4, -arg5);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_5, _glyph_count - 1, UnknownEnum.Value_5, arg4 + arg6);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_6, _glyph_count - 1, UnknownEnum.Value_6, arg5 + arg7);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_7, _glyph_count - 1, UnknownEnum.Value_7, arg5 + arg7);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_8, _glyph_count - 1, UnknownEnum.Value_8, arg8);
    ds_grid_set_region(_new_glyphs_grid, 0, UnknownEnum.Value_11, _glyph_count - 1, UnknownEnum.Value_11, sprite_get_texture(_sprite, 0));
    ds_grid_set_region(_new_glyphs_grid, 0, UnknownEnum.Value_17, _glyph_count - 1, UnknownEnum.Value_17, arg9);
    var _sprite_uvs = sprite_get_uvs(_sprite, 0);
    var _sprite_u0 = _sprite_uvs[0];
    var _sprite_v0 = _sprite_uvs[1];
    var _sprite_u1 = _sprite_uvs[2];
    var _sprite_v1 = _sprite_uvs[3];
    ds_grid_multiply_region(_new_glyphs_grid, 0, UnknownEnum.Value_12, _glyph_count - 1, UnknownEnum.Value_15, 1 / arg10);
    ds_grid_multiply_region(_new_glyphs_grid, 0, UnknownEnum.Value_12, _glyph_count - 1, UnknownEnum.Value_13, _sprite_u1 - _sprite_u0);
    ds_grid_multiply_region(_new_glyphs_grid, 0, UnknownEnum.Value_14, _glyph_count - 1, UnknownEnum.Value_15, _sprite_v1 - _sprite_v0);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_12, _glyph_count - 1, UnknownEnum.Value_13, _sprite_u0);
    ds_grid_add_region(_new_glyphs_grid, 0, UnknownEnum.Value_14, _glyph_count - 1, UnknownEnum.Value_15, _sprite_v0);
}
