function scr_spawn_player()
{
    y -= z;
    var _inst = instance_create_layer(x, y, layer, obj_map_player);
    _inst.z = z;
    _inst.facing = image_xscale;
    _inst.lock_xAxis = lock_xAxis;
    _inst.lock_yAxis = lock_yAxis;
    
    if (image_index == 0)
    {
        _inst.xAxis_open = 1;
    }
    else if (image_index == 1)
    {
        _inst.xAxis_open = -1;
        _inst.facing = -1;
    }
    else if (image_index == 2)
    {
        _inst.yAxis_open = -1;
    }
    else
    {
        _inst.yAxis_open = 1;
    }
    
    if (global.follower)
    {
        _inst = instance_create_layer(x, y, layer, obj_map_player_follower);
        _inst.z = z;
        _inst.record_max = obj_map_player.record_max;
        _inst.facing = obj_map_player.facing;
    }
}
