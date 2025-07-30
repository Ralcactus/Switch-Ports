function scribble_font_bake_shader(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10 = 2048)
{
    static _font_data_map = __scribble_get_font_data_map();
    static _vertex_format = undefined;
    
    if (!is_string(argument0))
    {
        __scribble_error("Fonts should be specified using their name as a string.\n(Input was an invalid datatype)");
        exit;
    }
    
    if (!is_string(argument1))
    {
        __scribble_error("Fonts should be specified using their name as a string.\n(Input was an invalid datatype)");
        exit;
    }
    
    if (argument0 == argument1)
    {
        __scribble_error("Source font and new font cannot share the same name");
        return undefined;
    }
    
    var _src_font_data = ds_map_find_value(_font_data_map, argument0);
    
    if (!is_struct(_src_font_data))
    {
        __scribble_error("Source font \"", argument0, "\" not found\n\"", argument1, "\" will not be available");
        return undefined;
    }
    
    if (_src_font_data.__msdf)
    {
        __scribble_error("Source font cannot be an MSDF font");
        return undefined;
    }
    
    var _src_glyph_grid = _src_font_data.__glyph_data_grid;
    var _glyph_count = ds_grid_width(_src_glyph_grid);
    var _new_font_data = new __scribble_class_font(argument1, _glyph_count, false);
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
        _texture = ds_grid_get(_src_glyph_grid, _i, (11 << 0));
        var _width = ds_grid_get(_src_glyph_grid, _i, (5 << 0));
        var _height = ds_grid_get(_src_glyph_grid, _i, (6 << 0));
        var _u0 = ds_grid_get(_src_glyph_grid, _i, (12 << 0));
        var _v0 = ds_grid_get(_src_glyph_grid, _i, (14 << 0));
        var _u1 = ds_grid_get(_src_glyph_grid, _i, (13 << 0));
        var _v1 = ds_grid_get(_src_glyph_grid, _i, (15 << 0));
        
        if (is_numeric(_texture) || is_undefined(_texture))
        {
            _i++;
        }
        else
        {
            var _width_ext = _width + argument3 + argument4 + argument6;
            var _height_ext = _height + argument3 + argument5 + argument7;
            
            if ((_line_y + _height_ext) >= argument10)
            {
                __scribble_error("No space left on ", argument10, "x", argument10, " texture page\nPlease increase the size of the texture page");
                vertex_end(_vbuff);
                vertex_delete_buffer(_vbuff);
                exit;
            }
            
            if ((_line_x + _width_ext) >= argument10)
            {
                _line_x = 0;
                _line_y += _line_height;
                _line_height = 0;
            }
            
            var _vbuff_data = ds_map_find_value(_vbuff_data_map, string(_texture));
            var _vbuff;
            
            if (_vbuff_data == undefined)
            {
                if (_vertex_format == undefined)
                {
                    vertex_format_begin();
                    vertex_format_add_position();
                    vertex_format_add_color();
                    vertex_format_add_texcoord();
                    _vertex_format = vertex_format_end();
                }
                
                _vbuff = vertex_create_buffer();
                vertex_begin(_vbuff, _vertex_format);
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
            
            var _l = argument4 + _line_x;
            var _t = argument5 + _line_y;
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
            ds_grid_set(_new_glyphs_grid, _i, (12 << 0), _line_x);
            ds_grid_set(_new_glyphs_grid, _i, (14 << 0), _line_y);
            ds_grid_set(_new_glyphs_grid, _i, (13 << 0), _line_x + _width + argument4 + argument6);
            ds_grid_set(_new_glyphs_grid, _i, (15 << 0), _line_y + _height + argument5 + argument7);
            _line_x += _width_ext;
            _line_height = max(_line_height, _height_ext);
            _i++;
        }
    }
    
    var _surface_0 = surface_create(argument10, argument10);
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
    var _surface_1 = surface_create(argument10, argument10);
    gpu_set_blendenable(true);
    surface_reset_target();
    var _texture = surface_get_texture(_surface_0);
    surface_set_target(_surface_1);
    draw_clear_alpha(c_white, 0);
    var _old_filter = gpu_get_tex_filter();
    gpu_set_tex_filter(argument9);
    gpu_set_blendenable(false);
    shader_set(argument2);
    shader_set_uniform_f(shader_get_uniform(argument2, "u_vTexel"), texture_get_texel_width(_texture), texture_get_texel_height(_texture));
    draw_surface(_surface_0, 0, 0);
    shader_reset();
    gpu_set_tex_filter(_old_filter);
    gpu_set_blendenable(true);
    surface_reset_target();
    surface_free(_surface_0);
    var _sprite = sprite_create_from_surface(_surface_1, 0, 0, argument10, argument10, false, false, 0, 0);
    _new_font_data.__source_sprite = _sprite;
    surface_free(_surface_1);
    ds_grid_add_region(_new_glyphs_grid, 0, (3 << 0), _glyph_count - 1, (3 << 0), -argument4);
    ds_grid_add_region(_new_glyphs_grid, 0, (4 << 0), _glyph_count - 1, (4 << 0), -argument5);
    ds_grid_add_region(_new_glyphs_grid, 0, (5 << 0), _glyph_count - 1, (5 << 0), argument4 + argument6);
    ds_grid_add_region(_new_glyphs_grid, 0, (6 << 0), _glyph_count - 1, (6 << 0), argument5 + argument7);
    ds_grid_add_region(_new_glyphs_grid, 0, (7 << 0), _glyph_count - 1, (7 << 0), argument5 + argument7);
    ds_grid_add_region(_new_glyphs_grid, 0, (8 << 0), _glyph_count - 1, (8 << 0), argument8);
    ds_grid_set_region(_new_glyphs_grid, 0, (11 << 0), _glyph_count - 1, (11 << 0), sprite_get_texture(_sprite, 0));
    ds_grid_set_region(_new_glyphs_grid, 0, (18 << 0), _glyph_count - 1, (18 << 0), argument9);
    var _sprite_uvs = sprite_get_uvs(_sprite, 0);
    var _sprite_u0 = _sprite_uvs[0];
    var _sprite_v0 = _sprite_uvs[1];
    var _sprite_u1 = _sprite_uvs[2];
    var _sprite_v1 = _sprite_uvs[3];
    ds_grid_multiply_region(_new_glyphs_grid, 0, (12 << 0), _glyph_count - 1, (15 << 0), 1 / argument10);
    ds_grid_multiply_region(_new_glyphs_grid, 0, (12 << 0), _glyph_count - 1, (13 << 0), _sprite_u1 - _sprite_u0);
    ds_grid_multiply_region(_new_glyphs_grid, 0, (14 << 0), _glyph_count - 1, (15 << 0), _sprite_v1 - _sprite_v0);
    ds_grid_add_region(_new_glyphs_grid, 0, (12 << 0), _glyph_count - 1, (13 << 0), _sprite_u0);
    ds_grid_add_region(_new_glyphs_grid, 0, (14 << 0), _glyph_count - 1, (15 << 0), _sprite_v0);
}
