function __scribble_class_element(arg0, arg1) constructor
{
    static draw = function(arg0, arg1, arg2 = undefined)
    {
        var _function_scope = other;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return undefined;
        
        if ((current_time - __last_drawn) > ((0.95 * game_get_speed(gamespeed_microseconds)) / 1000))
        {
            __animation_time += (__animation_speed * (delta_time / 16666));
            __animation_time %= 16383;
        }
        
        __last_drawn = current_time;
        
        if ((global.__scribble_anim_blink_on_duration + global.__scribble_anim_blink_off_duration) > 0)
            __animation_blink_state = ((__animation_time + global.__scribble_anim_blink_time_offset) % (global.__scribble_anim_blink_on_duration + global.__scribble_anim_blink_off_duration)) < global.__scribble_anim_blink_on_duration;
        else
            __animation_blink_state = true;
        
        if (_model.__uses_standard_font)
            __set_standard_uniforms(arg2, _function_scope);
        
        if (_model.__uses_msdf_font)
            __set_msdf_uniforms(arg2, _function_scope);
        
        var _old_matrix = matrix_get(2);
        var _matrix = matrix_multiply(__update_matrix(_model, arg0, arg1), _old_matrix);
        matrix_set(2, _matrix);
        _model.__submit(__page, __msdf_feather_thickness, __msdf_border_thickness > 0 || __msdf_shadow_alpha > 0);
        matrix_set(2, _old_matrix);
        __scribble_gc_collect();
        return global.__scribble_null_element;
    };
    
    static starting_format = function(arg0, arg1)
    {
        if (is_string(arg0))
        {
            if (arg0 != __starting_font)
            {
                __model_cache_name_dirty = true;
                __starting_font = arg0;
            }
        }
        else if (!is_undefined(arg0))
        {
            __scribble_error("Fonts should be specified using their name as a string\nUse <undefined> to not set a new font");
        }
        
        if (arg1 != undefined)
        {
            var _colour = __scribble_process_colour(arg1);
            
            if (_colour != undefined && _colour >= 0 && _colour != __starting_colour)
            {
                __model_cache_name_dirty = true;
                __starting_colour = _colour & 16777215;
            }
        }
        
        return self;
    };
    
    static align = function(arg0, arg1)
    {
        if (arg0 == "pin_left")
            arg0 = 3;
        
        if (arg0 == "pin_centre")
            arg0 = 4;
        
        if (arg0 == "pin_center")
            arg0 = 4;
        
        if (arg0 == "pin_right")
            arg0 = 5;
        
        if (arg0 == "fa_justify")
            arg0 = 6;
        
        if (arg0 != __starting_halign)
        {
            __model_cache_name_dirty = true;
            __starting_halign = arg0;
        }
        
        if (arg1 != __starting_valign)
        {
            __model_cache_name_dirty = true;
            __starting_valign = arg1;
        }
        
        return self;
    };
    
    static blend = function(arg0, arg1)
    {
        if (is_string(arg0))
        {
            arg0 = variable_struct_get(global.__scribble_colours, arg0);
            
            if (arg0 == undefined)
            {
                __scribble_error("Colour name \"", arg0, "\" not recognised");
                exit;
            }
        }
        
        if (arg0 != undefined)
            __blend_colour = arg0 & 16777215;
        
        if (arg1 != undefined)
            __blend_alpha = arg1;
        
        return self;
    };
    
    static gradient = function(arg0, arg1)
    {
        if (is_string(arg0))
        {
            arg0 = variable_struct_get(global.__scribble_colours, arg0);
            
            if (arg0 == undefined)
            {
                __scribble_error("Colour name \"", arg0, "\" not recognised");
                exit;
            }
        }
        
        __gradient_colour = arg0 & 16777215;
        __gradient_alpha = arg1;
        return self;
    };
    
    static fog = function()
    {
        __scribble_error(".fog() has been replaced by .flash()");
    };
    
    static flash = function(arg0, arg1)
    {
        if (is_string(arg0))
        {
            arg0 = variable_struct_get(global.__scribble_colours, arg0);
            
            if (arg0 == undefined)
            {
                __scribble_error("Colour name \"", arg0, "\" not recognised");
                exit;
            }
        }
        
        __flash_colour = arg0 & 16777215;
        __flash_alpha = arg1;
        return self;
    };
    
    static origin = function(arg0, arg1)
    {
        if (__origin_x != arg0 || __origin_y != arg1)
        {
            __matrix_dirty = true;
            __bbox_dirty = true;
            __origin_x = arg0;
            __origin_y = arg1;
        }
        
        return self;
    };
    
    static transform = function(arg0, arg1 = arg0, arg2 = 0)
    {
        if (__xscale != arg0 || __yscale != arg1 || __angle != arg2)
        {
            __matrix_dirty = true;
            __bbox_dirty = true;
            __xscale = arg0;
            __yscale = arg1;
            __angle = arg2;
        }
        
        return self;
    };
    
    static skew = function(arg0, arg1)
    {
        __skew_x = arg0;
        __skew_y = arg1;
        return self;
    };
    
    static scale_to_box = function(arg0, arg1)
    {
        arg0 = (arg0 == undefined || arg0 < 0) ? 0 : arg0;
        arg1 = (arg1 == undefined || arg1 < 0) ? 0 : arg1;
        
        if (arg0 != __scale_to_box_max_width || arg1 != __scale_to_box_max_height)
        {
            __scale_to_box_max_width = arg0;
            __scale_to_box_max_height = arg1;
            __scale_to_box_dirty = true;
        }
        
        return self;
    };
    
    static wrap = function(arg0, arg1 = -1, arg2 = false)
    {
        if (arg0 != __wrap_max_width || arg1 != __wrap_max_height || arg2 != __wrap_per_char || __wrap_no_pages || __wrap_max_scale != 1)
        {
            __model_cache_name_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __wrap_max_width = arg0;
            __wrap_max_height = arg1;
            __wrap_per_char = arg2;
            __wrap_no_pages = false;
            __wrap_max_scale = 1;
        }
        
        return self;
    };
    
    static fit_to_box = function(arg0, arg1, arg2 = false, arg3 = 1)
    {
        if (arg0 != __wrap_max_width || arg1 != __wrap_max_height || arg2 != __wrap_per_char || !__wrap_no_pages || arg3 != __wrap_max_scale)
        {
            __model_cache_name_dirty = true;
            __matrix_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __wrap_max_width = arg0;
            __wrap_max_height = arg1;
            __wrap_per_char = arg2;
            __wrap_no_pages = true;
            __wrap_max_scale = arg3;
        }
        
        return self;
    };
    
    static line_height = function(arg0, arg1)
    {
        if (arg0 != __line_height_min)
        {
            __model_cache_name_dirty = true;
            __line_height_min = arg0;
        }
        
        if (arg1 != __line_height_max)
        {
            __model_cache_name_dirty = true;
            __line_height_max = arg1;
        }
        
        return self;
    };
    
    static line_spacing = function(arg0)
    {
        if (arg0 != __line_spacing)
        {
            __model_cache_name_dirty = true;
            __line_spacing = arg0;
        }
        
        return self;
    };
    
    static padding = function(arg0, arg1, arg2, arg3)
    {
        if (arg0 != __padding_l || arg1 != __padding_t || arg2 != __padding_r || arg3 != __padding_b)
        {
            __model_cache_name_dirty = true;
            __matrix_dirty = true;
            __bbox_dirty = true;
            __scale_to_box_dirty = true;
            __padding_l = arg0;
            __padding_t = arg1;
            __padding_r = arg2;
            __padding_b = arg3;
        }
        
        return self;
    };
    
    static bezier = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
    {
        if (argument_count <= 0)
        {
            _bezier_array = array_create(6, 0);
        }
        else if (argument_count == 8)
        {
            if (!is_numeric(arg0) || !is_numeric(arg1) || !is_numeric(arg2) || !is_numeric(arg3) || !is_numeric(arg4) || !is_numeric(arg5) || !is_numeric(arg6) || !is_numeric(arg7))
            {
                __scribble_trace("Warning! One or more Bezier parameters were not numeric (", arg0, ", ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, ", ", arg5, ", ", arg6, ", ", arg7, ")");
                arg0 = 0;
                arg1 = 0;
                arg2 = 0;
                arg3 = 0;
                arg4 = 0;
                arg5 = 0;
                arg6 = 0;
                arg7 = 0;
            }
        }
        else
        {
            __scribble_error("Wrong number of arguments (", argument_count, ") provided\nExpecting 0 or 8");
        }
        
        var _bezier_array = [arg2 - arg0, arg3 - arg1, arg4 - arg0, arg5 - arg1, arg6 - arg0, arg7 - arg1];
        
        if (!array_equals(__bezier_array, _bezier_array))
        {
            __model_cache_name_dirty = true;
            __bezier_array = _bezier_array;
            __bezier_using = true;
        }
        
        return self;
    };
    
    static right_to_left = function(arg0)
    {
        var _new_bidi_hint;
        
        if (arg0 == undefined)
            _new_bidi_hint = undefined;
        else
            _new_bidi_hint = arg0 ? UnknownEnum.Value_6 : UnknownEnum.Value_4;
        
        if (__bidi_hint != _new_bidi_hint)
        {
            __model_cache_name_dirty = true;
            __bidi_hint = _new_bidi_hint;
        }
        
        return self;
    };
    
    static region_detect = function(arg0, arg1, arg2, arg3)
    {
        var _model = __get_model(true);
        var _page = _model.__pages_array[__page];
        var _region_array = _page.__region_array;
        var _matrix = __update_matrix(_model, arg0, arg1);
        
        if (__matrix_inverse == undefined)
            __matrix_inverse = __scribble_matrix_inverse(matrix_multiply(_matrix, matrix_get(2)));
        
        var _vector = matrix_transform_vertex(__matrix_inverse, arg2, arg3, 0);
        var _x = _vector[0];
        var _y = _vector[1];
        var _found = undefined;
        var _i = 0;
        
        repeat (array_length(_region_array))
        {
            var _region = _region_array[_i];
            var _bbox_array = _region.__bbox_array;
            var _j = 0;
            
            repeat (array_length(_bbox_array))
            {
                var _bbox = _bbox_array[_j];
                
                if (_x >= _bbox.__x1 && _y >= _bbox.__y1 && _x <= _bbox.__x2 && _y <= _bbox.__y2)
                {
                    _found = _region.__name;
                    break;
                }
                
                _j++;
            }
            
            if (_found != undefined)
                break;
            
            _i++;
        }
        
        return _found;
    };
    
    static region_set_active = function(arg0, arg1, arg2)
    {
        if (!is_string(arg0))
        {
            __region_active = undefined;
            __region_glyph_start = 0;
            __region_glyph_end = 0;
            __region_colour = 0;
            __region_blend = 0;
            exit;
        }
        
        var _model = __get_model(true);
        var _page = _model.__pages_array[__page];
        var _region_array = _page.__region_array;
        var _i = 0;
        
        repeat (array_length(_region_array))
        {
            var _region = _region_array[_i];
            
            if (_region.__name == arg0)
            {
                __region_active = arg0;
                __region_glyph_start = _region.__start_glyph;
                __region_glyph_end = _region.__end_glyph;
                __region_colour = arg1;
                __region_blend = arg2;
                exit;
            }
            
            _i++;
        }
        
        __scribble_error("Region \"", arg0, "\" not found");
    };
    
    static region_get_active = function()
    {
        return __region_active;
    };
    
    static __update_bbox_matrix = function()
    {
        __update_scale_to_box_scale();
        
        if (__bbox_dirty)
        {
            __bbox_dirty = false;
            var _model = __get_model(true);
            
            if (!is_struct(_model))
            {
                __bbox_matrix = matrix_build(-__origin_x, -__origin_y, 0, 0, 0, 0, 1, 1, 1);
                __bbox_aabb_left = 0;
                __bbox_aabb_top = 0;
                __bbox_aabb_right = 0;
                __bbox_aabb_bottom = 0;
                __bbox_obb_x0 = 0;
                __bbox_obb_y0 = 0;
                __bbox_obb_x1 = 0;
                __bbox_obb_y1 = 0;
                __bbox_obb_x2 = 0;
                __bbox_obb_y2 = 0;
                __bbox_obb_x3 = 0;
                __bbox_obb_y3 = 0;
                exit;
            }
            
            var _xscale = __scale_to_box_scale * _model.__fit_scale * __xscale;
            var _yscale = __scale_to_box_scale * _model.__fit_scale * __yscale;
            var _bbox = _model.__get_bbox(__page, __padding_l, __padding_t, __padding_r, __padding_b);
            __bbox_raw_width = (1 + _bbox.right) - _bbox.left;
            __bbox_raw_height = (1 + _bbox.bottom) - _bbox.top;
            
            if (_xscale == 1 && _yscale == 1 && __angle == 0)
            {
                __bbox_matrix = matrix_build(-__origin_x, -__origin_y, 0, 0, 0, 0, 1, 1, 1);
                __bbox_aabb_left = -__origin_x + _bbox.left;
                __bbox_aabb_top = -__origin_y + _bbox.top;
                __bbox_aabb_right = -__origin_x + _bbox.right;
                __bbox_aabb_bottom = -__origin_y + _bbox.bottom;
                __bbox_obb_x0 = __bbox_aabb_left;
                __bbox_obb_y0 = __bbox_aabb_top;
                __bbox_obb_x1 = __bbox_aabb_right;
                __bbox_obb_y1 = __bbox_aabb_top;
                __bbox_obb_x2 = __bbox_aabb_left;
                __bbox_obb_y2 = __bbox_aabb_bottom;
                __bbox_obb_x3 = __bbox_aabb_right;
                __bbox_obb_y3 = __bbox_aabb_bottom;
            }
            else
            {
                __bbox_matrix = matrix_multiply(matrix_build(-__origin_x, -__origin_y, 0, 0, 0, 0, 1, 1, 1), matrix_multiply(matrix_build(0, 0, 0, 0, 0, 0, _xscale, _yscale, 1), matrix_build(0, 0, 0, 0, 0, __angle, 1, 1, 1)));
                var _l = _bbox.left;
                var _t = _bbox.top;
                var _r = _bbox.right;
                var _b = _bbox.bottom;
                var _vertex = matrix_transform_vertex(__bbox_matrix, _l, _t, 0);
                __bbox_obb_x0 = _vertex[0];
                __bbox_obb_y0 = _vertex[1];
                _vertex = matrix_transform_vertex(__bbox_matrix, _r, _t, 0);
                __bbox_obb_x1 = _vertex[0];
                __bbox_obb_y1 = _vertex[1];
                _vertex = matrix_transform_vertex(__bbox_matrix, _l, _b, 0);
                __bbox_obb_x2 = _vertex[0];
                __bbox_obb_y2 = _vertex[1];
                _vertex = matrix_transform_vertex(__bbox_matrix, _r, _b, 0);
                __bbox_obb_x3 = _vertex[0];
                __bbox_obb_y3 = _vertex[1];
                __bbox_aabb_left = min(__bbox_obb_x0, __bbox_obb_x1, __bbox_obb_x2, __bbox_obb_x3);
                __bbox_aabb_top = min(__bbox_obb_y0, __bbox_obb_y1, __bbox_obb_y2, __bbox_obb_y3);
                __bbox_aabb_right = max(__bbox_obb_x0, __bbox_obb_x1, __bbox_obb_x2, __bbox_obb_x3);
                __bbox_aabb_bottom = max(__bbox_obb_y0, __bbox_obb_y1, __bbox_obb_y2, __bbox_obb_y3);
            }
            
            __bbox_aabb_width = (1 + __bbox_aabb_right) - __bbox_aabb_left;
            __bbox_aabb_height = (1 + __bbox_aabb_bottom) - __bbox_aabb_top;
        }
    };
    
    static get_left = function(arg0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_left + arg0;
    };
    
    static get_top = function(arg0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_top + arg0;
    };
    
    static get_right = function(arg0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_right + arg0;
    };
    
    static get_bottom = function(arg0 = 0)
    {
        __update_bbox_matrix();
        return __bbox_aabb_bottom + arg0;
    };
    
    static get_width = function()
    {
        __update_bbox_matrix();
        return __bbox_raw_width;
    };
    
    static get_height = function()
    {
        __update_bbox_matrix();
        return __bbox_raw_height;
    };
    
    static get_bbox = function(arg0 = 0, arg1 = 0)
    {
        __update_bbox_matrix();
        return 
        {
            left: arg0 + __bbox_aabb_left,
            top: arg1 + __bbox_aabb_top,
            right: arg0 + __bbox_aabb_right,
            bottom: arg1 + __bbox_aabb_bottom,
            width: __bbox_aabb_width,
            height: __bbox_aabb_height,
            x0: arg0 + __bbox_obb_x0,
            y0: arg1 + __bbox_obb_y0,
            x1: arg0 + __bbox_obb_x1,
            y1: arg1 + __bbox_obb_y1,
            x2: arg0 + __bbox_obb_x2,
            y2: arg1 + __bbox_obb_y2,
            x3: arg0 + __bbox_obb_x3,
            y3: arg1 + __bbox_obb_y3
        };
    };
    
    static get_bbox_revealed = function(arg0, arg1, arg2)
    {
        if (arg2 == undefined && __tw_reveal == undefined)
            return get_bbox(arg0, arg1);
        
        var _model = __get_model(true);
        
        if (!is_struct(_model))
        {
            return 
            {
                left: arg0,
                top: arg1,
                right: arg0,
                bottom: arg1,
                width: 1,
                height: 1,
                x0: arg0,
                y0: arg1,
                x1: arg0,
                y1: arg1,
                x2: arg0,
                y2: arg1,
                x3: arg0,
                y3: arg1
            };
        }
        
        var _bbox;
        
        if (arg2 != undefined)
            _bbox = _model.__get_bbox_revealed(__page, 0, arg2.__window_array[arg2.__window_index], __padding_l, __padding_t, __padding_r, __padding_b);
        else if (__tw_reveal != undefined)
            _bbox = _model.__get_bbox_revealed(__page, 0, __tw_reveal, __padding_l, __padding_t, __padding_r, __padding_b);
        
        __update_bbox_matrix();
        var _xscale = __scale_to_box_scale * _model.__fit_scale * __xscale;
        var _yscale = __scale_to_box_scale * _model.__fit_scale * __yscale;
        var _l, _t, _r, _b, _x0, _y0, _x1, _y1, _x2, _y2, _x3, _y3;
        
        if (_xscale == 1 && _yscale == 1 && __angle == 0)
        {
            _l = (arg0 - __origin_x) + _bbox.left;
            _t = (arg1 - __origin_y) + _bbox.top;
            _r = (arg0 - __origin_x) + _bbox.right;
            _b = (arg1 - __origin_y) + _bbox.bottom;
            _x0 = _l;
            _y0 = _t;
            _x1 = _r;
            _y1 = _t;
            _x2 = _l;
            _y2 = _b;
            _x3 = _r;
            _y3 = _b;
        }
        else
        {
            _l = _bbox.left;
            _t = _bbox.top;
            _r = _bbox.right;
            _b = _bbox.bottom;
            var _vertex = matrix_transform_vertex(__bbox_matrix, _l, _t, 0);
            _x0 = arg0 + _vertex[0];
            _y0 = arg1 + _vertex[1];
            _vertex = matrix_transform_vertex(__bbox_matrix, _r, _t, 0);
            _x1 = arg0 + _vertex[0];
            _y1 = arg1 + _vertex[1];
            _vertex = matrix_transform_vertex(__bbox_matrix, _l, _b, 0);
            _x2 = arg0 + _vertex[0];
            _y2 = arg1 + _vertex[1];
            _vertex = matrix_transform_vertex(__bbox_matrix, _r, _b, 0);
            _x3 = arg0 + _vertex[0];
            _y3 = arg1 + _vertex[1];
            _l = min(_x0, _x1, _x2, _x3);
            _t = min(_y0, _y1, _y2, _y3);
            _r = max(_x0, _x1, _x2, _x3);
            _b = max(_y0, _y1, _y2, _y3);
        }
        
        return 
        {
            left: _l,
            top: _t,
            right: _r,
            bottom: _b,
            width: (1 + _r) - _l,
            height: (1 + _b) - _t,
            x0: _x0,
            y0: _y0,
            x1: _x1,
            y1: _y1,
            x2: _x2,
            y2: _y2,
            x3: _x3,
            y3: _y3
        };
    };
    
    static page = function(arg0)
    {
        var _old_page = __page;
        var _model = __get_model(false);
        
        if (is_struct(_model))
        {
            if (arg0 < 0)
            {
                __scribble_trace("Warning! Cannot set a text element's page to less than 0");
                __page = 0;
            }
            else if (arg0 > (_model.__get_page_count() - 1))
            {
                __page = _model.__get_page_count() - 1;
                __scribble_trace("Warning! Page ", arg0, " is too big. Valid pages are from 0 to ", __page, " (pages are 0-indexed)");
            }
            else
            {
                __page = arg0;
            }
        }
        else
        {
            __page = 0;
        }
        
        if (_old_page != __page)
            __bbox_dirty = true;
        
        return self;
    };
    
    static get_page = function()
    {
        return __page;
    };
    
    static get_pages = function()
    {
        __scribble_error(".get_pages() has been replaced by .get_page_count()");
    };
    
    static get_page_count = function()
    {
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_page_count();
    };
    
    static on_last_page = function()
    {
        return get_page() >= (get_page_count() - 1);
    };
    
    static get_wrapped = function()
    {
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return false;
        
        return _model.__get_wrapped();
    };
    
    static get_text = function()
    {
        var _page = (argument_count > 0 && argument[0] != undefined) ? argument[0] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_text(_page);
    };
    
    static get_glyph_data = function()
    {
        var _index = argument[0];
        var _page = (argument_count > 1 && argument[1] != undefined) ? argument[1] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_glyph_data(_index, _page);
    };
    
    static get_glyph_count = function()
    {
        var _page = (argument_count > 0 && argument[0] != undefined) ? argument[0] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_glyph_count(_page);
    };
    
    static get_line_count = function()
    {
        var _page = (argument_count > 0 && argument[0] != undefined) ? argument[0] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return 0;
        
        return _model.__get_line_count(_page);
    };
    
    static reveal = function(arg0)
    {
        if (__tw_reveal != arg0)
        {
            __tw_reveal = arg0;
            __tw_reveal_window_array[0] = arg0;
        }
        
        return self;
    };
    
    static get_reveal = function()
    {
        return __tw_reveal;
    };
    
    static animation_tick_speed = function()
    {
        __scribble_error(".animation_tick_speed() has been replaced by .animation_speed()");
    };
    
    static animation_speed = function(arg0)
    {
        __animation_speed = arg0;
        return self;
    };
    
    static get_animation_speed = function()
    {
        return __animation_speed;
    };
    
    static is_animated = function()
    {
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return false;
        
        return _model.__has_animation;
    };
    
    static animation_sync = function()
    {
        __scribble_error(".animation_sync() has been removed\nPlease get in touch if this feature is essential for your project");
    };
    
    static animation_wave = function()
    {
        __scribble_error(".animation_wave() has been replaced by scribble_anim_wave()");
    };
    
    static animation_shake = function()
    {
        __scribble_error(".animation_wave() has been replaced by scribble_anim_shake()");
    };
    
    static animation_rainbow = function()
    {
        __scribble_error(".animation_rainbow() has been replaced by scribble_anim_rainbow()");
    };
    
    static animation_wobble = function()
    {
        __scribble_error(".animation_wobble() has been replaced by scribble_anim_wobble()");
    };
    
    static animation_pulse = function()
    {
        __scribble_error(".animation_pulse() has been replaced by scribble_anim_pulse()");
    };
    
    static animation_wheel = function()
    {
        __scribble_error(".animation_wheel() has been replaced by scribble_anim_wheel()");
    };
    
    static animation_cycle = function()
    {
        __scribble_error(".animation_cycle() has been replaced by scribble_anim_cycle()");
    };
    
    static animation_jitter = function()
    {
        __scribble_error(".animation_jitter() has been replaced by scribble_anim_jitter()");
    };
    
    static animation_blink = function()
    {
        __scribble_error(".animation_blink() has been replaced by scribble_anim_blink()");
    };
    
    static msdf_shadow = function(arg0, arg1, arg2, arg3, arg4 = 1)
    {
        __msdf_shadow_colour = arg0;
        __msdf_shadow_alpha = arg1;
        __msdf_shadow_xoffset = arg2;
        __msdf_shadow_yoffset = arg3;
        __msdf_shadow_softness = max(0, arg4);
        return self;
    };
    
    static msdf_border = function(arg0, arg1)
    {
        __msdf_border_colour = arg0;
        __msdf_border_thickness = arg1;
        return self;
    };
    
    static msdf_feather = function(arg0)
    {
        __msdf_feather_thickness = arg0;
        return self;
    };
    
    static build = function(arg0)
    {
        __freeze = arg0;
        __get_model(true);
        return global.__scribble_null_element;
    };
    
    static flush = function()
    {
        if (__flushed)
            return undefined;
        
        variable_struct_remove(global.__scribble_ecache_dict, __cache_name);
        var _array = global.__scribble_ecache_array;
        var _i = 0;
        
        repeat (array_length(_array))
        {
            if (_array[_i] == self)
                array_delete(_array, _i, 1);
            else
                _i++;
        }
        
        __flushed = true;
        return undefined;
    };
    
    static get_events = function()
    {
        var _position = argument[0];
        var _page = (argument_count > 1 && argument[1] != undefined) ? argument[1] : __page;
        var _model = __get_model(true);
        
        if (!is_struct(_model))
            return [];
        
        _page = _model.__pages_array[_page];
        var _events = variable_struct_get(_page.__events, _position);
        
        if (!is_array(_events))
            return [];
        
        return _events;
    };
    
    static template = function(arg0, arg1 = true)
    {
        if (is_array(arg0))
        {
            if (!arg1 || !is_array(__template) || !array_equals(__template, arg0))
            {
                if (arg1)
                {
                    __template = array_create(array_length(arg0));
                    array_copy(__template, 0, arg0, 0, array_length(arg0));
                }
                else
                {
                    __template = arg0;
                }
                
                var _i = 0;
                
                repeat (array_length(arg0))
                {
                    method(self, arg0[_i])();
                    _i++;
                }
            }
        }
        else if (!arg1 || is_array(__template) || __template != arg0)
        {
            __template = arg0;
            method(self, arg0)();
        }
        
        return self;
    };
    
    static ignore_command_tags = function(arg0)
    {
        if (__ignore_command_tags != arg0)
        {
            __model_cache_name_dirty = true;
            __ignore_command_tags = arg0;
        }
        
        return self;
    };
    
    static z = function(arg0)
    {
        __z = arg0;
        return self;
    };
    
    static get_z = function()
    {
        return __z;
    };
    
    static overwrite = function(arg0, arg1 = __unique_id)
    {
        __text = arg0;
        __unique_id = arg1;
        var _new_cache_name = __text + ":" + __unique_id;
        
        if (__cache_name != _new_cache_name)
        {
            flush();
            __flushed = false;
            __model_cache_name_dirty = true;
            __cache_name = _new_cache_name;
            var _weak = variable_struct_get(global.__scribble_ecache_dict, __cache_name);
            
            if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
            {
                __scribble_trace("Warning! Flushing element \"", __cache_name, "\" due to cache name collision (try choosing a different unique ID)");
                _weak.ref.flush();
            }
            
            variable_struct_set(global.__scribble_ecache_dict, __cache_name, weak_ref_create(self));
            array_push(global.__scribble_ecache_array, self);
            array_push(global.__scribble_ecache_name_array, __cache_name);
        }
        
        return self;
    };
    
    static debug_draw_bbox = function(arg0, arg1)
    {
        var _oldColour = draw_get_colour();
        draw_set_colour(c_red);
        
        switch (__starting_halign)
        {
            case 0:
                break;
            
            case 1:
                arg0 -= (__wrap_max_width / 2);
                break;
            
            case 2:
                arg0 -= __wrap_max_width;
                break;
        }
        
        switch (__starting_valign)
        {
            case 0:
                break;
            
            case 1:
                arg1 -= (__wrap_max_height / 2);
                break;
            
            case 2:
                arg1 -= __wrap_max_height;
                break;
        }
        
        draw_rectangle(arg0, arg1, arg0 + __wrap_max_width, arg1 + __wrap_max_height, true);
        draw_rectangle(arg0 + 1, arg1 + 1, (arg0 - 1) + __wrap_max_width, (arg1 - 1) + __wrap_max_height, true);
        draw_set_colour(_oldColour);
        return self;
    };
    
    static __get_model = function(arg0)
    {
        if (__flushed || __text == "")
        {
            __model = undefined;
        }
        else
        {
            if (__model_cache_name_dirty)
            {
                __model_cache_name_dirty = false;
                __bbox_dirty = true;
                __scale_to_box_dirty = true;
                buffer_seek(global.__scribble_buffer, buffer_seek_start, 0);
                buffer_write(global.__scribble_buffer, buffer_text, string(__text));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__starting_font));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__starting_colour));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__starting_halign));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__starting_valign));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__line_height_min));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__line_height_max));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__line_spacing));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__wrap_max_width - (__padding_l + __padding_r)));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__wrap_max_height - (__padding_t + __padding_b)));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__wrap_per_char));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__wrap_no_pages));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__wrap_max_scale));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bezier_array[0]));
                buffer_write(global.__scribble_buffer, buffer_u8, 44);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bezier_array[1]));
                buffer_write(global.__scribble_buffer, buffer_u8, 44);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bezier_array[2]));
                buffer_write(global.__scribble_buffer, buffer_u8, 44);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bezier_array[3]));
                buffer_write(global.__scribble_buffer, buffer_u8, 44);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bezier_array[4]));
                buffer_write(global.__scribble_buffer, buffer_u8, 44);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bezier_array[5]));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__bidi_hint));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_text, string(__ignore_command_tags));
                buffer_write(global.__scribble_buffer, buffer_u8, 58);
                buffer_write(global.__scribble_buffer, buffer_u8, 0);
                buffer_seek(global.__scribble_buffer, buffer_seek_start, 0);
                __model_cache_name = buffer_read(global.__scribble_buffer, buffer_string);
            }
            
            var _weak = variable_struct_get(global.__scribble_mcache_dict, __model_cache_name);
            
            if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
                __model = _weak.ref;
            else if (arg0)
                __model = new __scribble_class_model(self, __model_cache_name);
            else
                __model = undefined;
        }
        
        return __model;
    };
    
    static __set_standard_uniforms = function(arg0, arg1)
    {
        shader_set(__shd_scribble);
        shader_set_uniform_f(global.__scribble_u_fTime, __animation_time);
        var _blend_colour = __blend_colour;
        shader_set_uniform_f(global.__scribble_u_vColourBlend, colour_get_red(_blend_colour) / 255, colour_get_green(_blend_colour) / 255, colour_get_blue(_blend_colour) / 255, __blend_alpha);
        shader_set_uniform_f(global.__scribble_u_fBlinkState, __animation_blink_state);
        
        if (__gradient_alpha != 0 || __skew_x != 0 || __skew_y != 0 || __flash_alpha != 0 || __region_blend != 0)
        {
            global.__scribble_standard_shader_uniforms_dirty = true;
            shader_set_uniform_f(global.__scribble_u_vGradient, colour_get_red(__gradient_colour) / 255, colour_get_green(__gradient_colour) / 255, colour_get_blue(__gradient_colour) / 255, __gradient_alpha);
            shader_set_uniform_f(global.__scribble_u_vSkew, __skew_x, __skew_y);
            shader_set_uniform_f(global.__scribble_u_vFlash, colour_get_red(__flash_colour) / 255, colour_get_green(__flash_colour) / 255, colour_get_blue(__flash_colour) / 255, __flash_alpha);
            shader_set_uniform_f(global.__scribble_u_vRegionActive, __region_glyph_start, __region_glyph_end);
            shader_set_uniform_f(global.__scribble_u_vRegionColour, colour_get_red(__region_colour) / 255, colour_get_green(__region_colour) / 255, colour_get_blue(__region_colour) / 255, __region_blend);
        }
        else if (global.__scribble_standard_shader_uniforms_dirty)
        {
            global.__scribble_standard_shader_uniforms_dirty = false;
            shader_set_uniform_f(global.__scribble_u_vGradient, 0, 0, 0, 0);
            shader_set_uniform_f(global.__scribble_u_vSkew, 0, 0);
            shader_set_uniform_f(global.__scribble_u_vFlash, 0, 0, 0, 0);
            shader_set_uniform_f(global.__scribble_u_vRegionActive, 0, 0);
            shader_set_uniform_f(global.__scribble_u_vRegionColour, 0, 0, 0, 0);
        }
        
        if (global.__scribble_anim_shader_desync)
        {
            global.__scribble_anim_shader_desync = false;
            global.__scribble_anim_shader_default = global.__scribble_anim_shader_desync_to_default;
            shader_set_uniform_f_array(global.__scribble_u_aDataFields, global.__scribble_anim_properties);
        }
        
        if (__bezier_using)
        {
            global.__scribble_bezier_using = true;
            shader_set_uniform_f_array(global.__scribble_u_aBezier, __bezier_array);
        }
        else if (global.__scribble_bezier_using)
        {
            global.__scribble_bezier_using = false;
            shader_set_uniform_f_array(global.__scribble_u_aBezier, global.__scribble_bezier_null_array);
        }
        
        if (arg0 != undefined)
        {
            with (arg0)
            {
                __tick(other, arg1);
                __set_shader_uniforms();
            }
        }
        else if (__tw_reveal != undefined)
        {
            shader_set_uniform_i(global.__scribble_u_iTypewriterMethod, UnknownEnum.Value_1);
            shader_set_uniform_i(global.__scribble_u_iTypewriterCharMax, 0);
            shader_set_uniform_f(global.__scribble_u_fTypewriterSmoothness, 0);
            shader_set_uniform_f(global.__scribble_u_vTypewriterStartPos, 0, 0);
            shader_set_uniform_f(global.__scribble_u_vTypewriterStartScale, 1, 1);
            shader_set_uniform_f(global.__scribble_u_fTypewriterStartRotation, 0);
            shader_set_uniform_f(global.__scribble_u_fTypewriterAlphaDuration, 1);
            shader_set_uniform_f_array(global.__scribble_u_fTypewriterWindowArray, __tw_reveal_window_array);
        }
        else
        {
            shader_set_uniform_i(global.__scribble_u_iTypewriterMethod, UnknownEnum.Value_0);
        }
        
        shader_reset();
    };
    
    static __set_msdf_uniforms = function(arg0, arg1)
    {
        shader_set(__shd_scribble_msdf);
        shader_set_uniform_f(global.__scribble_msdf_u_fTime, __animation_time);
        shader_set_uniform_f(global.__scribble_msdf_u_vColourBlend, colour_get_red(__blend_colour) / 255, colour_get_green(__blend_colour) / 255, colour_get_blue(__blend_colour) / 255, __blend_alpha);
        shader_set_uniform_f(global.__scribble_msdf_u_fBlinkState, __animation_blink_state);
        
        if (__gradient_alpha != 0 || __skew_x != 0 || __skew_y != 0 || __flash_alpha != 0 || __region_blend != 0)
        {
            global.__scribble_msdf_shader_uniforms_dirty = true;
            shader_set_uniform_f(global.__scribble_msdf_u_vGradient, colour_get_red(__gradient_colour) / 255, colour_get_green(__gradient_colour) / 255, colour_get_blue(__gradient_colour) / 255, __gradient_alpha);
            shader_set_uniform_f(global.__scribble_msdf_u_vSkew, __skew_x, __skew_y);
            shader_set_uniform_f(global.__scribble_msdf_u_vFlash, colour_get_red(__flash_colour) / 255, colour_get_green(__flash_colour) / 255, colour_get_blue(__flash_colour) / 255, __flash_alpha);
            shader_set_uniform_f(global.__scribble_msdf_u_vRegionActive, __region_glyph_start, __region_glyph_end);
            shader_set_uniform_f(global.__scribble_msdf_u_vRegionColour, colour_get_red(__region_colour) / 255, colour_get_green(__region_colour) / 255, colour_get_blue(__region_colour) / 255, __region_blend);
        }
        else if (global.__scribble_msdf_shader_uniforms_dirty)
        {
            global.__scribble_msdf_shader_uniforms_dirty = false;
            shader_set_uniform_f(global.__scribble_msdf_u_vGradient, 0, 0, 0, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_vSkew, 0, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_vFlash, 0, 0, 0, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_vRegionActive, 0, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_vRegionColour, 0, 0, 0, 0);
        }
        
        if (global.__scribble_anim_shader_msdf_desync)
        {
            global.__scribble_anim_shader_msdf_desync = false;
            global.__scribble_anim_shader_msdf_default = global.__scribble_anim_shader_msdf_desync_to_default;
            shader_set_uniform_f_array(global.__scribble_msdf_u_aDataFields, global.__scribble_anim_properties);
        }
        
        if (__bezier_using)
        {
            global.__scribble_bezier_msdf_using = true;
            shader_set_uniform_f_array(global.__scribble_msdf_u_aBezier, __bezier_array);
        }
        else if (global.__scribble_bezier_msdf_using)
        {
            global.__scribble_bezier_msdf_using = false;
            shader_set_uniform_f_array(global.__scribble_msdf_u_aBezier, global.__scribble_bezier_null_array);
        }
        
        if (arg0 != undefined)
        {
            with (arg0)
            {
                __tick(other, arg1);
                __set_msdf_shader_uniforms();
            }
        }
        else if (__tw_reveal != undefined)
        {
            shader_set_uniform_i(global.__scribble_msdf_u_iTypewriterMethod, UnknownEnum.Value_1);
            shader_set_uniform_i(global.__scribble_msdf_u_iTypewriterCharMax, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_fTypewriterSmoothness, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_vTypewriterStartPos, 0, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_vTypewriterStartScale, 1, 1);
            shader_set_uniform_f(global.__scribble_msdf_u_fTypewriterStartRotation, 0);
            shader_set_uniform_f(global.__scribble_msdf_u_fTypewriterAlphaDuration, 1);
            shader_set_uniform_f_array(global.__scribble_msdf_u_fTypewriterWindowArray, __tw_reveal_window_array);
        }
        else
        {
            shader_set_uniform_i(global.__scribble_msdf_u_iTypewriterMethod, UnknownEnum.Value_0);
        }
        
        shader_set_uniform_f(global.__scribble_msdf_u_vShadowOffsetAndSoftness, __msdf_shadow_xoffset, __msdf_shadow_yoffset, __msdf_shadow_softness);
        shader_set_uniform_f(global.__scribble_msdf_u_vShadowColour, colour_get_red(__msdf_shadow_colour) / 255, colour_get_green(__msdf_shadow_colour) / 255, colour_get_blue(__msdf_shadow_colour) / 255, __msdf_shadow_alpha);
        shader_set_uniform_f(global.__scribble_msdf_u_vBorderColour, colour_get_red(__msdf_border_colour) / 255, colour_get_green(__msdf_border_colour) / 255, colour_get_blue(__msdf_border_colour) / 255);
        shader_set_uniform_f(global.__scribble_msdf_u_fBorderThickness, __msdf_border_thickness);
        var _surface = surface_get_target();
        var _surface_width, _surface_height;
        
        if (_surface >= 0)
        {
            _surface_width = surface_get_width(_surface);
            _surface_height = surface_get_height(_surface);
        }
        else
        {
            _surface_width = window_get_width();
            _surface_height = window_get_height();
        }
        
        shader_set_uniform_f(global.__scribble_msdf_u_vOutputSize, _surface_width, _surface_height);
        shader_reset();
    };
    
    static __update_scale_to_box_scale = function()
    {
        if (!__scale_to_box_dirty)
            exit;
        
        __scale_to_box_dirty = false;
        var _model = __get_model(true);
        var _xscale = 1;
        var _yscale = 1;
        
        if (__scale_to_box_max_width > 0)
            _xscale = __scale_to_box_max_width / (_model.__get_width() + __padding_l + __padding_r);
        
        if (__scale_to_box_max_height > 0)
            _yscale = __scale_to_box_max_height / (_model.__get_height() + __padding_t + __padding_b);
        
        var _previous_scale_to_box_scale = __scale_to_box_scale;
        __scale_to_box_scale = min(1, _xscale, _yscale);
        
        if (__scale_to_box_scale != _previous_scale_to_box_scale)
        {
            __matrix_dirty = true;
            __bbox_dirty = true;
        }
    };
    
    static __update_matrix = function(arg0, arg1, arg2)
    {
        __update_scale_to_box_scale();
        
        if (__matrix_dirty || __matrix_x != arg1 || __matrix_y != arg2)
        {
            __matrix_dirty = false;
            __matrix_inverse = undefined;
            __matrix_x = arg1;
            __matrix_y = arg2;
            var _x_offset = -__origin_x;
            var _y_offset = -__origin_y;
            var _xscale = __scale_to_box_scale * arg0.__fit_scale * __xscale;
            var _yscale = __scale_to_box_scale * arg0.__fit_scale * __yscale;
            var _angle = __angle;
            
            if (!arg0.__pad_bbox_l)
                _x_offset += __padding_l;
            
            if (!arg0.__pad_bbox_t)
                _y_offset += __padding_t;
            
            if (!arg0.__pad_bbox_r)
                _x_offset -= __padding_r;
            
            if (!arg0.__pad_bbox_b)
                _y_offset -= __padding_b;
            
            if (_xscale == 1 && _yscale == 1 && _angle == 0)
                __matrix = matrix_build(_x_offset + arg1, _y_offset + arg2, __z, 0, 0, 0, 1, 1, 1);
            else
                __matrix = matrix_multiply(matrix_build(_x_offset, _y_offset, 0, 0, 0, 0, 1, 1, 1), matrix_multiply(matrix_build(0, 0, 0, 0, 0, 0, _xscale, _yscale, 1), matrix_multiply(matrix_build(0, 0, 0, 0, 0, __angle, 1, 1, 1), matrix_build(arg1, arg2, __z, 0, 0, 0, 1, 1, 1))));
        }
        
        return __matrix;
    };
    
    static typewriter_off = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (__tw_legacy_typist_use)
            __tw_legacy_typist.reset();
        
        __tw_legacy_typist_use = false;
        return self;
    };
    
    static typewriter_reset = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist = scribble_typist();
        __tw_legacy_typist.__associate(self);
        return self;
    };
    
    static typewriter_in = function(arg0, arg1)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist_use = true;
        __tw_legacy_typist.in(arg0, arg1);
        return self;
    };
    
    static typewriter_out = function(arg0, arg1, arg2 = false)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist_use = true;
        __tw_legacy_typist.out(arg0, arg1, arg2);
        return self;
    };
    
    static typewriter_skip = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.skip();
        return self;
    };
    
    static typewriter_sound = function(arg0, arg1, arg2, arg3)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.sound(arg0, arg1, arg2, arg3);
        return self;
    };
    
    static typewriter_sound_per_char = function(arg0, arg1, arg2)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.sound_per_char(arg0, arg1, arg2);
        return self;
    };
    
    static typewriter_function = function(arg0)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.function_per_char(arg0);
        return self;
    };
    
    static typewriter_pause = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.pause();
        return self;
    };
    
    static typewriter_unpause = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.unpause();
        return self;
    };
    
    static typewriter_ease = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        __tw_legacy_typist.ease(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
        return self;
    };
    
    static get_typewriter_state = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (!__tw_legacy_typist_use)
            return 1;
        
        return __tw_legacy_typist.get_state();
    };
    
    static get_typewriter_paused = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (!__tw_legacy_typist_use)
            return false;
        
        return __tw_legacy_typist.get_paused();
    };
    
    static get_typewriter_pos = function()
    {
        __scribble_error(".typewriter_*() methods have been deprecated\nIt is recommend you move to the new \"typist\" system\nPlease visit https://www.jujuadams.com/Scribble/\n \n(Set SCRIBBLE_WARNING_LEGACY_TYPEWRITER to <false> to turn off this warning)");
        
        if (!__tw_legacy_typist_use)
            return 0;
        
        return __tw_legacy_typist.get_position();
    };
    
    __text = arg0;
    __unique_id = arg1;
    __cache_name = arg0 + ((arg1 == undefined) ? ":default" : (":" + string(arg1)));
    var _weak = variable_struct_get(global.__scribble_ecache_dict, __cache_name);
    
    if (_weak != undefined && weak_ref_alive(_weak) && !_weak.ref.__flushed)
    {
        __scribble_trace("Warning! Flushing element \"", __cache_name, "\" due to cache name collision");
        _weak.ref.flush();
    }
    
    variable_struct_set(global.__scribble_ecache_dict, __cache_name, weak_ref_create(self));
    array_push(global.__scribble_ecache_array, self);
    array_push(global.__scribble_ecache_name_array, __cache_name);
    __flushed = false;
    __model_cache_name_dirty = true;
    __model_cache_name = undefined;
    __model = undefined;
    __last_drawn = current_time;
    __freeze = false;
    __starting_font = global.__scribble_default_font;
    __starting_colour = __scribble_process_colour(16777215);
    __starting_halign = 0;
    __starting_valign = 0;
    __blend_colour = 16777215;
    __blend_alpha = 1;
    __skew_x = 0;
    __skew_y = 0;
    __gradient_colour = 0;
    __gradient_alpha = 0;
    __flash_colour = 16777215;
    __flash_alpha = 0;
    __origin_x = 0;
    __origin_y = 0;
    __xscale = 1;
    __yscale = 1;
    __angle = 0;
    __matrix_dirty = true;
    __matrix = undefined;
    __matrix_inverse = undefined;
    __matrix_x = undefined;
    __matrix_y = undefined;
    __wrap_max_width = -1;
    __wrap_max_height = -1;
    __wrap_per_char = false;
    __wrap_no_pages = false;
    __wrap_max_scale = 1;
    __scale_to_box_dirty = true;
    __scale_to_box_max_width = 0;
    __scale_to_box_max_height = 0;
    __scale_to_box_scale = undefined;
    __line_height_min = -1;
    __line_height_max = -1;
    __line_spacing = "100%";
    __page = 0;
    __ignore_command_tags = false;
    __template = undefined;
    __bezier_array = array_create(6, 0);
    __bezier_using = false;
    __tw_reveal = undefined;
    __tw_reveal_window_array = array_create(6, 0);
    __animation_time = current_time;
    __animation_speed = 1;
    __animation_blink_state = true;
    __padding_l = 0;
    __padding_t = 0;
    __padding_r = 0;
    __padding_b = 0;
    __msdf_shadow_colour = 0;
    __msdf_shadow_alpha = 0;
    __msdf_shadow_xoffset = 0;
    __msdf_shadow_yoffset = 0;
    __msdf_shadow_softness = 0;
    __msdf_border_colour = 0;
    __msdf_border_thickness = 0;
    __msdf_feather_thickness = 1;
    __bidi_hint = undefined;
    __z = 0;
    __region_active = undefined;
    __region_glyph_start = 0;
    __region_glyph_end = 0;
    __region_colour = 0;
    __region_blend = 0;
    __bbox_dirty = true;
    __bbox_matrix = undefined;
    __bbox_raw_width = 1;
    __bbox_raw_height = 1;
    __bbox_aabb_left = 0;
    __bbox_aabb_top = 0;
    __bbox_aabb_right = 0;
    __bbox_aabb_bottom = 0;
    __bbox_aabb_width = 1;
    __bbox_aabb_height = 1;
    __bbox_obb_x0 = 0;
    __bbox_obb_y0 = 0;
    __bbox_obb_x1 = 0;
    __bbox_obb_y1 = 0;
    __bbox_obb_x2 = 0;
    __bbox_obb_y2 = 0;
    __bbox_obb_x3 = 0;
    __bbox_obb_y3 = 0;
}
