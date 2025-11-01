function input_source_is_available(arg0)
{
    static _global = __input_global();
    
    var _p = 0;
    
    repeat (2)
    {
        if (_global.__players[_p].__source_contains(arg0))
            return false;
        
        _p++;
    }
    
    return true;
}
