hsp = sign(image_xscale) * movespeed;

if (dashpadBuffer > 0)
    dashpadBuffer = max(dashpadBuffer - 1, 0);

var _player = instance_nearest(x, y, obj_parent_player);

if (grounded && !place_meeting(x, y + 1, obj_minecartRail) && !place_meeting(x, y + 1, obj_minecartRail_Slope))
    movespeed = approach(movespeed, 0, 0.45);

if (movespeed <= 0 && sprite_index != spr_minecartend)
{
    image_index = 0;
    sprite_index = spr_minecartend;
}
