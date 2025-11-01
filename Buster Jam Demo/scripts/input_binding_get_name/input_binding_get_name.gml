function input_binding_get_name(arg0)
{
    if (!input_value_is_binding(arg0))
        return "not a binding";
    
    return arg0.__label;
}
