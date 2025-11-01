function __input_source_relinquish(arg0)
{
    static _global = __input_global();
    
    var _i = 0;
    
    repeat (2)
    {
        _global.__players[_i].__source_remove(arg0);
        _i++;
    }
}
