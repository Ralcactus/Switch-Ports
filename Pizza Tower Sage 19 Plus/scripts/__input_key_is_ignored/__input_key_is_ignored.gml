function __input_key_is_ignored(argument0)
{
    static _global = __input_global();
    
    return variable_struct_exists(_global.__ignore_key_dict, argument0);
}
