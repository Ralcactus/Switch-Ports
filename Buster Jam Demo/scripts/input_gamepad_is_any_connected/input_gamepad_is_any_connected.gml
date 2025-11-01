function input_gamepad_is_any_connected()
{
    static _global = __input_global();
    
    var _i = 0;
    
    repeat (array_length(_global.__gamepads))
    {
        if (input_gamepad_is_connected(_i))
            return true;
        
        _i++;
    }
    
    return false;
}
