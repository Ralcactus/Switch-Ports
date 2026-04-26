y += vsp;
vsp = 6;

if (place_meeting_collision(x + image_xscale, y) && (!groundedSlope || place_meeting_collision(x + sign(hsp), y - 16)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    instance_destroy();
