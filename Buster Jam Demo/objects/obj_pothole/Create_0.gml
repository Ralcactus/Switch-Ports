z = 0;
height = 1;
render_layer = 0;
touching = false;
timer[0] = -1;

timer_func[0] = function()
{
    var _inst;
    
    with (obj_map_pothole)
    {
        if (ID == other.ID && id != other.id)
            _inst = id;
    }
    
    var _dir = 270;
    var _x = _inst.x + 64;
    var _y = _inst.y + 64;
    var _z = _inst.z;
    var _render = _inst.render_layer;
    _inst = instance_create_layer(_x, _y, layer, obj_map_player);
    _inst.z = _z;
    _inst.dir = _dir;
    _inst.render_layer = _render;
    
    if (global.follower)
    {
        _inst = instance_create_layer(_x, _y - 1, layer, obj_map_player_follower);
        _inst.z = _z;
        _inst.dir = _dir;
        _inst.render_layer = _render;
    }
};

alarm[0] = 1;
