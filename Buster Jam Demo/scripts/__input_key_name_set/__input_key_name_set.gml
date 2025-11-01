function __input_key_name_set(arg0, arg1)
{
    static _global = __input_global();
    
    variable_struct_set(_global.__key_name_dict, string(arg0), string(arg1));
}
