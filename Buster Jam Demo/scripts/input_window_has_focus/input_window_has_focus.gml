function input_window_has_focus()
{
    static __warned = false;
    static _global = __input_global();
    
    if (!__warned)
    {
        __warned = true;
        __input_trace("Warning! input_window_has_focus() has been deprecated. Please use input_game_has_focus()");
    }
    
    return _global.__window_focus && !os_is_paused();
}
