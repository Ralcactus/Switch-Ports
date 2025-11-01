function __input_key_get_name(arg0)
{
    static _global = __input_global();
    
    if (is_string(arg0))
        arg0 = ord(string_upper(arg0));
    
    var _lookup_name = variable_struct_get(_global.__key_name_dict, arg0);
    
    if (_lookup_name == undefined)
        return chr(arg0);
    else
        return _lookup_name;
}
