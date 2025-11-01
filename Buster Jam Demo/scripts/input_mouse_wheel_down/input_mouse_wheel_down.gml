function input_mouse_wheel_down()
{
    static _global = __input_global();
    
    if (!_global.__mouse_allowed || !_global.__game_input_allowed || _global.__cleared)
        return false;
    
    return mouse_wheel_down();
}
