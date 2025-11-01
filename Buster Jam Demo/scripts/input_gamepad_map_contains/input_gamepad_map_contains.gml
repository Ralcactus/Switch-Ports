function input_gamepad_map_contains(arg0, arg1)
{
    static _global = __input_global();
    
    if (arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return false;
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return false;
    
    if (!is_array(arg1))
        arg1 = [arg1];
    
    var _i = 0;
    
    repeat (array_length(arg1))
    {
        if (input_gamepad_constant_get_name(arg1[_i]) == "unknown" || variable_struct_get(_gamepad.__mapping_gm_to_raw, array_get(arg1, _i)) == undefined)
            return false;
        
        _i++;
    }
    
    return true;
}
