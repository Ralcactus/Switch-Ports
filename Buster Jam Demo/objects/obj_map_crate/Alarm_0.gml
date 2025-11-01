zstart = z;
y -= z;
var _inst = instance_create_layer(x, y, "Collision", obj_solid);
_inst.image_xscale = width / 96;
_inst.image_yscale = length / 96;
_inst.height = height;
_inst.z = z;
_inst.reset_y = false;
_inst.y = bbox_bottom - (_inst.image_yscale * 96);
my_solid = _inst;
var _key = string("{0} x:{1} y: {2} z: {3}", room_get_name(room), xstart, ystart, zstart);

if (ds_map_exists(global.map_got, _key))
{
    instance_destroy();
    exit;
}
