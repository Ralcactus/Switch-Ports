hsp = image_xscale * movespeed;

if (place_meeting_solid(x + sign(hsp), y))
    instance_destroy();

if (vsp >= 2 && place_meeting_collision(x, y + sign(vsp)))
    vsp /= -2;
