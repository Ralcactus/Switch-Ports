function input_keyboard_check(arg0)
{
    static _global = __input_global();
    
    if (!_global.__keyboard_allowed)
        return false;
    
    return keyboard_check(arg0);
}
