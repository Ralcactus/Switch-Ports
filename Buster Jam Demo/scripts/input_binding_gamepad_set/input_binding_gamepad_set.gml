function input_binding_gamepad_set(arg0, arg1)
{
    static _global = __input_global();
    
    if (!input_value_is_binding(arg0))
    {
        __input_error("Parameter is not a binding (typeof=", typeof(arg0), ")");
        exit;
    }
    
    arg0.__gamepad_set(arg1);
}
