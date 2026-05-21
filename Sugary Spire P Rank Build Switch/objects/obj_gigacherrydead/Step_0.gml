scr_collision();
hsp = image_xscale * movespeed;
instance_destroy(instance_place(x + hsp, y, obj_baddie));
instance_destroy(instance_place(x + hsp, y, obj_destructibles));

if (place_meeting_collision(x + image_xscale, y, Exclude.SLOPES) && (!groundedSlope || place_meeting_collision(x + sign(hsp), y - 16, Exclude.SLOPES)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    instance_destroy();
