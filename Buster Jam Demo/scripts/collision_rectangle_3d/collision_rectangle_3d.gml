function collision_rectangle_3d(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    var _list = ds_list_create();
    collision_rectangle_list(arg0, arg1, arg2, arg3, arg6, arg7, arg8, _list, false);
    
    for (var i = 0; i < ds_list_size(_list); i++)
    {
        var _inst = ds_list_find_value(_list, i);
        var inst_top = _inst.z;
        var inst_bottom = _inst.z - _inst.height;
        var my_top = arg4;
        var my_bottom = arg4 - arg5;
        var z_overlap = my_bottom <= inst_top || my_top >= inst_bottom;
        
        if (z_overlap)
        {
            ds_list_destroy(_list);
            return _inst;
        }
    }
    
    ds_list_destroy(_list);
    return false;
}
