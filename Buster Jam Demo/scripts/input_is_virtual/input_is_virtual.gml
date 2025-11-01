function input_is_virtual(arg0)
{
    if (!is_struct(arg0))
        return false;
    
    return !arg0.__destroyed;
}
