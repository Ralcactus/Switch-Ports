function input_gamepad_value(argument0, argument1)
{
    static _global = __input_global();
    
    if (!_global.__game_input_allowed || !_global.__gamepad_allowed)
        return 0;
    
    return __input_gamepad_value_internal(argument0, argument1);
}
