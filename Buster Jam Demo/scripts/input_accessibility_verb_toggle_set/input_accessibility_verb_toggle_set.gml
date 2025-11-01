function input_accessibility_verb_toggle_set(arg0, arg1)
{
    static _global = __input_global();
    
    if (is_array(arg0))
    {
        var _i = 0;
        
        repeat (array_length(arg0))
        {
            input_accessibility_verb_toggle_set(arg0[_i], arg1);
            _i++;
        }
        
        exit;
    }
    
    if (variable_struct_exists(_global.__chord_verb_dict, arg0))
        __input_error("\"", arg0, "\" is a chord verb. Verbs passed to this function must be basic verb");
    
    if (!variable_struct_exists(_global.__basic_verb_dict, arg0))
        __input_error("Verb \"", arg0, "\" not recognised");
    
    if (arg1)
        variable_struct_set(_global.__toggle_momentary_dict, arg0, true);
    else
        variable_struct_remove(_global.__toggle_momentary_dict, arg0);
}
