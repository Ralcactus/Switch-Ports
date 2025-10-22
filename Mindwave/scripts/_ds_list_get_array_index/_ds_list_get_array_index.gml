function _ds_list_get_array_index(arg0, arg1)
{
    var list = arg0;
    var array = arg1;
    var num = ds_list_size(list);
    
    for (var i = 0; i < num; i++)
    {
        if (array_equals(array, ds_list_find_value(list, i)))
            return i;
    }
    
    return -1;
}
