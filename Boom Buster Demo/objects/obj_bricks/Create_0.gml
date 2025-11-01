timer[0] = -1;

timer_func[0] = function()
{
    mask_index = spr_solid;
    image_alpha = 1;
    var _list = ds_list_create();
    instance_place_list(x, y, par_physics, _list, true);
    
    for (var i = 0; i < ds_list_size(_list); i++)
    {
        with (ds_list_find_value(_list, i))
            ds_list_add(list_ignore, other.id);
    }
    
    ds_list_destroy(_list);
};
