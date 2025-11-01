function input_check_quick_pressed_2d(arg0, arg1, arg2, arg3, arg4 = 0)
{
    static _global = __input_global();
    
    var _player_verbs_struct;
    
    if (!is_struct(arg4))
    {
        if (arg4 < 0)
        {
            __input_error("Invalid player index provided (", arg4, ")");
            return undefined;
        }
        
        if (arg4 >= 2)
        {
            __input_error("Player index too large (", arg4, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
            return undefined;
        }
        
        _player_verbs_struct = _global.__players[arg4].__verb_state_dict;
    }
    else
    {
        _player_verbs_struct = arg4.__verb_state_dict;
    }
    
    var _verb_struct_l = variable_struct_get(_player_verbs_struct, arg0);
    var _verb_struct_r = variable_struct_get(_player_verbs_struct, arg1);
    var _verb_struct_u = variable_struct_get(_player_verbs_struct, arg2);
    var _verb_struct_d = variable_struct_get(_player_verbs_struct, arg3);
    
    if (!is_struct(_verb_struct_l))
        __input_error("Left verb not recognised (", arg0, ")");
    
    if (!is_struct(_verb_struct_r))
        __input_error("Right verb not recognised (", arg1, ")");
    
    if (!is_struct(_verb_struct_u))
        __input_error("Up verb not recognised (", arg2, ")");
    
    if (!is_struct(_verb_struct_d))
        __input_error("Down verb not recognised (", arg3, ")");
    
    if (_verb_struct_l.__inactive || _verb_struct_r.__inactive || _verb_struct_u.__inactive || _verb_struct_d.__inactive)
        return false;
    
    var _value_l = _verb_struct_l.__raw;
    var _value_r = _verb_struct_r.__raw;
    var _value_u = _verb_struct_u.__raw;
    var _value_d = _verb_struct_d.__raw;
    
    if ((_value_l > 0 && !_verb_struct_l.__raw_analogue) || (_value_r > 0 && !_verb_struct_r.__raw_analogue) || (_value_u > 0 && !_verb_struct_u.__raw_analogue) || (_value_d > 0 && !_verb_struct_d.__raw_analogue))
        return false;
    
    var _active_count = 0;
    var _min_threshold = 0;
    var _max_threshold = 0;
    
    if (_value_l > 0)
    {
        _active_count++;
        _min_threshold += _verb_struct_l.__min_threshold;
        _max_threshold += _verb_struct_l.__max_threshold;
    }
    
    if (_value_r > 0)
    {
        _active_count++;
        _min_threshold += _verb_struct_r.__min_threshold;
        _max_threshold += _verb_struct_r.__max_threshold;
    }
    
    if (_value_u > 0)
    {
        _active_count++;
        _min_threshold += _verb_struct_u.__min_threshold;
        _max_threshold += _verb_struct_u.__max_threshold;
    }
    
    if (_value_d > 0)
    {
        _active_count++;
        _min_threshold += _verb_struct_d.__min_threshold;
        _max_threshold += _verb_struct_d.__max_threshold;
    }
    
    _min_threshold /= _active_count;
    _max_threshold /= _active_count;
    var _dx = _value_r - _value_l;
    var _dy = _value_d - _value_u;
    var _d = sqrt((_dx * _dx) + (_dy * _dy));
    
    if (_d < _max_threshold)
        return false;
    
    _dx /= _d;
    _dy /= _d;
    var _history_l = _verb_struct_l.__raw_history_array;
    var _history_r = _verb_struct_r.__raw_history_array;
    var _history_u = _verb_struct_u.__raw_history_array;
    var _history_d = _verb_struct_d.__raw_history_array;
    var _hx = _history_r[1] - _history_l[1];
    var _hy = _history_d[1] - _history_u[1];
    
    if (sqrt((_hx * _hx) + (_hy * _hy)) >= _max_threshold)
        return false;
    
    var _i = 1;
    
    repeat (3)
    {
        _hx = _history_r[_i] - _history_l[_i];
        _hy = _history_d[_i] - _history_u[_i];
        
        if (sqrt((_hx * _hx) + (_hy * _hy)) < _min_threshold || dot_product(_dx, _dy, _hx, _hy) < -_min_threshold)
            return true;
        
        _i++;
    }
    
    return false;
}
