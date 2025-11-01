function __input_steam_type_set(arg0, arg1, arg2)
{
    static _global = __input_global();
    
    variable_struct_set(_global.__steam_type_to_raw, string(arg0), arg1);
    variable_struct_set(_global.__steam_type_to_name, string(arg0), arg2);
}
