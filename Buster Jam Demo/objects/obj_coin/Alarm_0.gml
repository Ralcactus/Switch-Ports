if (already_got)
    exit;

y -= z;
z -= 48;
zstart = z;
var _key = string("{0} x:{1} y: {2} z: {3}", room_get_name(room), xstart, ystart, zstart);

if (ds_map_exists(global.map_got, _key))
{
    instance_destroy();
    exit;
}

scr_create_shadow();
scr_shadow_z(0);
my_shadow.scale_out = false;
my_shadow.scale_size = 0.7;
