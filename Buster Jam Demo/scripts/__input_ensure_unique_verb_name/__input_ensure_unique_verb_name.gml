function __input_ensure_unique_verb_name(arg0)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__basic_verb_dict, arg0))
    {
        __input_error("A basic verb named \"", arg0, "\" already exists");
        exit;
    }
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
    {
        __input_error("A chord named \"", arg0, "\" already exists");
        exit;
    }
}
