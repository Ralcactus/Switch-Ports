function input_clear_momentary(arg0)
{
    static _global = __input_global();
    
    _global.__cleared = arg0;
}
