if (go)
{
    if (obj_map_player.grounded)
    {
        instance_create_layer(0, 0, layer, cutscene);
        instance_destroy();
    }
    
    exit;
}

var _touch = false;

with (obj_map_player)
    _touch = instance_place_3d(x, y, z, other);

if (_touch)
{
    obj_map_player.deac = true;
    go = true;
}
