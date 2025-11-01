function solid_meeting(arg0, arg1, arg2)
{
    if (place_meeting(arg0, arg1, arg2))
    {
        var _list = ds_list_create();
        instance_place_list(arg0, arg1, arg2, _list, true);
        
        for (var i = 0; i < ds_list_size(_list); i++)
        {
            if (!value_in_list(list_ignore, ds_list_find_value(_list, i)))
            {
                ds_list_destroy(_list);
                return true;
            }
        }
        
        ds_list_destroy(_list);
    }
    
    return false;
}
