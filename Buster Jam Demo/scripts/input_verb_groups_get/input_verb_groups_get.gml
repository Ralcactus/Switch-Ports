function input_verb_groups_get()
{
    static _global = __input_global();
    
    return variable_struct_get_names(_global.__group_to_verbs_dict);
}
