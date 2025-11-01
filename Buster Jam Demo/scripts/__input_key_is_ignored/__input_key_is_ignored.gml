function __input_key_is_ignored(arg0)
{
    static _global = __input_global();
    
    return variable_struct_exists(_global.__ignore_key_dict, arg0);
}
