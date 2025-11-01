function input_ignore_key_add(arg0)
{
    static _global = __input_global();
    
    if (is_string(arg0))
        arg0 = ord(string_upper(arg0));
    
    if (arg0 == 1)
        __input_error("Cannot ignore vk_anykey (=", 1, ")");
    
    if (!variable_struct_exists(_global.__ignore_key_dict, arg0))
        variable_struct_set(_global.__ignore_key_dict, arg0, true);
    else
        __input_trace("Could not ignore keycode ", arg0, ", it is already ignored");
}
