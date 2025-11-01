function input_trigger_effect_get_state(arg0, arg1 = 0)
{
    static _global = __input_global();
    
    if (arg1 < 0)
    {
        __input_error("Invalid player index provided (", arg1, ")");
        return undefined;
    }
    
    if (arg1 >= 2)
    {
        __input_error("Player index too large (", arg1, " must be less than ", 2, ")\nIncrease INPUT_MAX_PLAYERS to support more players");
        return undefined;
    }
    
    if (!(arg0 == 32775 || arg0 == 32776))
        __input_error("Value ", arg0, " not a gamepad trigger");
    
    var _player = _global.__players[arg1];
    var _gamepad = input_player_get_gamepad(arg1);
    
    if (_gamepad < 0)
        return undefined;
    
    if (_player.__trigger_effect_paused)
        return (-1 << 0);
    
    var _effect = undefined;
    
    if (arg0 == 32775)
    {
        if (_player.__trigger_intercepted_left)
            return (-1 << 0);
        
        _effect = _player.__trigger_effect_left;
    }
    else if (arg0 == 32776)
    {
        if (_player.__trigger_intercepted_right)
            return (-1 << 0);
        
        _effect = _player.__trigger_effect_right;
    }
    else
    {
        __input_error("Value ", arg0, " not a gamepad trigger");
        return false;
    }
    
    if (!is_struct(_effect))
        return (0 << 0);
    
    return _effect.__steam_get_state(_gamepad, arg0);
}
