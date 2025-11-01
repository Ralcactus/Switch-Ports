function input_game_has_focus()
{
    static _global = __input_global();
    
    return _global.__game_input_allowed && !os_is_paused();
}
