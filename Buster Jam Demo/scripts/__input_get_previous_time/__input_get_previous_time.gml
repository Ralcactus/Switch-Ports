function __input_get_previous_time()
{
    static _global = __input_global();
    
    return _global.__frame - 1;
}
