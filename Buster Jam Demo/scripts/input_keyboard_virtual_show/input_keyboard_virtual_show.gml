function input_keyboard_virtual_show(arg0 = 0)
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
        switch (arg0)
        {
            case 3:
                arg0 = 2;
                break;
            
            case 4:
                arg0 = 3;
                break;
            
            default:
                arg0 = 0;
                break;
        }
        
        steam_show_floating_gamepad_text_input(arg0, 0, 0, 0, 0);
    }
    else if (!keyboard_virtual_status() || false)
    {
    }
}
