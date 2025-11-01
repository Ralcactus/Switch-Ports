function get_key(arg0, arg1 = true, arg2 = false)
{
    if (arg0 == 37)
    {
        if (arg1)
            return "←";
        else
            return "LEFT";
    }
    
    if (arg0 == 39)
    {
        if (arg1)
            return "→";
        else
            return "RIGHT";
    }
    
    if (arg0 == 38)
    {
        if (arg1)
            return "↑";
        else
            return "UP";
    }
    
    if (arg0 == 40)
    {
        if (arg1)
            return "↓";
        else
            return "DOWN";
    }
    
    if (arg0 == 13)
        return "ENTER";
    
    if (arg0 == 27)
        return "ESC";
    
    if (arg0 == 32)
        return "SPACE";
    
    if (arg0 == 16)
        return "SHIFT";
    
    if (arg0 == 17)
        return "CTRL";
    
    if (arg0 == 18)
        return "ALT";
    
    if (arg0 == 8)
        return "BACKSPACE";
    
    if (arg0 == 9)
        return "TAB";
    
    if (arg0 == 107)
        return "ADD";
    
    if (arg0 == 109)
        return "SUBTRACT";
    
    return chr(arg0);
}
