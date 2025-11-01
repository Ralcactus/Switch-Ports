function input_hotswap_params_set(arg0)
{
    static _global = __input_global();
    
    if (!is_method(arg0) && !(is_numeric(arg0) && script_exists(arg0)) && !is_undefined(arg0))
        __input_error("Hotswap callback must be a function, a script, or <undefined>");
    
    _global.__hotswap_callback = arg0;
}
