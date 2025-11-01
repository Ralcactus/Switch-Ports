if (spawn_extras)
{
    for (var i = 0; i < spawn_extras; i++)
    {
        var _inst = instance_create_layer(x, y, layer, object_index);
        _inst.mypath = pth_platform_city_s2a3;
        _inst.path_pos = (i + 1) / (spawn_extras + 1);
        _inst.facing = facing;
    }
}

if (mypath != -4)
{
    x = path_get_x(mypath, path_pos);
    y = path_get_y(mypath, path_pos);
    path_pos_start = path_pos;
}

if (land_id != -4)
    obj_controller.land_id_obj[land_id] = id;

ready = true;
