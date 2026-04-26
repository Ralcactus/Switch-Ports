movespeed = min(movespeed, movespeedmax);
movespeed += 0.0125;
hsp = image_xscale * movespeed;
instance_destroy(instance_place(x + hsp, y, obj_parent_baddie));

with (instance_place(x + hsp, y, obj_minesWall))
{
    instance_destroy(other);
    instance_destroy();
}

instance_destroy(instance_place(x + hsp, y, obj_destructibles));

if (place_meeting_collision(x + image_xscale, y, UnknownEnum.Value_1) && (!groundedSlope || place_meeting_collision(x + sign(hsp), y - 16, UnknownEnum.Value_1)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    instance_destroy();
