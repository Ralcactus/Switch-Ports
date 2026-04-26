function __scribble_gen_2_parser()
{
    var _string_buffer = global.__scribble_buffer;
    var _glyph_grid = global.__scribble_glyph_grid;
    var _word_grid = global.__scribble_word_grid;
    var _control_grid = global.__scribble_control_grid;
    var _vbuff_pos_grid = global.__scribble_vbuff_pos_grid;
    var _arabic_join_next_map = global.__scribble_glyph_data.__arabic_join_next_map;
    var _arabic_join_prev_map = global.__scribble_glyph_data.__arabic_join_prev_map;
    var _arabic_isolated_map = global.__scribble_glyph_data.__arabic_isolated_map;
    var _arabic_initial_map = global.__scribble_glyph_data.__arabic_initial_map;
    var _arabic_medial_map = global.__scribble_glyph_data.__arabic_medial_map;
    var _arabic_final_map = global.__scribble_glyph_data.__arabic_final_map;
    var _thai_base_map = global.__scribble_glyph_data.__thai_base_map;
    var _thai_base_descender_map = global.__scribble_glyph_data.__thai_base_descender_map;
    var _thai_base_ascender_map = global.__scribble_glyph_data.__thai_base_ascender_map;
    var _thai_top_map = global.__scribble_glyph_data.__thai_top_map;
    var _thai_lower_map = global.__scribble_glyph_data.__thai_lower_map;
    var _thai_upper_map = global.__scribble_glyph_data.__thai_upper_map;
    var _element = global.__scribble_generator_state.__element;
    var _element_text = _element.__text;
    var _starting_colour = _element.__starting_colour;
    var _starting_halign = _element.__starting_halign;
    var _starting_valign = _element.__starting_valign;
    var _ignore_commands = _element.__ignore_command_tags;
    var _starting_font = _element.__starting_font;
    
    if (_starting_font == undefined)
        __scribble_error("The default font has not been set\nCheck that you've added fonts to Scribble (scribble_font_add() / scribble_font_add_from_sprite() etc.)");
    
    var _font_name = _starting_font;
    buffer_seek(_string_buffer, buffer_seek_start, 0);
    buffer_write(_string_buffer, buffer_string, _element_text);
    buffer_write(_string_buffer, buffer_u64, 0);
    buffer_seek(_string_buffer, buffer_seek_start, 0);
    var _overall_bidi = global.__scribble_generator_state.__overall_bidi;
    
    if (_overall_bidi != UnknownEnum.Value_4 && _overall_bidi != UnknownEnum.Value_6)
    {
        var _global_glyph_bidi_map = global.__scribble_glyph_data.__bidi_map;
        var _in_tag = false;
        _state_command_tag_flipflop = false;
        
        repeat (string_byte_length(_element_text))
        {
            _glyph_ord = __scribble_buffer_read_unicode(_string_buffer);
            
            if (_glyph_ord == 0)
                break;
            
            if (_in_tag)
            {
                if (_glyph_ord == 93)
                    _in_tag = false;
            }
            else
            {
                if (_glyph_ord == 91 && !_ignore_commands)
                {
                    if (__scribble_buffer_peek_unicode(_string_buffer, buffer_tell(_string_buffer)) == 91)
                    {
                        _state_command_tag_flipflop = true;
                    }
                    else if (_state_command_tag_flipflop)
                    {
                        _state_command_tag_flipflop = false;
                    }
                    else
                    {
                        _in_tag = true;
                        continue;
                    }
                }
                
                var _bidi = ds_map_find_value(_global_glyph_bidi_map, _glyph_ord);
                
                if (_bidi == undefined)
                    _bidi = UnknownEnum.Value_4;
                
                if (_bidi == UnknownEnum.Value_4)
                {
                    _overall_bidi = _bidi;
                    break;
                }
                
                if (_bidi >= UnknownEnum.Value_6)
                {
                    _overall_bidi = UnknownEnum.Value_6;
                    break;
                }
            }
        }
        
        buffer_seek(_string_buffer, buffer_seek_start, 0);
        
        if (_overall_bidi != UnknownEnum.Value_4 && _overall_bidi != UnknownEnum.Value_6)
            _overall_bidi = UnknownEnum.Value_4;
        
        global.__scribble_generator_state.__overall_bidi = _overall_bidi;
    }
    
    var _element_expected_text_length = string_length(_element_text) + 2;
    
    if (ds_grid_width(_glyph_grid) < _element_expected_text_length)
        ds_grid_resize(_glyph_grid, _element_expected_text_length, UnknownEnum.Value_22);
    
    if (ds_grid_width(_word_grid) < _element_expected_text_length)
        ds_grid_resize(_word_grid, _element_expected_text_length, UnknownEnum.Value_22);
    
    if (ds_grid_width(_vbuff_pos_grid) < _element_expected_text_length)
        ds_grid_resize(_vbuff_pos_grid, _element_expected_text_length, UnknownEnum.Value_22);
    
    var _tag_start = undefined;
    var _tag_parameter_count = 0;
    var _tag_parameters = undefined;
    var _tag_command_name = "";
    var _glyph_count = 0;
    var _glyph_ord = 0;
    var _glyph_prev = undefined;
    var _glyph_prev_prev = undefined;
    var _glyph_prev_arabic_join_next = false;
    var _control_count = 0;
    var _skip_write = false;
    var _font_data = __scribble_get_font_data(_font_name);
    
    if (_font_data.__is_krutidev)
        __has_devanagari = true;
    
    var _font_glyph_data_grid = _font_data.__glyph_data_grid;
    var _font_glyphs_map = _font_data.__glyphs_map;
    var _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
    
    if (_space_data_index == undefined)
    {
        __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
        return false;
    }
    
    var _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
    var _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
    _control_count++;
    var _state_effect_flags = 0;
    var _state_colour = 4278190080 | _starting_colour;
    var _state_halign = _starting_halign;
    var _state_command_tag_flipflop = false;
    var _state_scale = 1;
    var _state_scale_start_glyph = 0;
    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_1);
    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_halign);
    _control_count++;
    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
    _control_count++;
    
    repeat (string_byte_length(_element_text))
    {
        _glyph_ord = buffer_read(_string_buffer, buffer_u8);
        
        if (_glyph_ord == 0)
            break;
        
        if ((_glyph_ord & 224) == 192)
        {
            _glyph_ord = ((_glyph_ord & 31) << 6) | (buffer_read(_string_buffer, buffer_u8) & 63);
        }
        else if ((_glyph_ord & 240) == 224)
        {
            var _glyph_ord_b = buffer_read(_string_buffer, buffer_u8);
            var _glyph_ord_c = buffer_read(_string_buffer, buffer_u8);
            _glyph_ord = ((_glyph_ord & 15) << 12) | ((_glyph_ord_b & 63) << 6) | (_glyph_ord_c & 63);
        }
        else if ((_glyph_ord & 248) == 240)
        {
            var _glyph_ord_b = buffer_read(_string_buffer, buffer_u8);
            var _glyph_ord_c = buffer_read(_string_buffer, buffer_u8);
            var _glyph_ord_d = buffer_read(_string_buffer, buffer_u8);
            _glyph_ord = ((_glyph_ord & 7) << 18) | ((_glyph_ord_b & 63) << 12) | ((_glyph_ord_c & 63) << 6) | (_glyph_ord_d & 63);
        }
        else
        {
        }
        
        if (_tag_start != undefined)
        {
            if (_glyph_ord == 93)
            {
                _tag_parameter_count++;
                buffer_poke(_string_buffer, buffer_tell(_string_buffer) - 1, buffer_u8, 0);
                buffer_seek(_string_buffer, buffer_seek_start, _tag_start);
                
                repeat (_tag_parameter_count)
                    _tag_parameters[array_length(_tag_parameters)] = buffer_read(_string_buffer, buffer_string);
                
                _tag_start = undefined;
                _tag_command_name = _tag_parameters[0];
                var _new_halign = undefined;
                var _new_valign = undefined;
                
                switch (ds_map_find_value(global.__scribble_command_tag_lookup_accelerator, _tag_command_name))
                {
                    case 0:
                        if (_state_scale != 1)
                            ds_grid_multiply_region(_glyph_grid, _state_scale_start_glyph, UnknownEnum.Value_2, _glyph_count, UnknownEnum.Value_9, _state_scale);
                        
                        _state_scale_start_glyph = _glyph_count;
                        
                        if (_font_name != _starting_font)
                        {
                            _font_name = _starting_font;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                        }
                        
                        _state_effect_flags = 0;
                        _state_scale = 1;
                        _state_colour = 4278190080 | _starting_colour;
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_3);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, 0);
                        _control_count++;
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                        _control_count++;
                        break;
                    
                    case 1:
                        if (_font_name != _starting_font)
                        {
                            _font_name = _starting_font;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                        }
                        
                        break;
                    
                    case 2:
                        _state_colour = (_state_colour & 4278190080) | _starting_colour;
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                        _control_count++;
                        break;
                    
                    case 3:
                        _state_colour = 4278190080 | _state_colour;
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                        _control_count++;
                        break;
                    
                    case 4:
                        if (_state_scale != 1)
                            ds_grid_multiply_region(_glyph_grid, _state_scale_start_glyph, UnknownEnum.Value_2, _glyph_count, UnknownEnum.Value_9, _state_scale);
                        
                        _state_scale_start_glyph = _glyph_count;
                        _state_scale = 1;
                        break;
                    
                    case 6:
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_2);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                        _glyph_count++;
                        _glyph_prev_arabic_join_next = false;
                        _glyph_prev = 0;
                        _glyph_prev_prev = _glyph_prev;
                        break;
                    
                    case 7:
                        if (_tag_parameter_count <= 1)
                        {
                            __scribble_trace("Not enough parameters for [scale] tag!");
                        }
                        else
                        {
                            if (_state_scale != 1)
                                ds_grid_multiply_region(_glyph_grid, _state_scale_start_glyph, UnknownEnum.Value_2, _glyph_count, UnknownEnum.Value_9, _state_scale);
                            
                            _state_scale_start_glyph = _glyph_count;
                            _state_scale = real(_tag_parameters[1]);
                        }
                        
                        break;
                    
                    case 8:
                        if (_tag_parameter_count <= 1)
                        {
                            __scribble_trace("Not enough parameters for [scaleStack] tag!");
                        }
                        else
                        {
                            if (_state_scale != 1)
                                ds_grid_multiply_region(_glyph_grid, _state_scale_start_glyph, UnknownEnum.Value_2, _glyph_count, UnknownEnum.Value_9, _state_scale);
                            
                            _state_scale_start_glyph = _glyph_count;
                            _state_scale *= real(_tag_parameters[1]);
                        }
                        
                        break;
                    
                    case 10:
                        _state_colour = (floor(255 * clamp(_tag_parameters[1], 0, 1)) << 24) | (_state_colour & 16777215);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                        _control_count++;
                        break;
                    
                    case 11:
                        _new_halign = 0;
                        break;
                    
                    case 12:
                        _new_halign = 1;
                        break;
                    
                    case 13:
                        _new_halign = 2;
                        break;
                    
                    case 14:
                        _new_valign = 0;
                        break;
                    
                    case 15:
                        _new_valign = 1;
                        break;
                    
                    case 16:
                        _new_valign = 2;
                        break;
                    
                    case 17:
                        _new_halign = 3;
                        break;
                    
                    case 18:
                        _new_halign = 4;
                        break;
                    
                    case 19:
                        _new_halign = 5;
                        break;
                    
                    case 20:
                        _new_halign = 6;
                        break;
                    
                    case 21:
                        repeat ((array_length(_tag_parameters) == 2) ? real(_tag_parameters[1]) : 1)
                        {
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 160);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_1);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, _font_space_width);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, _font_space_width);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                            _glyph_count++;
                            _glyph_prev_arabic_join_next = false;
                            _glyph_prev = 160;
                            _glyph_prev_prev = _glyph_prev;
                        }
                        
                        break;
                    
                    case 31:
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 8203);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                        _glyph_count++;
                        _glyph_prev_arabic_join_next = false;
                        _glyph_prev = 8203;
                        _glyph_prev_prev = _glyph_prev;
                        break;
                    
                    case 22:
                        var _cycle_r = (_tag_parameter_count > 1) ? max(1, real(_tag_parameters[1])) : 0;
                        var _cycle_g = (_tag_parameter_count > 2) ? max(1, real(_tag_parameters[2])) : 0;
                        var _cycle_b = (_tag_parameter_count > 3) ? max(1, real(_tag_parameters[3])) : 0;
                        var _cycle_a = (_tag_parameter_count > 4) ? max(1, real(_tag_parameters[4])) : 0;
                        _state_effect_flags = _state_effect_flags | (1 << ds_map_find_value(global.__scribble_effects, "cycle"));
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_3);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_effect_flags);
                        _control_count++;
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_4);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, (_cycle_a << 24) | (_cycle_b << 16) | (_cycle_g << 8) | _cycle_r);
                        _control_count++;
                        __has_animation = true;
                        break;
                    
                    case 23:
                        _state_effect_flags = ~(~_state_effect_flags | (1 << ds_map_find_value(global.__scribble_effects_slash, "/cycle")));
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_3);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_effect_flags);
                        _control_count++;
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_4);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, undefined);
                        _control_count++;
                        break;
                    
                    case 24:
                        var _new_font = _font_data.__style_regular;
                        
                        if (_new_font == undefined)
                        {
                            __scribble_trace("Regular style not set for font \"", _font_name, "\"");
                        }
                        else if (!ds_map_exists(global.__scribble_font_data, _new_font))
                        {
                            __scribble_trace("Font \"", _font_name, "\" not found (regular style for \"", _font_name, "\")");
                        }
                        else
                        {
                            _font_name = _new_font;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                            
                            if (_state_scale != 1)
                                ds_grid_multiply_region(_glyph_grid, _state_scale_start_glyph, UnknownEnum.Value_2, _glyph_count, UnknownEnum.Value_9, _state_scale);
                            
                            _state_scale_start_glyph = _glyph_count;
                        }
                        
                        break;
                    
                    case 25:
                        var _new_font = _font_data.__style_bold;
                        
                        if (_new_font == undefined)
                        {
                            __scribble_trace("Bold style not set for font \"", _font_name, "\"");
                        }
                        else if (!ds_map_exists(global.__scribble_font_data, _new_font))
                        {
                            __scribble_trace("Font \"", _font_name, "\" not found (bold style for \"", _font_name, "\")");
                        }
                        else
                        {
                            _font_name = _new_font;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                        }
                        
                        break;
                    
                    case 26:
                        var _new_font = _font_data.__style_italic;
                        
                        if (_new_font == undefined)
                        {
                            __scribble_trace("Italic style not set for font \"", _font_name, "\"");
                        }
                        else if (!ds_map_exists(global.__scribble_font_data, _new_font))
                        {
                            __scribble_trace("Font \"", _font_name, "\" not found (italic style for \"", _font_name, "\")");
                        }
                        else
                        {
                            _font_name = _new_font;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                        }
                        
                        break;
                    
                    case 27:
                        var _new_font = _font_data.__style_bold_italic;
                        
                        if (_new_font == undefined)
                        {
                            __scribble_trace("Bold-Italic style not set for font \"", _font_name, "\"");
                        }
                        else if (!ds_map_exists(global.__scribble_font_data, _new_font))
                        {
                            __scribble_trace("Font \"", _font_name, "\" not found (bold-italic style for \"", _font_name, "\")");
                        }
                        else
                        {
                            _font_name = _new_font;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                        }
                        
                        break;
                    
                    case 28:
                        var _surface = real(_tag_parameters[1]);
                        var _surface_w = surface_get_width(_surface);
                        var _surface_h = surface_get_height(_surface);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, -2);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_1);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, _surface_w);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _surface_h);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _surface_h);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, _surface_w);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_10, surface_get_texture(_surface));
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_11, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_13, 0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_12, 1);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_14, 1);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_15, undefined);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                        _glyph_count++;
                        _glyph_prev_arabic_join_next = false;
                        _glyph_prev = -2;
                        _glyph_prev_prev = _glyph_prev;
                        break;
                    
                    case 29:
                        if (array_length(_tag_parameters) != 2)
                            __scribble_error("[region] tags must contain a name e.g. [region,This is a region]");
                        
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_5);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _tag_parameters[1]);
                        _control_count++;
                        break;
                    
                    case 30:
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_5);
                        ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, undefined);
                        _control_count++;
                        break;
                    
                    default:
                        if (ds_map_exists(global.__scribble_effects, _tag_command_name))
                        {
                            _state_effect_flags = _state_effect_flags | (1 << ds_map_find_value(global.__scribble_effects, _tag_command_name));
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_3);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_effect_flags);
                            _control_count++;
                            __has_animation = true;
                        }
                        else if (ds_map_exists(global.__scribble_effects_slash, _tag_command_name))
                        {
                            _state_effect_flags = ~(~_state_effect_flags | (1 << ds_map_find_value(global.__scribble_effects_slash, _tag_command_name)));
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_3);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_effect_flags);
                            _control_count++;
                        }
                        else if (variable_struct_exists(global.__scribble_colours, _tag_command_name))
                        {
                            _state_colour = (_state_colour & 4278190080) | (variable_struct_get(global.__scribble_colours, _tag_command_name) & 16777215);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                            _control_count++;
                        }
                        else if (ds_map_exists(global.__scribble_typewriter_events, _tag_command_name))
                        {
                            array_delete(_tag_parameters, 0, 1);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_0);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, new __scribble_class_event(_tag_command_name, _tag_parameters));
                            _control_count++;
                        }
                        else if (ds_map_exists(global.__scribble_font_data, _tag_command_name))
                        {
                            _font_name = _tag_command_name;
                            _font_data = __scribble_get_font_data(_font_name);
                            
                            if (_font_data.__is_krutidev)
                                __has_devanagari = true;
                            
                            _font_glyph_data_grid = _font_data.__glyph_data_grid;
                            _font_glyphs_map = _font_data.__glyphs_map;
                            _space_data_index = ds_map_find_value(_font_glyphs_map, 32);
                            
                            if (_space_data_index == undefined)
                            {
                                __scribble_error("The space character is missing from font definition for \"", _font_name, "\"");
                                return false;
                            }
                            
                            _font_space_width = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_5);
                            _font_line_height = ds_grid_get(_font_glyph_data_grid, _space_data_index, UnknownEnum.Value_7);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_6);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _font_name);
                            _control_count++;
                        }
                        else if (asset_get_type(_tag_command_name) == 1)
                        {
                            var _sprite_index = asset_get_index(_tag_command_name);
                            var _sprite_w = sprite_get_width(_sprite_index);
                            var _sprite_h = sprite_get_height(_sprite_index);
                            var _image_index = 0;
                            var _image_speed = 0;
                            
                            switch (_tag_parameter_count)
                            {
                                case 1:
                                    _image_index = 0;
                                    _image_speed = 1;
                                    break;
                                
                                case 2:
                                    _image_index = real(_tag_parameters[1]);
                                    _image_speed = 0;
                                    break;
                                
                                default:
                                    _image_index = real(_tag_parameters[1]);
                                    _image_speed = real(_tag_parameters[2]);
                                    break;
                            }
                            
                            _image_speed *= __scribble_image_speed_get(_sprite_index);
                            
                            if (_image_speed != 0 && sprite_get_number(_sprite_index) > 1)
                                __has_animation = true;
                            
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, -1);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_1);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, _sprite_w);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _sprite_h);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _sprite_h);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, _sprite_w);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_15, undefined);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_19, _sprite_index);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_20, _image_index);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_21, _image_speed);
                            _glyph_count++;
                            _glyph_prev_arabic_join_next = false;
                            _glyph_prev = -1;
                            _glyph_prev_prev = _glyph_prev;
                        }
                        else if (asset_get_type(_tag_command_name) == 2)
                        {
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_0);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, new __scribble_class_event("__scribble_audio_playback__", _tag_parameters));
                            _control_count++;
                        }
                        else if (ds_map_exists(global.__scribble_external_sound_map, _tag_command_name))
                        {
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_0);
                            ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, new __scribble_class_event("__scribble_audio_playback__", [ds_map_find_value(global.__scribble_external_sound_map, _tag_command_name)]));
                            _control_count++;
                        }
                        else
                        {
                            var _first_char = string_copy(_tag_command_name, 1, 1);
                            
                            if (string_length(_tag_command_name) <= 7 && (_first_char == "$" || _first_char == "#"))
                            {
                                var _decoded_colour;
                                
                                try
                                {
                                    _decoded_colour = real("0x" + string_delete(_tag_command_name, 1, 1));
                                    _decoded_colour = scribble_rgb_to_bgr(_decoded_colour);
                                }
                                catch (_error)
                                {
                                    __scribble_trace("Error! \"", string_delete(_tag_command_name, 1, 2), "\" could not be converted into a hexcode");
                                    _decoded_colour = _starting_colour;
                                }
                                
                                _state_colour = (_state_colour & 4278190080) | (_decoded_colour & 16777215);
                                ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                                ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                                _control_count++;
                            }
                            else
                            {
                                var _second_char = string_copy(_tag_command_name, 2, 1);
                                
                                if ((_first_char == "d" || _first_char == "D") && (_second_char == "$" || _second_char == "#"))
                                {
                                    var _decoded_colour;
                                    
                                    try
                                    {
                                        _decoded_colour = real(string_delete(_tag_command_name, 1, 2));
                                    }
                                    catch (_error)
                                    {
                                        __scribble_trace("Error! \"", string_delete(_tag_command_name, 1, 2), "\" could not be converted into a decimal");
                                        _decoded_colour = _starting_colour;
                                    }
                                    
                                    _state_colour = (_state_colour & 4278190080) | (_decoded_colour & 16777215);
                                    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_2);
                                    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_colour);
                                    _control_count++;
                                }
                                else
                                {
                                    var _command_string = string(_tag_command_name);
                                    var _j = 1;
                                    
                                    repeat (_tag_parameter_count - 1)
                                        _command_string += ("," + string(_tag_parameters[_j++]));
                                    
                                    __scribble_trace("Warning! Unrecognised command tag [" + _command_string + "]");
                                }
                            }
                        }
                        
                        break;
                }
                
                if (_new_halign != undefined && _new_halign != _state_halign)
                {
                    _state_halign = _new_halign;
                    _new_halign = undefined;
                    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_0, UnknownEnum.Value_1);
                    ds_grid_set(_control_grid, _control_count, UnknownEnum.Value_1, _state_halign);
                    _control_count++;
                    
                    if (_glyph_count > 0)
                    {
                        if (_glyph_prev != 0 && _glyph_prev != 10)
                        {
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 10);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_2);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                            _glyph_count++;
                            _glyph_prev_arabic_join_next = false;
                            _glyph_prev = 10;
                            _glyph_prev_prev = _glyph_prev;
                        }
                        else
                        {
                            ds_grid_set_post(_glyph_grid, _glyph_count - 1, UnknownEnum.Value_17, ds_grid_get(_glyph_grid, _glyph_count - 1, UnknownEnum.Value_17) + 1);
                        }
                    }
                }
                
                if (_new_valign != undefined)
                {
                    if (__valign == undefined)
                        __valign = _new_valign;
                    else if (__valign != _new_valign)
                        __scribble_error("In-line vertical alignment cannot be set more than once");
                    
                    _new_valign = undefined;
                }
            }
            else if (_glyph_ord == 44)
            {
                _tag_parameter_count++;
                buffer_poke(_string_buffer, buffer_tell(_string_buffer) - 1, buffer_u8, 0);
            }
        }
        else if (_glyph_ord == 91 && !_ignore_commands && (_state_command_tag_flipflop || __scribble_buffer_peek_unicode(_string_buffer, buffer_tell(_string_buffer)) != 91))
        {
            if (_state_command_tag_flipflop)
            {
                _state_command_tag_flipflop = false;
            }
            else
            {
                _tag_start = buffer_tell(_string_buffer);
                _tag_parameter_count = 0;
                _tag_parameters = [];
            }
        }
        else if (_glyph_ord == 10 || (false && _glyph_ord == 35))
        {
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 10);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_2);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
            _glyph_count++;
            _glyph_prev_arabic_join_next = false;
            _glyph_prev = 10;
            _glyph_prev_prev = _glyph_prev;
        }
        else if (_glyph_ord == 9)
        {
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 9);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 4 * _font_space_width);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 4 * _font_space_width);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
            _glyph_count++;
            _glyph_prev_arabic_join_next = false;
            _glyph_prev = 9;
            _glyph_prev_prev = _glyph_prev;
        }
        else if (_glyph_ord == 32)
        {
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 32);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, _font_space_width);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, _font_space_width);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
            _glyph_count++;
            _glyph_prev_arabic_join_next = false;
            _glyph_prev = 32;
            _glyph_prev_prev = _glyph_prev;
        }
        else if (_glyph_ord == 160)
        {
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 160);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_1);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, _font_space_width);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, _font_space_width);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
            _glyph_count++;
            _glyph_prev_arabic_join_next = false;
            _glyph_prev = 160;
            _glyph_prev_prev = _glyph_prev;
        }
        else if (_glyph_ord == 8203)
        {
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 8203);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, _font_line_height);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
            _glyph_count++;
            _glyph_prev_arabic_join_next = false;
            _glyph_prev = 8203;
            _glyph_prev_prev = _glyph_prev;
        }
        else if (_glyph_ord > 32)
        {
            var _glyph_write = _glyph_ord;
            
            if (_glyph_write >= 1536 && _glyph_write <= 1791)
            {
                __has_arabic = true;
                var _buffer_offset = buffer_tell(_string_buffer);
                var _glyph_next = __scribble_buffer_peek_unicode(_string_buffer, _buffer_offset);
                
                if (_glyph_write == 1604)
                {
                    var _glyph_replacement = undefined;
                    
                    switch (_glyph_next)
                    {
                        case 1570:
                            _glyph_replacement = 65269;
                            break;
                        
                        case 1571:
                            _glyph_replacement = 65271;
                            break;
                        
                        case 1573:
                            _glyph_replacement = 65273;
                            break;
                        
                        case 1575:
                            _glyph_replacement = 65275;
                            break;
                    }
                    
                    if (_glyph_replacement != undefined)
                    {
                        _glyph_write = _glyph_replacement;
                        buffer_seek(_string_buffer, buffer_seek_relative, 2);
                        _glyph_next = __scribble_buffer_peek_unicode(_string_buffer, _buffer_offset);
                    }
                }
                
                while (_glyph_next >= 1611 && _glyph_next <= 1618)
                {
                    _buffer_offset += 2;
                    _glyph_next = __scribble_buffer_peek_unicode(_string_buffer, _buffer_offset);
                }
                
                var _new_glyph = undefined;
                
                if (_glyph_prev_arabic_join_next)
                {
                    if (ds_map_find_value(_arabic_join_prev_map, _glyph_next))
                        _new_glyph = ds_map_find_value(_arabic_medial_map, _glyph_write);
                    else
                        _new_glyph = ds_map_find_value(_arabic_final_map, _glyph_write);
                }
                else if (ds_map_find_value(_arabic_join_prev_map, _glyph_next))
                {
                    _new_glyph = ds_map_find_value(_arabic_initial_map, _glyph_write);
                }
                else
                {
                    _new_glyph = ds_map_find_value(_arabic_isolated_map, _glyph_write);
                }
                
                if (_new_glyph != undefined)
                    _glyph_write = _new_glyph;
                
                if (_glyph_ord < 1611 || _glyph_ord > 1618)
                    _glyph_prev_arabic_join_next = ds_map_find_value(_arabic_join_next_map, _glyph_ord);
                
                var _data_index = ds_map_find_value(_font_glyphs_map, _glyph_write);
                
                if (_data_index == undefined)
                {
                    __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                    _data_index = ds_map_find_value(_font_glyphs_map, 63);
                }
                
                if (_data_index == undefined)
                {
                    __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                }
                else
                {
                    ds_grid_set_grid_region(_glyph_grid, _font_glyph_data_grid, _data_index, UnknownEnum.Value_1, _data_index, UnknownEnum.Value_17, _glyph_count, UnknownEnum.Value_0);
                    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                    _glyph_count++;
                    _glyph_prev = _glyph_write;
                    _glyph_prev_prev = _glyph_prev;
                }
            }
            else
            {
                _glyph_prev_arabic_join_next = false;
                
                if (_glyph_write >= 2304 && _glyph_write <= 2431)
                {
                    __has_devanagari = true;
                    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, _glyph_write);
                    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                    _glyph_count++;
                    _glyph_prev = _glyph_write;
                    _glyph_prev_prev = _glyph_prev;
                }
                else
                {
                    if (_glyph_write >= 3584 && _glyph_write <= 3711)
                    {
                        __has_thai = true;
                        
                        if (ds_map_find_value(_thai_top_map, _glyph_write) && _glyph_count >= 1)
                        {
                            var _base = _glyph_prev;
                            
                            if (ds_map_find_value(_thai_lower_map, _base) && _glyph_count >= 2)
                                _base = _glyph_prev_prev;
                            
                            if (ds_map_find_value(_thai_base_map, _base))
                            {
                                var _glyph_next = __scribble_buffer_peek_unicode(_string_buffer, buffer_tell(_string_buffer));
                                var _followingNikhahit = _glyph_next == 3635 || _glyph_next == 3661;
                                
                                if (ds_map_find_value(_thai_base_ascender_map, _base))
                                {
                                    if (_followingNikhahit)
                                    {
                                        _glyph_write += 59595;
                                        _data_index = ds_map_find_value(_font_glyphs_map, _glyph_write);
                                        
                                        if (_data_index == undefined)
                                        {
                                            __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                                            _data_index = ds_map_find_value(_font_glyphs_map, 63);
                                        }
                                        
                                        if (_data_index == undefined)
                                        {
                                            __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                                        }
                                        else
                                        {
                                            ds_grid_set_grid_region(_glyph_grid, _font_glyph_data_grid, _data_index, UnknownEnum.Value_1, _data_index, UnknownEnum.Value_17, _glyph_count, UnknownEnum.Value_0);
                                            ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                                            _glyph_count++;
                                            _glyph_prev = _glyph_write;
                                            _glyph_prev_prev = _glyph_prev;
                                        }
                                        
                                        _glyph_write = 63249;
                                        
                                        if (_glyph_next == 3635)
                                        {
                                            _data_index = ds_map_find_value(_font_glyphs_map, _glyph_write);
                                            
                                            if (_data_index == undefined)
                                            {
                                                __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                                                _data_index = ds_map_find_value(_font_glyphs_map, 63);
                                            }
                                            
                                            if (_data_index == undefined)
                                            {
                                                __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                                            }
                                            else
                                            {
                                                ds_grid_set_grid_region(_glyph_grid, _font_glyph_data_grid, _data_index, UnknownEnum.Value_1, _data_index, UnknownEnum.Value_17, _glyph_count, UnknownEnum.Value_0);
                                                ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                                                _glyph_count++;
                                                _glyph_prev = _glyph_write;
                                                _glyph_prev_prev = _glyph_prev;
                                            }
                                            
                                            _glyph_write = 3634;
                                        }
                                        
                                        buffer_seek(_string_buffer, buffer_seek_relative, 2);
                                        _skip_write = true;
                                    }
                                    else
                                    {
                                        _glyph_write += 59581;
                                        
                                        if (_glyph_count >= 2 && ds_map_find_value(_thai_upper_map, _glyph_prev) && ds_map_find_value(_thai_base_ascender_map, _glyph_prev))
                                            _glyph_write += 59595;
                                    }
                                }
                                else if (!_followingNikhahit)
                                {
                                    _glyph_write += 59586;
                                    
                                    if (_glyph_count >= 2 && ds_map_find_value(_thai_upper_map, _glyph_prev) && ds_map_find_value(_thai_base_ascender_map, _glyph_prev))
                                        _glyph_write += 59595;
                                }
                            }
                        }
                        else if (ds_map_find_value(_thai_upper_map, _glyph_write) && _glyph_count > 0 && ds_map_find_value(_thai_base_ascender_map, _glyph_prev))
                        {
                            switch (_glyph_write)
                            {
                                case 3633:
                                    _glyph_write = 63248;
                                    break;
                                
                                case 3636:
                                    _glyph_write = 63233;
                                    break;
                                
                                case 3637:
                                    _glyph_write = 63234;
                                    break;
                                
                                case 3638:
                                    _glyph_write = 63235;
                                    break;
                                
                                case 3639:
                                    _glyph_write = 63236;
                                    break;
                                
                                case 3661:
                                    _glyph_write = 63249;
                                    break;
                                
                                case 3655:
                                    _glyph_write = 63250;
                                    break;
                            }
                        }
                        else if (ds_map_find_value(_thai_lower_map, _glyph_write) && _glyph_count > 0 && ds_map_find_value(_thai_base_descender_map, _glyph_prev))
                        {
                            _glyph_write += 59616;
                        }
                        else
                        {
                            var _glyph_next = __scribble_buffer_peek_unicode(_string_buffer, buffer_tell(_string_buffer));
                            
                            if (_glyph_write == 3597 && ds_map_find_value(_thai_lower_map, _glyph_next))
                                _glyph_write = 63247;
                            else if (_glyph_write == 3600 && ds_map_find_value(_thai_lower_map, _glyph_next))
                                _glyph_write = 63232;
                        }
                    }
                    else if (_glyph_write >= 1424 && _glyph_write <= 1535)
                    {
                        __has_hebrew = true;
                    }
                    
                    var _data_index = ds_map_find_value(_font_glyphs_map, _glyph_write);
                    
                    if (_data_index == undefined)
                    {
                        __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                        _data_index = ds_map_find_value(_font_glyphs_map, 63);
                    }
                    
                    if (_data_index == undefined)
                    {
                        __scribble_trace("Couldn't find glyph data for character code " + string(_glyph_write) + " (" + chr(_glyph_write) + ") in font \"" + string(_font_name) + "\"");
                    }
                    else
                    {
                        ds_grid_set_grid_region(_glyph_grid, _font_glyph_data_grid, _data_index, UnknownEnum.Value_1, _data_index, UnknownEnum.Value_17, _glyph_count, UnknownEnum.Value_0);
                        ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
                        _glyph_count++;
                        _glyph_prev = _glyph_write;
                        _glyph_prev_prev = _glyph_prev;
                    }
                }
            }
            
            if (_glyph_ord == 91)
                _state_command_tag_flipflop = true;
        }
    }
    
    if (_state_scale != 1)
        ds_grid_multiply_region(_glyph_grid, _state_scale_start_glyph, UnknownEnum.Value_2, _glyph_count, UnknownEnum.Value_9, _state_scale);
    
    _state_scale_start_glyph = _glyph_count;
    
    if (__has_arabic || __has_hebrew)
        __has_r2l = true;
    
    if (__valign == undefined)
        __valign = _starting_valign;
    
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_0, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_1, UnknownEnum.Value_2);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_2, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_3, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_4, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_5, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_6, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_7, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_8, 0);
    ds_grid_set(_glyph_grid, _glyph_count, UnknownEnum.Value_17, _control_count);
    
    with (global.__scribble_generator_state)
    {
        __glyph_count = _glyph_count + 1;
        __control_count = _control_count;
    }
}
