function input_accessibility_verb_toggle_get(arg0)
{
    static _global = __input_global();
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
        __input_error("\"", arg0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, arg0))
        __input_error("Verb \"", arg0, "\" not recognised");
    
    return variable_struct_exists(_global.__toggle_momentary_dict, arg0);
}
