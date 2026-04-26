function __scribble_class_model(arg0, arg1) constructor
{
    static __submit = function(arg0, arg1, arg2)
    {
        if (__flushed)
            return undefined;
        
        __last_drawn = current_time;
        __pages_array[arg0].__submit(arg1, (__has_arabic || __has_thai || false) && arg2);
    };
    
    static __freeze = function()
    {
        if (!__frozen)
        {
            var _i = 0;
            
            repeat (__pages)
            {
                __pages_array[_i].__freeze();
                _i++;
            }
            
            __frozen = true;
        }
    };
    
    static __flush = function()
    {
        if (__flushed)
            return undefined;
        
        __reset();
        variable_struct_remove(global.__scribble_mcache_dict, __cache_name);
        __flushed = true;
    };
    
    static __reset = function()
    {
        var _i = 0;
        
        repeat (__pages)
        {
            __pages_array[_i].__flush();
            _i++;
        }
        
        __pages = 0;
        __width = 0;
        __height = 0;
        __min_x = 0;
        __min_y = 0;
        __max_x = 0;
        __max_y = 0;
        __valign = undefined;
        __fit_scale = 1;
        __pages_array = [];
    };
    
    static __get_bbox = function(arg0, arg1, arg2, arg3, arg4)
    {
        var _left, _right, _top, _bottom;
        
        if (arg0 != undefined)
        {
            if (arg0 < 0)
                __scribble_error("Page index ", arg0, " doesn't exist. Minimum page index is 0");
            
            if (arg0 >= __pages)
                __scribble_error("Page index ", arg0, " doesn't exist. Maximum page index is ", __pages - 1);
            
            var _page_data = __pages_array[arg0];
            _left = _page_data.__min_x;
            _top = _page_data.__min_y;
            _right = _page_data.__max_x;
            _bottom = _page_data.__max_y;
        }
        else
        {
            _left = __min_x;
            _top = __min_y;
            _right = __max_x;
            _bottom = __max_y;
        }
        
        if (__pad_bbox_l)
            _left -= arg1;
        else
            _right += arg1;
        
        if (__pad_bbox_t)
            _top -= arg2;
        else
            _bottom += arg2;
        
        if (__pad_bbox_r)
            _right += arg3;
        else
            _left -= arg3;
        
        if (__pad_bbox_b)
            _bottom += arg4;
        else
            _top -= arg4;
        
        return 
        {
            left: _left,
            top: _top,
            right: _right,
            bottom: _bottom
        };
    };
    
    static __get_bbox_revealed = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
    {
        __scribble_error("Getting the revealed glyph bounding box requires SCRIBBLE_ALLOW_GLYPH_DATA_GETTER to be set to <true>");
        var _glyph_grid = __get_glyph_data_grid(arg0);
        var _start = arg1 - 1;
        var _end = arg2 - 1;
        var _left, _right, _top, _bottom;
        
        if (_end < 0)
        {
            _left = ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_1);
            _top = ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_2);
            _right = ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_1);
            _bottom = ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_4);
        }
        else
        {
            _left = ds_grid_get_min(_glyph_grid, _start, UnknownEnum.Value_1, _end, UnknownEnum.Value_1);
            _top = ds_grid_get_min(_glyph_grid, _start, UnknownEnum.Value_2, _end, UnknownEnum.Value_2);
            _right = ds_grid_get_max(_glyph_grid, _start, UnknownEnum.Value_3, _end, UnknownEnum.Value_3);
            _bottom = ds_grid_get_max(_glyph_grid, _start, UnknownEnum.Value_4, _end, UnknownEnum.Value_4);
        }
        
        if (__pad_bbox_l)
            _left -= arg3;
        else
            _right += arg3;
        
        if (__pad_bbox_t)
            _top -= arg4;
        else
            _bottom += arg4;
        
        if (__pad_bbox_r)
            _right += arg5;
        else
            _left -= arg5;
        
        if (__pad_bbox_b)
            _bottom += arg6;
        else
            _bottom -= arg6;
        
        return 
        {
            left: _left,
            top: _top,
            right: _right,
            bottom: _bottom
        };
    };
    
    static __get_width = function(arg0)
    {
        return __fit_scale * __width;
    };
    
    static __get_height = function(arg0)
    {
        return __fit_scale * __height;
    };
    
    static __get_page_array = function()
    {
        return __pages_array;
    };
    
    static __get_page_count = function()
    {
        return __pages;
    };
    
    static __get_text = function(arg0)
    {
        if (arg0 < 0)
            __scribble_error("Page index ", arg0, " doesn't exist. Minimum page index is 0");
        
        if (arg0 >= __pages)
            __scribble_error("Page index ", arg0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        __scribble_error("Cannot get text, SCRIBBLE_ALLOW_TEXT_GETTER = <false>\nPlease set SCRIBBLE_ALLOW_TEXT_GETTER to <true> to get text");
        return __pages_array[arg0].__text;
    };
    
    static __get_glyph_data = function(arg0, arg1)
    {
        if (arg1 < 0)
            __scribble_error("Page index ", arg1, " doesn't exist. Minimum page index is 0");
        
        if (arg1 >= __pages)
            __scribble_error("Page index ", arg1, " doesn't exist. Maximum page index is ", __pages - 1);
        
        return __pages_array[arg1].__get_glyph_data(arg0);
    };
    
    static __get_wrapped = function()
    {
        return __wrapped;
    };
    
    static __get_line_count = function(arg0)
    {
        if (arg0 < 0)
            __scribble_error("Page index ", arg0, " doesn't exist. Minimum page index is 0");
        
        if (arg0 >= __pages)
            __scribble_error("Page index ", arg0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        return __pages_array[arg0].__line_count;
    };
    
    static __get_glyph_count = function(arg0)
    {
        if (arg0 < 0)
            __scribble_error("Page index ", arg0, " doesn't exist. Minimum page index is 0");
        
        if (arg0 >= __pages)
            __scribble_error("Page index ", arg0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        return __pages_array[arg0].__glyph_count - 1;
    };
    
    static __get_glyph_data_grid = function(arg0)
    {
        if (arg0 < 0)
            __scribble_error("Page index ", arg0, " doesn't exist. Minimum page index is 0");
        
        if (arg0 >= __pages)
            __scribble_error("Page index ", arg0, " doesn't exist. Maximum page index is ", __pages - 1);
        
        __scribble_error("Getting glyph data requires SCRIBBLE_ALLOW_GLYPH_DATA_GETTER to be set to <true>");
        return __pages_array[arg0].__glyph_grid;
    };
    
    static __new_page = function()
    {
        var _page_data = new __scribble_class_page();
        array_push(__pages_array, _page_data);
        __pages++;
        return _page_data;
    };
    
    static __finalize_vertex_buffers = function(arg0)
    {
        var _i = 0;
        
        repeat (array_length(__pages_array))
        {
            __pages_array[_i].__finalize_vertex_buffers(arg0);
            _i++;
        }
    };
    
    __cache_name = arg1;
    var _weak = variable_struct_get(global.__scribble_mcache_dict, __cache_name);
    
    if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
    {
        __scribble_trace("Warning! Rebuilding model \"", __cache_name, "\"");
        _weak.ref.__flush();
    }
    
    variable_struct_set(global.__scribble_mcache_dict, __cache_name, weak_ref_create(self));
    array_push(global.__scribble_mcache_name_array, __cache_name);
    __last_drawn = current_time;
    __frozen = undefined;
    __flushed = false;
    __uses_standard_font = false;
    __uses_msdf_font = false;
    __pages = 0;
    __width = 0;
    __height = 0;
    __min_x = 0;
    __min_y = 0;
    __max_x = 0;
    __max_y = 0;
    __valign = undefined;
    __fit_scale = 1;
    __wrapped = false;
    __pad_bbox_l = false;
    __pad_bbox_t = false;
    __pad_bbox_r = false;
    __pad_bbox_b = false;
    __has_r2l = false;
    __has_arabic = false;
    __has_thai = false;
    __has_hebrew = false;
    __has_devanagari = false;
    __has_animation = false;
    __pages_array = [];
    
    with (global.__scribble_generator_state)
    {
        __element = arg0;
        __glyph_count = 0;
        __control_count = 0;
        __word_count = 0;
        __line_count = 0;
        __line_height_min = 0;
        __line_height_max = 0;
        __model_max_width = 0;
        __model_max_height = 0;
        __overall_bidi = arg0.__bidi_hint;
        __uses_halign_left = false;
        __uses_halign_center = false;
        __uses_halign_right = false;
        __bezier_lengths_array = undefined;
    }
    
    __scribble_gen_1_model_limits_and_bezier_curves();
    __scribble_gen_2_parser();
    __scribble_gen_3_devanagari();
    __scribble_gen_4_build_words();
    __scribble_gen_5_finalize_bidi();
    __scribble_gen_6_build_lines();
    __scribble_gen_7_build_pages();
    __scribble_gen_8_position_glyphs();
    __scribble_gen_9_write_vbuffs();
    __scribble_gen_10_set_padding_flags();
}
