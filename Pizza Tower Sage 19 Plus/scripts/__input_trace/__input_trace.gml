function __input_trace()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += _string(argument[_i]);
        _i++;
    }
    
    //show_debug_message("Input: " + _string);
}
