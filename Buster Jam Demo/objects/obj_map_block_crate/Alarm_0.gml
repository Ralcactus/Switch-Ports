event_inherited();

if (coins > 1)
    anim_sprite = spr_map_block_crate_question;

var _key = string("{0} x:{1} y: {2} z: {3}", room_get_name(room), xstart, ystart, zstart);

if (ds_map_exists(global.map_got, _key))
{
    instance_destroy();
    exit;
}
