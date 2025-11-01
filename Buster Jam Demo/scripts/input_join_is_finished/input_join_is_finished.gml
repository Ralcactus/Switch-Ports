function input_join_is_finished()
{
    static _global = __input_global();
    
    var _connected = input_player_connected_count();
    return _connected >= _global.__join_player_min && _connected <= _global.__join_player_max;
}
