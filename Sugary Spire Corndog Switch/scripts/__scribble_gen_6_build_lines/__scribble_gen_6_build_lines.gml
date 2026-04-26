function __scribble_gen_6_build_lines()
{
    var _glyph_grid = global.__scribble_glyph_grid;
    var _word_grid = global.__scribble_word_grid;
    var _line_grid = global.__scribble_line_grid;
    var _control_grid = global.__scribble_control_grid;
    var _temp_grid = global.__scribble_temp_grid;
    var _model_max_width, _model_max_height, _word_count, _wrap_no_pages, _line_height_min, _line_height_max, _line_spacing_add, _line_spacing_multiply, _wrap_max_scale;
    
    with (global.__scribble_generator_state)
    {
        var _element = __element;
        _word_count = __word_count;
        _line_height_min = __line_height_min;
        _line_height_max = __line_height_max;
        _line_spacing_add = __line_spacing_add;
        _line_spacing_multiply = __line_spacing_multiply;
        _model_max_width = __model_max_width;
        _model_max_height = __model_max_height;
        _wrap_no_pages = _element.__wrap_no_pages;
        _wrap_max_scale = _element.__wrap_max_scale;
    }
    
    var _fit_to_box_iterations = 0;
    var _lower_limit = undefined;
    var _upper_limit = undefined;
    var _line_count, _simulated_model_max_width;
    
    repeat (max(1, 7))
    {
        var _line_max_y = 0;
        _simulated_model_max_width = _model_max_width / __fit_scale;
        var _simulated_model_max_height = _model_max_height / __fit_scale;
        _line_count = 0;
        var _word_broken = false;
        
        if (_word_count > 0)
        {
            var _state_halign = 0;
            var _control_index = 0;
            var _word_x = 0;
            var _line_y = 0;
            var _control_delta = ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_17) - _control_index;
            
            repeat (_control_delta)
            {
                if (ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_0) == UnknownEnum.Value_1)
                    _state_halign = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                
                _control_index++;
            }
            
            var _i = 0;
            var _word_width = 0;
            var _line_word_start = 0;
            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
            
            if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
            {
                _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                
                if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                {
                    ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                    _word_width += _left_correction;
                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                }
            }
            
            _word_x = 0;
            
            repeat (_word_count)
            {
                _word_width = ds_grid_get(_word_grid, _i, UnknownEnum.Value_4);
                var _word_start_glyph = ds_grid_get(_word_grid, _i, UnknownEnum.Value_2);
                _control_delta = ds_grid_get(_glyph_grid, _word_start_glyph, UnknownEnum.Value_17) - _control_index;
                
                repeat (_control_delta)
                {
                    if (ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_0) == UnknownEnum.Value_1)
                        _state_halign = ds_grid_get(_control_grid, _control_index, UnknownEnum.Value_1);
                    
                    _control_index++;
                }
                
                switch (_state_halign)
                {
                    case 0:
                        global.__scribble_generator_state.__uses_halign_left = true;
                        break;
                    
                    case 1:
                        global.__scribble_generator_state.__uses_halign_center = true;
                        break;
                    
                    case 2:
                        global.__scribble_generator_state.__uses_halign_right = true;
                        break;
                }
                
                if ((_word_x + _word_width) > _simulated_model_max_width)
                {
                    __wrapped = true;
                    
                    if (_word_width >= _simulated_model_max_width)
                    {
                        _word_broken = true;
                        
                        if (_wrap_no_pages)
                            break;
                        
                        if (ds_grid_get(_word_grid, _i, UnknownEnum.Value_1) >= UnknownEnum.Value_6)
                        {
                            _line_word_end = _i;
                            var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                            var _line_height;
                            
                            if (_found_line_height < _line_height_min)
                            {
                                if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                    _line_height = _line_height_min;
                                else
                                    _line_height = _line_height_min + 1;
                            }
                            else if (_found_line_height > _line_height_max)
                            {
                                if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                    _line_height = _line_height_max;
                                else
                                    _line_height = _line_height_max - 1;
                            }
                            else
                            {
                                _line_height = _found_line_height;
                            }
                            
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                            _line_count++;
                            
                            if ((_line_y + _line_height) > _line_max_y)
                                _line_max_y = _line_y + _line_height;
                            
                            _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                            _line_word_start = _i + 1;
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                            
                            if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                            {
                                _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                                _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                                var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                                
                                if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                                {
                                    ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                    _word_width += _left_correction;
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                                }
                            }
                            
                            _word_x = 0;
                        }
                        else
                        {
                            var _stashed_word_count = _word_count - (_i + 1);
                            ds_grid_set_grid_region(_temp_grid, _word_grid, _i + 1, 0, _word_count, 5, 0, 0);
                            var _original_word_bidi_raw = ds_grid_get(_word_grid, _i, UnknownEnum.Value_0);
                            var _original_word_bidi = ds_grid_get(_word_grid, _i, UnknownEnum.Value_1);
                            var _original_word_glyph_start = ds_grid_get(_word_grid, _i, UnknownEnum.Value_2);
                            var _original_word_glyph_end = ds_grid_get(_word_grid, _i, UnknownEnum.Value_3);
                            var _original_word_height = ds_grid_get(_word_grid, _i, UnknownEnum.Value_5);
                            var _new_word_start_x = _word_x;
                            var _new_word_glyph_start = _original_word_glyph_start;
                            var _j = _new_word_glyph_start;
                            var _glyph_width = ds_grid_get(_glyph_grid, _j, UnknownEnum.Value_7);
                            
                            if ((_word_x + _glyph_width) >= _simulated_model_max_width && _i > _line_word_start)
                            {
                                _line_word_end = _i - 1;
                                var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                                var _line_height;
                                
                                if (_found_line_height < _line_height_min)
                                {
                                    if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                        _line_height = _line_height_min;
                                    else
                                        _line_height = _line_height_min + 1;
                                }
                                else if (_found_line_height > _line_height_max)
                                {
                                    if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                        _line_height = _line_height_max;
                                    else
                                        _line_height = _line_height_max - 1;
                                }
                                else
                                {
                                    _line_height = _found_line_height;
                                }
                                
                                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                                _line_count++;
                                
                                if ((_line_y + _line_height) > _line_max_y)
                                    _line_max_y = _line_y + _line_height;
                                
                                _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                                _line_word_start = _i;
                                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                                
                                if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                                {
                                    _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                                    _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                                    var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                                    
                                    if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                                    {
                                        ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                        _word_width += _left_correction;
                                        ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                                    }
                                }
                                
                                _word_x = 0;
                                _new_word_start_x = 0;
                            }
                            
                            _word_x += _glyph_width;
                            _j++;
                            
                            repeat ((1 + _original_word_glyph_end) - _j)
                            {
                                _glyph_width = ds_grid_get(_glyph_grid, _j, UnknownEnum.Value_7);
                                
                                if ((_word_x + _glyph_width) >= _simulated_model_max_width)
                                {
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_0, _original_word_bidi_raw);
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_1, _original_word_bidi);
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_2, _new_word_glyph_start);
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_3, _j - 1);
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, _word_x - _new_word_start_x);
                                    ds_grid_set(_word_grid, _i, UnknownEnum.Value_5, _original_word_height);
                                    ds_grid_add_region(_glyph_grid, _j, UnknownEnum.Value_2, _original_word_glyph_end, UnknownEnum.Value_2, -(_word_x - _new_word_start_x));
                                    _line_word_end = _i;
                                    var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                                    var _line_height;
                                    
                                    if (_found_line_height < _line_height_min)
                                    {
                                        if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                            _line_height = _line_height_min;
                                        else
                                            _line_height = _line_height_min + 1;
                                    }
                                    else if (_found_line_height > _line_height_max)
                                    {
                                        if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                            _line_height = _line_height_max;
                                        else
                                            _line_height = _line_height_max - 1;
                                    }
                                    else
                                    {
                                        _line_height = _found_line_height;
                                    }
                                    
                                    ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                                    ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                                    ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                                    _line_count++;
                                    
                                    if ((_line_y + _line_height) > _line_max_y)
                                        _line_max_y = _line_y + _line_height;
                                    
                                    _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                                    _line_word_start = _i + 1;
                                    ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                                    ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                                    ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                                    
                                    if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                                    {
                                        _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                                        _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                                        var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                                        
                                        if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                                        {
                                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                            _word_width += _left_correction;
                                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                                        }
                                    }
                                    
                                    _word_x = 0;
                                    _new_word_start_x = 0;
                                    _new_word_glyph_start = _j;
                                    _i++;
                                    _word_count++;
                                }
                                
                                _word_x += _glyph_width;
                                _j++;
                            }
                            
                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_0, _original_word_bidi_raw);
                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_1, _original_word_bidi);
                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_2, _new_word_glyph_start);
                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_3, _j - 1);
                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, _word_x - _new_word_start_x);
                            ds_grid_set(_word_grid, _i, UnknownEnum.Value_5, _original_word_height);
                            ds_grid_set_grid_region(_word_grid, _temp_grid, 0, 0, _stashed_word_count, 5, _i + 1, 0);
                            _word_width = 0;
                        }
                    }
                    else if (true && ds_grid_get(_word_grid, _i, UnknownEnum.Value_0) == UnknownEnum.Value_0)
                    {
                        _word_x += _word_width;
                        _line_word_end = _i;
                        var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                        var _line_height;
                        
                        if (_found_line_height < _line_height_min)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                _line_height = _line_height_min;
                            else
                                _line_height = _line_height_min + 1;
                        }
                        else if (_found_line_height > _line_height_max)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                _line_height = _line_height_max;
                            else
                                _line_height = _line_height_max - 1;
                        }
                        else
                        {
                            _line_height = _found_line_height;
                        }
                        
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                        _line_count++;
                        
                        if ((_line_y + _line_height) > _line_max_y)
                            _line_max_y = _line_y + _line_height;
                        
                        _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                        _line_word_start = _i + 1;
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                        
                        if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                        {
                            _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                            _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                            var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                            
                            if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                            {
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                _word_width += _left_correction;
                                ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                            }
                        }
                        
                        _word_x = 0;
                        _word_width = 0;
                    }
                    else
                    {
                        _line_word_end = _i - 1;
                        var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                        var _line_height;
                        
                        if (_found_line_height < _line_height_min)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                _line_height = _line_height_min;
                            else
                                _line_height = _line_height_min + 1;
                        }
                        else if (_found_line_height > _line_height_max)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                _line_height = _line_height_max;
                            else
                                _line_height = _line_height_max - 1;
                        }
                        else
                        {
                            _line_height = _found_line_height;
                        }
                        
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                        _line_count++;
                        
                        if ((_line_y + _line_height) > _line_max_y)
                            _line_max_y = _line_y + _line_height;
                        
                        _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                        _line_word_start = _i;
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                        
                        if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                        {
                            _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                            _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                            var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                            
                            if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                            {
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                _word_width += _left_correction;
                                ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                            }
                        }
                        
                        _word_x = 0;
                    }
                }
                else
                {
                    var _glyph_start_ord = ds_grid_get(_glyph_grid, _word_start_glyph, UnknownEnum.Value_0);
                    
                    if (_glyph_start_ord == 10)
                    {
                        _line_word_end = _i;
                        var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                        var _line_height;
                        
                        if (_found_line_height < _line_height_min)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                _line_height = _line_height_min;
                            else
                                _line_height = _line_height_min + 1;
                        }
                        else if (_found_line_height > _line_height_max)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                _line_height = _line_height_max;
                            else
                                _line_height = _line_height_max - 1;
                        }
                        else
                        {
                            _line_height = _found_line_height;
                        }
                        
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                        _line_count++;
                        
                        if ((_line_y + _line_height) > _line_max_y)
                            _line_max_y = _line_y + _line_height;
                        
                        _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                        _line_word_start = _i + 1;
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                        
                        if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                        {
                            _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                            _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                            var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                            
                            if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                            {
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                _word_width += _left_correction;
                                ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                            }
                        }
                        
                        _word_x = 0;
                    }
                    else if (_glyph_start_ord == 0)
                    {
                        _line_word_end = _i;
                        var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                        var _line_height;
                        
                        if (_found_line_height < _line_height_min)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                                _line_height = _line_height_min;
                            else
                                _line_height = _line_height_min + 1;
                        }
                        else if (_found_line_height > _line_height_max)
                        {
                            if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                                _line_height = _line_height_max;
                            else
                                _line_height = _line_height_max - 1;
                        }
                        else
                        {
                            _line_height = _found_line_height;
                        }
                        
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                        _line_count++;
                        
                        if ((_line_y + _line_height) > _line_max_y)
                            _line_max_y = _line_y + _line_height;
                        
                        _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                        _line_y = 0;
                        _line_word_start = _i + 1;
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_1, _line_word_start);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_5, _state_halign);
                        ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, false);
                        
                        if (ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_1) < UnknownEnum.Value_6)
                        {
                            _word_glyph_start = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_2);
                            _word_glyph_end = ds_grid_get(_word_grid, _line_word_start, UnknownEnum.Value_3);
                            var _left_correction = ds_grid_get(_glyph_grid, _word_glyph_start, UnknownEnum.Value_8);
                            
                            if ((_left_correction > 0 && true) || (_left_correction < 0 && false))
                            {
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, _left_correction);
                                _word_width += _left_correction;
                                ds_grid_set(_word_grid, _i, UnknownEnum.Value_4, ds_grid_get(_word_grid, _i, UnknownEnum.Value_4) + _left_correction);
                            }
                        }
                        
                        _word_x = 0;
                        
                        if (_i < (_word_count - 1))
                            ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_6, true);
                    }
                }
                
                _word_x += _word_width;
                _i++;
            }
            
            var _line_word_end = _i - 1;
            
            if (_line_word_end >= _line_word_start)
            {
                var _found_line_height = ds_grid_get_max(_word_grid, _line_word_start, UnknownEnum.Value_5, _line_word_end, UnknownEnum.Value_5);
                var _line_height;
                
                if (_found_line_height < _line_height_min)
                {
                    if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_min / 2) == (_line_height_min div 2)))
                        _line_height = _line_height_min;
                    else
                        _line_height = _line_height_min + 1;
                }
                else if (_found_line_height > _line_height_max)
                {
                    if (((_found_line_height / 2) == (_found_line_height div 2)) == ((_line_height_max / 2) == (_line_height_max div 2)))
                        _line_height = _line_height_max;
                    else
                        _line_height = _line_height_max - 1;
                }
                else
                {
                    _line_height = _found_line_height;
                }
                
                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_2, _line_word_end);
                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_3, _word_x);
                ds_grid_set(_line_grid, _line_count, UnknownEnum.Value_4, _line_height);
                _line_count++;
                
                if ((_line_y + _line_height) > _line_max_y)
                    _line_max_y = _line_y + _line_height;
                
                _line_y += (_line_spacing_add + (_line_height * _line_spacing_multiply));
                _line_y += _line_height;
                __scribble_trace("Warning! Model generator found hanging line data");
            }
        }
        
        if (!_wrap_no_pages || false)
            break;
        
        _fit_to_box_iterations++;
        
        if (_line_max_y < _simulated_model_max_height && !_word_broken)
        {
            if (__fit_scale >= _wrap_max_scale)
                break;
            
            _lower_limit = __fit_scale;
        }
        else
        {
            _upper_limit = __fit_scale;
        }
        
        if (_fit_to_box_iterations >= 6)
        {
            if (__fit_scale == _lower_limit)
                break;
            
            __fit_scale = (_lower_limit == undefined) ? _upper_limit : _lower_limit;
        }
        else if (_lower_limit == undefined)
        {
            __fit_scale *= 0.5;
        }
        else if (_upper_limit == undefined)
        {
            __fit_scale = min(_wrap_max_scale, 2 * __fit_scale);
        }
        else
        {
            __fit_scale = _lower_limit + (0.5 * (_upper_limit - _lower_limit));
        }
    }
    
    var _line = 0;
    
    repeat (_line_count)
    {
        var _line_end_word = ds_grid_get(_line_grid, _line, UnknownEnum.Value_2);
        
        if (ds_grid_get(_word_grid, _line_end_word, UnknownEnum.Value_0) == UnknownEnum.Value_0)
        {
            var _line_width = ds_grid_get(_line_grid, _line, UnknownEnum.Value_3);
            
            if (_line_width > _simulated_model_max_width)
            {
                var _delta = _simulated_model_max_width - _line_width;
                ds_grid_set(_line_grid, _line, UnknownEnum.Value_3, _simulated_model_max_width);
                ds_grid_set(_word_grid, _line_end_word, UnknownEnum.Value_4, ds_grid_get(_word_grid, _line_end_word, UnknownEnum.Value_4) + _delta);
                var _word_start_glyph = ds_grid_get(_word_grid, _line_end_word, UnknownEnum.Value_2);
                ds_grid_set(_glyph_grid, _word_start_glyph, UnknownEnum.Value_4, ds_grid_get(_glyph_grid, _word_start_glyph, UnknownEnum.Value_4) + _delta);
                ds_grid_set(_glyph_grid, _word_start_glyph, UnknownEnum.Value_7, ds_grid_get(_glyph_grid, _word_start_glyph, UnknownEnum.Value_7) + _delta);
            }
        }
        
        _line++;
    }
    
    __width = ds_grid_get_max(_line_grid, 0, UnknownEnum.Value_3, _line_count - 1, UnknownEnum.Value_3);
    
    with (global.__scribble_generator_state)
    {
        __word_count = _word_count;
        __line_count = _line_count;
    }
}
