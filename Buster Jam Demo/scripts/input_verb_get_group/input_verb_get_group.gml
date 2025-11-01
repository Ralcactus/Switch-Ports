function input_verb_get_group(arg0)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
        __input_error("\"", arg0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, arg0))
        __input_error("Verb \"", arg0, "\" not recognised");
    
    return variable_struct_get(_global.__verb_to_group_dict, arg0);
}
