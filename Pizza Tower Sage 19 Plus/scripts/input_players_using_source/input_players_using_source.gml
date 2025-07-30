function input_players_using_source(argument0, argument1 = false)
{
    static _global = __input_global();
    static _result = [];
    
    if (!argument1)
        array_resize(_result, 0);
    
    if (!is_array(argument0))
        argument0 = [argument0];
    
    var _source_index = 0;
    var _source = undefined;
    var _player_index = 0;
    
    repeat (1)
    {
        if (_global.__players[_player_index].__connected)
        {
            _source_index = 0;
            
            repeat (array_length(argument0))
            {
                _source = argument0[_source_index];
                
                if (_source != __input_global().__source_gamepad)
                {
                    if (_global.__use_is_instanceof)
                    {
                        if (!is_instanceof(_source, __input_class_source))
                        {
                            if (_source == __input_global().__source_gamepad)
                                __input_error("Cannot use INPUT_GAMEPAD for a source\nPlease use a specific gamepad e.g. INPUT_GAMEPAD[1]");
                            else
                                __input_error("Invalid source provided (", _source, ")");
                        }
                    }
                    else if (instanceof(_source) != "__input_class_source")
                    {
                        if (_source == __input_global().__source_gamepad)
                            __input_error("Cannot use INPUT_GAMEPAD for a source\nPlease use a specific gamepad e.g. INPUT_GAMEPAD[1]");
                        else
                            __input_error("Invalid source provided (", _source, ")");
                    }
                }
                
                if (_global.__players[_player_index].__source_contains(_source))
                {
                    if (argument1)
                        return _player_index;
                    
                    array_push(_result, _player_index);
                    break;
                }
                
                _source_index++;
            }
        }
        
        _player_index++;
    }
    
    return argument1 ? undefined : _result;
}
