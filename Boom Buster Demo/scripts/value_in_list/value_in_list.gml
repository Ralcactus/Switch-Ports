function value_in_list(arg0, arg1)
{
    if (ds_list_find_index(arg0, arg1) == -1)
        return false;
    
    return true;
}
