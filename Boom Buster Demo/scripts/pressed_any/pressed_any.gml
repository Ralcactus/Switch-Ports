function pressed_any(arg0 = 0)
{
    for (var i = 0; i < array_length(global.input[arg0].pressed); i++)
    {
        if (global.input[arg0].pressed[i])
            return true;
    }
    
    return false;
}
