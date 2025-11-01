function input_gamepad_get_map(arg0)
{
    static _global = __input_global();
    
    if (arg0 == undefined || arg0 < 0 || arg0 >= array_length(_global.__gamepads))
        return [];
    
    var _gamepad = _global.__gamepads[arg0];
    
    if (!is_struct(_gamepad))
        return [];
    
    with (_gamepad)
    {
        var _output = array_create(array_length(__mapping_array), undefined);
        var _i = 0;
        
        repeat (array_length(__mapping_array))
        {
            _output[_i] = __mapping_array[_i].__gm;
            _i++;
        }
        
        return _output;
    }
}
