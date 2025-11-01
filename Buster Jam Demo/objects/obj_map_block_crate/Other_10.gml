var _inst = instance_create_layer(x, y, "FX", obj_coin);
_inst.z = z - 128 - 32;
_inst.visible = true;
_inst.ignore_render = true;

with (_inst)
{
    zstart = z;
    event_user(0);
    already_got = true;
}

coins--;
var _key = string("{0} x:{1} y: {2} z: {3}", room_get_name(room), xstart, ystart, zstart);
ds_map_add(global.map_got, _key, 1);

if (coins == 0)
{
    event_shards();
    instance_destroy();
}
