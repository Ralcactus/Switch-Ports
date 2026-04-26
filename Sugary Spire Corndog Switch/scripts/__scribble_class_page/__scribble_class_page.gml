function __scribble_class_page() constructor
{
    static __submit = function(arg0, arg1)
    {
        if (true && !__frozen && (current_time - __created_time) > ((0.95 * game_get_speed(gamespeed_microseconds)) / 1000))
            __freeze();
        
        var _shader = undefined;
        var _i = 0;
        
        repeat (array_length(__vertex_buffer_array))
        {
            var _data = __vertex_buffer_array[_i];
            var _bilinear = _data[UnknownEnum.Value_7];
            
            if (_data[UnknownEnum.Value_5] != _shader)
            {
                _shader = _data[UnknownEnum.Value_5];
                shader_set(_shader);
            }
            
            var _old_tex_filter;
            
            if (_bilinear != undefined)
            {
                _old_tex_filter = gpu_get_tex_filter();
                gpu_set_tex_filter(_bilinear);
            }
            
            if (_shader == __shd_scribble_msdf)
            {
                shader_set_uniform_f(global.__scribble_msdf_u_vTexel, _data[UnknownEnum.Value_3], _data[UnknownEnum.Value_4]);
                shader_set_uniform_f(global.__scribble_msdf_u_fMSDFRange, arg0 * _data[UnknownEnum.Value_2]);
                vertex_submit(_data[UnknownEnum.Value_0], pr_trianglelist, _data[UnknownEnum.Value_1]);
                
                if (arg1)
                {
                    shader_set_uniform_f(global.__scribble_msdf_u_fSecondDraw, 1);
                    vertex_submit(_data[UnknownEnum.Value_0], pr_trianglelist, _data[UnknownEnum.Value_1]);
                    shader_set_uniform_f(global.__scribble_msdf_u_fSecondDraw, 0);
                }
            }
            else
            {
                vertex_submit(_data[UnknownEnum.Value_0], pr_trianglelist, _data[UnknownEnum.Value_1]);
            }
            
            if (_bilinear != undefined)
                gpu_set_tex_filter(_old_tex_filter);
            
            _i++;
        }
        
        shader_reset();
    };
    
    static __freeze = function()
    {
        if (!__frozen)
        {
            var _i = 0;
            
            repeat (array_length(__vertex_buffer_array))
            {
                vertex_freeze(__vertex_buffer_array[_i][UnknownEnum.Value_0]);
                _i++;
            }
            
            __frozen = true;
        }
    };
    
    static __get_glyph_data = function(arg0)
    {
        __scribble_error("Cannot get glyph data, SCRIBBLE_ALLOW_GLYPH_DATA_GETTER = <false>\nPlease set SCRIBBLE_ALLOW_GLYPH_DATA_GETTER to <true> to get glyph data");
        
        if (arg0 < 1)
        {
            return 
            {
                unicode: 0,
                left: ds_grid_get(__glyph_grid, 0, UnknownEnum.Value_1),
                top: ds_grid_get(__glyph_grid, 0, UnknownEnum.Value_2),
                right: ds_grid_get(__glyph_grid, 0, UnknownEnum.Value_1),
                bottom: ds_grid_get(__glyph_grid, 0, UnknownEnum.Value_2)
            };
        }
        else if (arg0 <= __glyph_count)
        {
            return 
            {
                unicode: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_0),
                left: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_1),
                top: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_2),
                right: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_3),
                bottom: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_4)
            };
        }
        else
        {
            arg0 = __glyph_count - 1;
            return 
            {
                unicode: 0,
                left: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_3),
                top: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_4),
                right: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_3),
                bottom: ds_grid_get(__glyph_grid, arg0, UnknownEnum.Value_4)
            };
        }
    };
    
    static __get_vertex_buffer = function(arg0, arg1, arg2, arg3)
    {
        var _pointer_string = string(arg0);
        var _data = variable_struct_get(__texture_to_vertex_buffer_dict, _pointer_string);
        
        if (_data == undefined)
        {
            var _shader;
            
            if (arg1 == undefined)
            {
                arg3.__uses_standard_font = true;
                _shader = __shd_scribble;
            }
            else
            {
                arg3.__uses_msdf_font = true;
                _shader = __shd_scribble_msdf;
            }
            
            var _vbuff = vertex_create_buffer();
            vertex_begin(_vbuff, global.__scribble_vertex_format);
            __scribble_gc_add_vbuff(self, _vbuff);
            _data = array_create(UnknownEnum.Value_8);
            _data[UnknownEnum.Value_0] = _vbuff;
            _data[UnknownEnum.Value_1] = arg0;
            _data[UnknownEnum.Value_2] = arg1;
            _data[UnknownEnum.Value_3] = texture_get_texel_width(arg0);
            _data[UnknownEnum.Value_4] = texture_get_texel_height(arg0);
            _data[UnknownEnum.Value_5] = _shader;
            _data[UnknownEnum.Value_7] = arg2;
            __vertex_buffer_array[array_length(__vertex_buffer_array)] = _data;
            variable_struct_set(__texture_to_vertex_buffer_dict, _pointer_string, _data);
            return _vbuff;
        }
        else
        {
            return _data[UnknownEnum.Value_0];
        }
    };
    
    static __finalize_vertex_buffers = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(__vertex_buffer_array))
        {
            var _vbuff = __vertex_buffer_array[_i][UnknownEnum.Value_0];
            vertex_end(_vbuff);
            
            if (arg0)
                vertex_freeze(_vbuff);
            
            _i++;
        }
        
        __frozen = arg0;
    };
    
    static __flush = function()
    {
        var _i = 0;
        
        repeat (array_length(__vertex_buffer_array))
        {
            var _vbuff = __vertex_buffer_array[_i][UnknownEnum.Value_0];
            vertex_delete_buffer(_vbuff);
            __scribble_gc_remove_vbuff(_vbuff);
            _i++;
        }
        
        __texture_to_vertex_buffer_dict = {};
        array_resize(__vertex_buffer_array, 0);
    };
    
    __text = "";
    __glyph_grid = undefined;
    __created_time = current_time;
    __frozen = undefined;
    __character_count = 0;
    __glyph_start = undefined;
    __glyph_end = undefined;
    __glyph_count = 0;
    __line_start = undefined;
    __line_end = undefined;
    __line_count = 0;
    __width = 0;
    __height = 0;
    __min_x = 0;
    __min_y = 0;
    __max_x = 0;
    __max_y = 0;
    __vertex_buffer_array = [];
    __texture_to_vertex_buffer_dict = {};
    __events = {};
    __region_array = [];
}
