function __input_key_get_char(arg0)
{
    var _char = string_upper(keyboard_lastchar);
    
    if ((ord(_char) >= 65 && ord(_char) <= 90) || arg0 == 192)
        return _char;
    
    return undefined;
}
