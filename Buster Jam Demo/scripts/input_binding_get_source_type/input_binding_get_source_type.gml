function input_binding_get_source_type(arg0)
{
    if (!input_value_is_binding(arg0))
        return undefined;
    
    return arg0.__source_type_get(arg0);
}
