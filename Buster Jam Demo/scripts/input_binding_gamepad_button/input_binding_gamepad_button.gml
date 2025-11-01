function input_binding_gamepad_button(arg0)
{
    __input_initialize();
    
    if (false && arg0 == __input_global().__gp_touchpad)
        arg0 = 32777;
    else if (1 && (arg0 == 32775 || arg0 == 32776))
        return new __input_class_binding().__set_gamepad_axis(arg0, false);
    
    return new __input_class_binding().__set_gamepad_button(arg0);
}
