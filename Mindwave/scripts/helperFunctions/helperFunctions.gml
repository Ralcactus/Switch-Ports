function string_to_wrapped(arg0, arg1, arg2 = "\n", arg3 = true)
{
    var pos_space = -1;
    var pos_current = 1;
    var text_current = argument0;
    
    if (is_real(argument2))
        argument2 = "\n";
    
    var text_output = "";
    
    while (string_length(text_current) >= pos_current)
    {
        if (string_width(string_copy(text_current, 1, pos_current)) > argument1)
        {
            if (pos_space != -1)
            {
                text_output += (string_copy(text_current, 1, pos_space) + string(argument2));
                text_current = string_copy(text_current, pos_space + 1, string_length(text_current) - pos_space);
                pos_current = 1;
                pos_space = -1;
            }
            else if (argument3)
            {
                text_output += (string_copy(text_current, 1, pos_current - 1) + string(argument2));
                text_current = string_copy(text_current, pos_current, string_length(text_current) - (pos_current - 1));
                pos_current = 1;
                pos_space = -1;
            }
        }
        
        pos_current += 1;
        
        if (string_char_at(text_current, pos_current) == " ")
            pos_space = pos_current;
    }
    
    if (string_length(text_current) > 0)
        text_output += text_current;
    
    return text_output;
}

function angle_lerp(arg0, arg1, arg2)
{
    return arg0 - (angle_difference(arg0, arg1) * arg2);
}
