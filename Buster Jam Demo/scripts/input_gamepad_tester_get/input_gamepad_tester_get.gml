function input_gamepad_tester_get()
{
    static _global = __input_global();
    
    return _global.__allow_gamepad_tester && _global.__gamepad_tester_data.__enabled;
}
