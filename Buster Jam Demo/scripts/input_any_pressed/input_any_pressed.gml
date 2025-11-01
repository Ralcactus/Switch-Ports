function input_any_pressed()
{
    static _global = __input_global();
    
    if (_global.__cleared)
        return false;
    
    return input_source_detect_input(-3, false);
}
