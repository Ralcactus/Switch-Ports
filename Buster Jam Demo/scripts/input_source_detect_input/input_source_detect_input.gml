function input_source_detect_input(arg0, arg1 = true)
{
    static _global = __input_global();
    
    if (!_global.__game_input_allowed)
        return false;
    
    if (arg0 == -3)
        return input_source_detect_input([__input_global().__source_keyboard, __input_global().__source_mouse, __input_global().__source_touch, __input_global().__source_gamepad], arg1);
    
    if (is_array(arg0))
    {
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            if (input_source_detect_input(arg0[_i], arg1))
                return true;
            
            _i++;
        }
        
        return false;
    }
    
    switch (arg0.__source)
    {
        case (0 << 0):
            if (_global.__keyboard_allowed && _global.__any_keyboard_binding_defined && (!arg1 || input_source_is_available(arg0)) && keyboard_check_pressed(vk_anykey) && !__input_key_is_ignored(__input_keyboard_key()))
                return true;
            
            if (_global.__mouse_allowed && (!arg1 || input_source_is_available(arg0)) && (input_mouse_check(-1) || mouse_wheel_up() || mouse_wheel_down()))
                return true;
            
            break;
        
        case (1 << 0):
            if (_global.__mouse_allowed && (!arg1 || input_source_is_available(arg0)) && (input_mouse_check(-1) || mouse_wheel_up() || mouse_wheel_down()))
                return true;
            
            break;
        
        case (3 << 0):
            if (_global.__touch_allowed && (!arg1 || input_source_is_available(arg0)) && device_mouse_check_button(_global.__pointer_index, mb_left))
                return true;
            
            break;
        
        case (2 << 0):
            if (_global.__gamepad_allowed && _global.__any_gamepad_binding_defined)
            {
                var _gamepad = arg0.__gamepad;
                
                if (input_gamepad_is_connected(_gamepad) && (!arg1 || input_source_is_available(arg0)) && _global.__gamepads[_gamepad].__get_any_pressed())
                    return true;
            }
            
            break;
    }
    
    return false;
}
