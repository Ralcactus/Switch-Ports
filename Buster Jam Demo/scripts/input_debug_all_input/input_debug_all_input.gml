function input_debug_all_input(arg0 = undefined, arg1 = undefined, arg2 = undefined)
{
    static _global = __input_global();
    
    var _result = [];
    
    if (!is_array(arg1) && arg1 != undefined)
        arg1 = [arg1];
    
    if (!is_array(arg0) && arg0 != undefined)
        arg0 = [arg0];
    
    var _ignore_struct = undefined;
    var _allow_struct = undefined;
    
    if (is_array(arg0))
    {
        _ignore_struct = {};
        _i = 0;
        
        repeat (array_length(arg0))
        {
            var _value = arg0[_i];
            
            if (is_string(_value) && _value != "mouse wheel up" && _value != "mouse wheel down")
                _value = ord(_value);
            
            variable_struct_set(_ignore_struct, string(_value), true);
            _i++;
        }
    }
    
    if (is_array(arg1))
    {
        _allow_struct = {};
        _i = 0;
        
        repeat (array_length(arg1))
        {
            var _value = arg1[_i];
            
            if (is_string(_value) && _value != "mouse wheel up" && _value != "mouse wheel down")
                _value = ord(_value);
            
            variable_struct_set(_allow_struct, string(_value), true);
            _i++;
        }
    }
    
    var _filter_func = function(arg0, arg1, arg2)
    {
        if (is_struct(arg1) && variable_struct_exists(arg1, string(arg0)))
            return false;
        
        if (is_struct(arg2) && !variable_struct_exists(arg2, string(arg0)))
            return false;
        
        return true;
    };
    
    if (arg2 == undefined)
    {
        arg2 = [__input_global().__source_keyboard];
        _i = 0;
        
        repeat (array_length(__input_global().__source_gamepad))
        {
            array_push(arg2, __input_global().__source_gamepad[_i]);
            _i++;
        }
    }
    
    if (array_length(arg2) <= 0)
        return _result;
    
    var _i = 0;
    
    repeat (array_length(arg2))
    {
        if (_global.__use_is_instanceof)
        {
            if (!is_instanceof(arg2[_i], __input_class_source))
                __input_error("Value in filter array is not a source (index ", _i, ", ", arg2[_i], ")");
        }
        else if (instanceof(arg2[_i]) != "__input_class_source")
        {
            __input_error("Value in filter array is not a source (index ", _i, ", ", arg2[_i], ")");
        }
        
        with (arg2[_i])
        {
            if (self == __input_global().__source_keyboard && _global.__any_keyboard_binding_defined)
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
            
            if (self == __input_global().__source_mouse && true)
            {
                if (_global.__mouse_allowed && !_global.__window_focus_block_mouse)
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
            
            if (__source == (2 << 0) && _global.__any_gamepad_binding_defined)
            {
                var _check_array = [32769, 32770, 32771, 32772, 32781, 32782, 32783, 32784, 32773, 32774, 32775, 32776, 32778, 32777, 32779, 32780, 32785, 32786, 32787, 32788, __input_global().__gp_paddle1, __input_global().__gp_paddle2, __input_global().__gp_paddle3, __input_global().__gp_paddle4, __input_global().__gp_guide, __input_global().__gp_touchpad, __input_global().__gp_misc1];
                var _j = 0;
                
                repeat (array_length(_check_array))
                {
                    var _check = _check_array[_j];
                    
                    if (input_gamepad_is_axis(__gamepad, _check))
                    {
                        var _value = input_gamepad_value(__gamepad, _check);
                        var _threshold = __input_axis_is_directional(_check) ? 0.1 : 0.02;
                        
                        if (abs(_value) > _threshold && _filter_func(_check, _ignore_struct, _allow_struct))
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
        
        _i++;
    }
    
    return _result;
}
