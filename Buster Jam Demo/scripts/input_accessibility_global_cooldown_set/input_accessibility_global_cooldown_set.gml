function input_accessibility_global_cooldown_set(arg0)
{
    static _global = __input_global();
    
    _global.__cooldown_state = arg0;
}
