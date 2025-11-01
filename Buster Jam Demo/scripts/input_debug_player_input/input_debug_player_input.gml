function input_debug_player_input(arg0 = 0)
{
    static _global = __input_global();
    
    if (arg0 < 0)
    {
        __input_error("Invalid player index provided (", arg0, ")");
        return undefined;
    }
    
    if (arg0 >= 2)
    {
        __input_error("Player index too large (", arg0, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    var _result = [];
    
    var _filter_func = function(arg0, arg1, arg2)
    {
        if (is_struct(arg1) && variable_struct_exists(arg1, string(arg0)))
            return false;
        
        if (is_struct(arg2) && !variable_struct_exists(arg2, string(arg0)))
            return false;
        
        return true;
    };
    
    with (_global.__players[arg0])
    {
        var _source_filter = __rebind_source_filter ?? __source_array;
        
        if (__source_contains(__input_global().__source_touch, false))
            return _result;
        
        if (array_length(__source_array) <= 0)
            return _result;
        
        if (array_length(_source_filter) <= 0)
            return _result;
        
        if (__ghost)
            return _result;
        
        if (!__active)
            return _result;
        
        if (!__connected)
            return _result;
        
        var _ignore_struct = __rebind_ignore_struct;
        var _allow_struct = __rebind_allow_struct;
        var _i = 0;
        
        repeat (array_length(_source_filter))
        {
            if (_global.__use_is_instanceof)
            {
                if (!is_instanceof(_source_filter[_i], __input_class_source))
                    __input_error("Value in filter array is not a source (index ", _i, ", ", _source_filter[_i], ")");
            }
            else if (instanceof(_source_filter[_i]) != "__input_class_source")
            {
                __input_error("Value in filter array is not a source (index ", _i, ", ", _source_filter[_i], ")");
            }
            
            with (_source_filter[_i])
            {
                if (self == __input_global().__source_keyboard)
                {
                    if (_global.__any_keyboard_binding_defined)
                    {
                        var _j = 8;
                        
                        repeat (249)
                        {
                            var _keyboard_key;
                            
                            if (_j == 256)
                            {
                                _keyboard_key = __input_keyboard_key();
                                
                                if (_keyboard_key <= 256)
                                    break;
                            }
                            else
                            {
                                _keyboard_key = _j;
                            }
                            
                            if (keyboard_check(_keyboard_key) && _keyboard_key >= 8 && _keyboard_key <= 57343 && !__input_key_is_ignored(_keyboard_key) && _filter_func(_keyboard_key, _ignore_struct, _allow_struct))
                            {
                                var _binding = new __input_class_binding();
                                _binding.__set_key(_keyboard_key, true);
                                array_push(_result, _binding);
                            }
                            
                            _j++;
                        }
                    }
                }
                
                if (self == __input_global().__source_mouse)
                {
                    if (_global.__mouse_allowed && _global.__game_input_allowed && !_global.__window_focus_block_mouse)
                    {
                        if (_filter_func(1, _ignore_struct, _allow_struct) && mouse_check_button(mb_left))
                            array_push(_result, input_binding_mouse_button(1));
                        
                        if (_filter_func(3, _ignore_struct, _allow_struct) && mouse_check_button(mb_middle))
                            array_push(_result, input_binding_mouse_button(3));
                        
                        if (_filter_func(2, _ignore_struct, _allow_struct) && mouse_check_button(mb_right))
                            array_push(_result, input_binding_mouse_button(2));
                        
                        if (_filter_func(4, _ignore_struct, _allow_struct) && mouse_check_button(4))
                            array_push(_result, input_binding_mouse_button(4));
                        
                        if (_filter_func(5, _ignore_struct, _allow_struct) && mouse_check_button(5))
                            array_push(_result, input_binding_mouse_button(5));
                    }
                    
                    if (mouse_wheel_up() && _filter_func("mouse wheel up", _ignore_struct, _allow_struct))
                        array_push(_result, input_binding_mouse_wheel_up());
                    
                    if (mouse_wheel_down() && _filter_func("mouse wheel down", _ignore_struct, _allow_struct))
                        array_push(_result, input_binding_mouse_wheel_down());
                }
                
                if (__source == (2 << 0))
                {
                    if (_global.__any_gamepad_binding_defined)
                    {
                        var _check_array = [32769, 32770, 32771, 32772, 32781, 32782, 32783, 32784, 32773, 32774, 32775, 32776, 32778, 32777, 32779, 32780, 32785, 32786, 32787, 32788, __input_global().__gp_paddle1, __input_global().__gp_paddle2, __input_global().__gp_paddle3, __input_global().__gp_paddle4, __input_global().__gp_guide, __input_global().__gp_touchpad, __input_global().__gp_misc1];
                        var _j = 0;
                        
                        repeat (array_length(_check_array))
                        {
                            var _check = _check_array[_j];
                            
                            if (input_gamepad_is_axis(__gamepad, _check))
                            {
                                var _value = input_gamepad_value(__gamepad, _check);
                                
                                if (abs(_value) > input_axis_threshold_get(_check, arg0).__mini && _filter_func(_check, _ignore_struct, _allow_struct))
                                {
                                    var _binding = input_binding_gamepad_axis(_check, _value < 0);
                                    
                                    if (_global.__source_mode == (4 << 0))
                                        _binding.__gamepad_set(__gamepad);
                                    
                                    array_push(_result, _binding);
                                }
                            }
                            else if (input_gamepad_check(__gamepad, _check) && _filter_func(_check, _ignore_struct, _allow_struct))
                            {
                                var _binding = input_binding_gamepad_button(_check);
                                
                                if (_global.__source_mode == (4 << 0))
                                    _binding.__gamepad_set(__gamepad);
                                
                                array_push(_result, _binding);
                            }
                            
                            _j++;
                        }
                    }
                }
            }
            
            _i++;
        }
    }
    
    return _result;
}
