function __input_get_time()
{
    static _global = __input_global();
    
    return _global.__frame;
}
