function input_players_get_status()
{
    static _global = __input_global();
    
    return _global.__players_status;
}
