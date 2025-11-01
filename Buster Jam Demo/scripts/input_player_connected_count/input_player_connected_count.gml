function input_player_connected_count(arg0 = true)
{
    static _global = __input_global();
    
    var _count = 0;
    var _p = 0;
    
    repeat (2)
    {
        with (_global.__players[_p])
        {
            if (__connected && (arg0 || !__ghost))
                _count++;
        }
        
        _p++;
    }
    
    return _count;
}
