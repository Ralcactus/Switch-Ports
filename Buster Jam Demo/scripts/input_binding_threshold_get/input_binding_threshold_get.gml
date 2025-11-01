function input_binding_threshold_get(arg0)
{
    static _global = __input_global();
    
    if (!input_value_is_binding(arg0))
    {
        __input_error("Parameter is not a binding (typeof=", typeof(arg0), ")");
        exit;
    }
    
    return arg0.__threshold_get();
}
