var _y = y;

for (var i = 0; i < 3; i++)
{
    var _inst = instance_create_layer(x, _y, "Instances", obj_enemy_crossing);
    _inst.movespd = movespd;
    _inst.z = z;
    _inst.render_layer = render_layer;
    _y += (irandom_range(77, 92) * movespd);
}

timer[0] = irandom_range(77, 92);
