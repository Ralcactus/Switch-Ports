if (create_multiple)
{
    for (var i = 0; i < 5; i++)
    {
        var _inst = instance_create_layer(x + (i * (hspd * timer_length)), y, layer, obj_jello);
        _inst.hspd = hspd;
        _inst.die_outside_room = 1;
    }
}
