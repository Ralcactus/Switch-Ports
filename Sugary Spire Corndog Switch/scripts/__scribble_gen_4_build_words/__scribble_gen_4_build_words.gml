function __scribble_gen_4_build_words()
{
    var _glyph_grid = global.__scribble_glyph_grid;
    var _word_grid = global.__scribble_word_grid;
    var _overall_bidi, _glyph_count, _wrap_per_char;
    
    with (global.__scribble_generator_state)
    {
        var _element = __element;
        _glyph_count = __glyph_count;
        _overall_bidi = __overall_bidi;
        _wrap_per_char = _element.__wrap_per_char;
    }
    
    var _word_count = 0;
    var _word_width = 0;
    var _word_glyph_start = 0;
    var _word_glyph_end = undefined;
    var _word_bidi = _overall_bidi;
    var _glyph_prev_whitespace = _word_bidi == UnknownEnum.Value_0;
    
    if (_glyph_count > 0)
    {
        _word_bidi = ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_1);
        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
        
        if (_word_bidi < UnknownEnum.Value_6)
        {
            _word_width += ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_7);
            ds_grid_set(_glyph_grid, 0, UnknownEnum.Value_18, 0);
        }
        else
        {
            _word_width -= ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_7);
            ds_grid_set(_glyph_grid, 0, UnknownEnum.Value_2, ds_grid_get(_glyph_grid, 0, UnknownEnum.Value_2) + _word_width);
        }
        
        var _i = 1;
        
        repeat (_glyph_count - 1)
        {
            var _glyph_bidi = ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_1);
            
            switch (_glyph_bidi)
            {
                case UnknownEnum.Value_0:
                    if (_wrap_per_char || _glyph_prev_whitespace)
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                    }
                    else
                    {
                        _glyph_prev_whitespace = true;
                        
                        if (true || (_word_bidi != _overall_bidi && _glyph_bidi != _word_bidi))
                        {
                            _word_glyph_end = _i - 1;
                            
                            if (_word_bidi == UnknownEnum.Value_7)
                            {
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                                ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                            }
                            else
                            {
                                if (_word_bidi == UnknownEnum.Value_5)
                                    ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                                
                                if (_word_bidi == UnknownEnum.Value_6)
                                    ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            }
                            
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                            _word_count++;
                            _word_width = 0;
                            _word_glyph_start = _i;
                            _word_bidi = _glyph_bidi;
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_1:
                    if (_word_bidi != UnknownEnum.Value_0 && _word_bidi != UnknownEnum.Value_2)
                    {
                        _glyph_bidi = _word_bidi;
                    }
                    else if (_glyph_prev_whitespace)
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                        _glyph_prev_whitespace = false;
                    }
                    else if (_glyph_bidi != _word_bidi)
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                    }
                    
                    break;
                
                case UnknownEnum.Value_2:
                    _word_glyph_end = _i - 1;
                    
                    if (_word_bidi == UnknownEnum.Value_7)
                    {
                        ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                    }
                    else
                    {
                        if (_word_bidi == UnknownEnum.Value_5)
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                        
                        if (_word_bidi == UnknownEnum.Value_6)
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                    }
                    
                    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                    _word_count++;
                    _word_width = 0;
                    _word_glyph_start = _i;
                    _word_bidi = _glyph_bidi;
                    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                    _glyph_prev_whitespace = false;
                    break;
                
                case UnknownEnum.Value_3:
                    if (_glyph_prev_whitespace)
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                        _glyph_prev_whitespace = false;
                    }
                    else if (_word_bidi == UnknownEnum.Value_1)
                    {
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _glyph_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, _glyph_bidi);
                    }
                    else
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                    }
                    
                    break;
                
                case UnknownEnum.Value_4:
                case UnknownEnum.Value_5:
                case UnknownEnum.Value_6:
                case UnknownEnum.Value_7:
                    if (_glyph_prev_whitespace)
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                        _glyph_prev_whitespace = false;
                    }
                    else if (_word_bidi == UnknownEnum.Value_1)
                    {
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _glyph_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, _glyph_bidi);
                        
                        if (_word_bidi >= UnknownEnum.Value_6)
                        {
                            _word_width = 0;
                            var _j = _word_glyph_start;
                            
                            repeat (_i - _j)
                            {
                                ds_grid_set(_glyph_grid, _j, UnknownEnum.Value_2, ds_grid_get(_glyph_grid, _j, UnknownEnum.Value_2) + _word_width);
                                _word_width -= ds_grid_get(_glyph_grid, _j, UnknownEnum.Value_7);
                                ds_grid_set(_glyph_grid, _j, UnknownEnum.Value_2, ds_grid_get(_glyph_grid, _j, UnknownEnum.Value_2) + _word_width);
                                _j++;
                            }
                        }
                    }
                    else if (_wrap_per_char || _glyph_bidi != _word_bidi)
                    {
                        _word_glyph_end = _i - 1;
                        
                        if (_word_bidi == UnknownEnum.Value_7)
                        {
                            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
                        }
                        else
                        {
                            if (_word_bidi == UnknownEnum.Value_5)
                                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
                            
                            if (_word_bidi == UnknownEnum.Value_6)
                                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
                        }
                        
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
                        _word_count++;
                        _word_width = 0;
                        _word_glyph_start = _i;
                        _word_bidi = _glyph_bidi;
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_start);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, _word_bidi);
                        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, (_word_bidi == UnknownEnum.Value_2 || _word_bidi == UnknownEnum.Value_3) ? UnknownEnum.Value_4 : _word_bidi);
                    }
                    
                    break;
            }
            
            if (_word_bidi < UnknownEnum.Value_6)
            {
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_2, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_2) + _word_width);
                _word_width += ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_7);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_18, _i);
            }
            else
            {
                _word_width -= ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_7);
                ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_2, ds_grid_get(_glyph_grid, _i, UnknownEnum.Value_2) + _word_width);
                
                if (_word_bidi == UnknownEnum.Value_6)
                    ds_grid_set(_glyph_grid, _i, UnknownEnum.Value_18, _i);
            }
            
            _i++;
        }
        
        _word_glyph_end = _i - 1;
        
        if (_word_bidi == UnknownEnum.Value_7)
        {
            ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
            ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
            ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_6);
        }
        else
        {
            if (_word_bidi == UnknownEnum.Value_5)
                ds_grid_set_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_18, _word_glyph_end, UnknownEnum.Value_18, _word_glyph_start);
            
            if (_word_bidi == UnknownEnum.Value_6)
                ds_grid_add_region(_glyph_grid, _word_glyph_start, UnknownEnum.Value_2, _word_glyph_end, UnknownEnum.Value_2, abs(_word_width));
        }
        
        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end);
        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, abs(_word_width));
        ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, ds_grid_get_max(_glyph_grid, _word_glyph_start, UnknownEnum.Value_6, _word_glyph_end, UnknownEnum.Value_6));
        _word_count++;
    }
    
    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_2, _word_glyph_end + 1);
    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_3, _word_glyph_end + 1);
    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_4, 0);
    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_5, 0);
    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_0, UnknownEnum.Value_1);
    ds_grid_set(_word_grid, _word_count, UnknownEnum.Value_1, UnknownEnum.Value_1);
    
    with (global.__scribble_generator_state)
        __word_count = _word_count;
}
