function input_mouse_capture_get()
{
    static _global = __input_global();
    
    return 
    {
        __capture: _global.__mouse_capture,
        __sensitivity: _global.__mouse_capture_sensitivity,
        __blocked: _global.__mouse_capture_blocked
    };
}
