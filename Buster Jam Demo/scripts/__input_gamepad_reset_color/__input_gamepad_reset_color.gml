function __input_gamepad_reset_color(arg0)
{
    static _global = __input_global();
    
    if (arg0 < 0)
        exit;
    
    with (_global.__gamepads[arg0])
        __color_set(undefined);
}
