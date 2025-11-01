function __input_steam_handles_changed()
{
    static _global = __input_global();
    
    var _steam_handles = steam_input_get_connected_controllers();
    
    if (!is_array(_steam_handles))
        return false;
    
    if (array_length(_steam_handles) != array_length(_global.__steam_handles))
        return true;
    
    var _i = 0;
    
    repeat (array_length(_steam_handles))
    {
        if (_steam_handles[_i] != _global.__steam_handles[_i])
            return true;
        
        _i++;
    }
    
    _i = 0;
    
    repeat (array_length(_global.__gamepads))
    {
        var _gamepad = _global.__gamepads[_i];
        
        if (is_struct(_gamepad) && _gamepad.__steam_handle != undefined && _gamepad.__steam_handle_index != steam_input_get_gamepad_index_for_controller(_gamepad.__steam_handle))
            return true;
        
        _i++;
    }
    
    return false;
}
