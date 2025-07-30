function input_keyboard_virtual_show(argument0 = 0)
{
    static __warned = false;
    static _global = __input_global();
    
    if (!__warned)
    {
        if (__input_global().__keyboard_type != "virtual")
            __input_trace("Warning! Onscreen keyboard is not suitable for use on the current platform");
        
        if (__input_global().__keyboard_type == "async")
            __input_trace("Consider using async dialog for modal text input instead");
        
        __warned = true;
    }
    
    if (_global.__using_steamworks)
    {
        switch (argument0)
        {
            case 3:
                argument0 = steam_floating_gamepad_text_input_mode_email;
                break;
            
            case 4:
                argument0 = steam_floating_gamepad_text_input_mode_numeric;
                break;
            
            default:
                argument0 = steam_floating_gamepad_text_input_mode_single_line;
                break;
        }
        
        steam_show_floating_gamepad_text_input(argument0, 0, 0, 0, 0);
    }
    else if (!keyboard_virtual_status() || os_type == os_android)
    {
        if (!(os_type == os_windows))
            keyboard_virtual_show(argument0, 0, 2, false);
    }
}
