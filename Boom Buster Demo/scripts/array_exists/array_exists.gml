function array_exists(arg0, arg1)
{
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (arg0[i] == arg1)
            return true;
    }
    
    return false;
}
