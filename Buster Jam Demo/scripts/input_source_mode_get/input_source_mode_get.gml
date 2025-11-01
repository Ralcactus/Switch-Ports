function input_source_mode_get()
{
    static _global = __input_global();
    
    return _global.__source_mode;
}
