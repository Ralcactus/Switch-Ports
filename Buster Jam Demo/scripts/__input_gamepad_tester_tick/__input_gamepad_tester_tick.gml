function __input_gamepad_tester_tick()
{
    static _global = __input_global();
    
    with (_global.__gamepad_tester_data)
    {
        var _gamepad;
        
        try
        {
            _gamepad = real(__target_gamepad);
        }
        catch (_error)
        {
            _gamepad = 0;
        }
        
        __gamepad_desc = "Description = \"" + string(input_gamepad_get_description(_gamepad)) + "\"";
        var _i = 0;
        
        repeat (array_length(__input_binding_array))
        {
            var _binding = __input_binding_array[_i];
            
            if (input_gamepad_is_axis(_gamepad, _binding))
                variable_struct_set(__input_values, array_get(__binding_name_array, _i), string_format(__input_gamepad_value_internal(_gamepad, _binding), 2, 2));
            else
                variable_struct_set(__input_values, array_get(__binding_name_array, _i), string_format(__input_gamepad_value_internal(_gamepad, _binding), 2, 0) + "  ");
            
            _i++;
        }
        
        _i = 0;
        
        repeat (array_length(__gml_binding_array))
        {
            var _binding = __gml_binding_array[_i];
            
            if (_binding == 32785 || _binding == 32786 || _binding == 32787 || _binding == 32788)
                variable_struct_set(__gml_values, array_get(__binding_name_array, _i), string_format(gamepad_axis_value(_gamepad, _binding), 2, 2));
            else
                variable_struct_set(__gml_values, array_get(__binding_name_array, _i), string_format(gamepad_button_check(_gamepad, _binding), 2, 0) + "  ");
            
            _i++;
        }
        
        var _string = "";
        _i = 0;
        
        repeat (12)
        {
            _string += ("axis " + string_format(_i, 4, 0) + " = " + string_format(gamepad_axis_value(_gamepad, _i), 2, 2) + "\n");
            _i++;
        }
        
        _string += ("axis 4106 = " + string_format(gamepad_axis_value(_gamepad, 4106), 2, 2) + " (XInput)\n");
        _string += ("axis 4107 = " + string_format(gamepad_axis_value(_gamepad, 4107), 2, 2) + " (XInput)\n");
        _i = 0;
        
        repeat (40)
        {
            if (gamepad_button_check(_gamepad, _i))
                _string += ("button " + string(_i) + "\n");
            
            _i++;
        }
        
        _i = 0;
        
        repeat (10)
        {
            if (gamepad_hat_value(_gamepad, _i))
                _string += ("hat " + string(_i) + "\n");
            
            _i++;
        }
        
        repeat (20)
            _string += "\n";
        
        __raw_input_string = _string;
    }
}
