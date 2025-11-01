function input_value_is_binding(arg0)
{
    static _global = __input_global();
    
    if (_global.__use_is_instanceof)
        return is_struct(arg0) && is_instanceof(arg0, __input_class_binding);
    else
        return is_struct(arg0) && instanceof(arg0) == "__input_class_binding";
}
