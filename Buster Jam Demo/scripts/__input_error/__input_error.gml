function __input_error()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    show_error("Input 8.1.2:\n" + _string + "\n ", false);
}
