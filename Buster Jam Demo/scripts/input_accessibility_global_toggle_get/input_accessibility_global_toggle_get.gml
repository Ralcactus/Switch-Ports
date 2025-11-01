function input_accessibility_global_toggle_get()
{
    static _global = __input_global();
    
    return _global.__toggle_momentary_state;
}
