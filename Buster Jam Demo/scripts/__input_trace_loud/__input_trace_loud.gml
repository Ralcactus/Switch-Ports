function __input_trace_loud()
{
    static _global = __input_global();
    
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    show_debug_message("Input: LOUD " + _string);
    show_message(_string);
}
