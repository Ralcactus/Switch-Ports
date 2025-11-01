function input_accessibility_global_cooldown_get()
{
    static _global = __input_global();
    
    return _global.__cooldown_state;
}
