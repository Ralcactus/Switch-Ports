ID = 0;
alarm[0] = 1;
render_layer = 0;

timer_func[0] = function()
{
    var _inst = instance_create_layer(x, y, "Instances", obj_enemy_crossing);
    _inst.movespd = movespd;
    _inst.z = z;
    _inst.render_layer = render_layer;
    timer[0] = irandom_range(77, 92);
};

crosswalk_stop = false;
