function input_player_connected_count(argument0 = true)
{
    static _global = __input_global();
    
    var _count = 0;
    var _p = 0;
    
    repeat (1)
    {
        with (_global.__players[_p])
        {
            if (__connected && (argument0 || !__ghost))
                _count++;
        }
        
        _p++;
    }
    
    return _count;
}
