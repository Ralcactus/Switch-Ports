hsp = movespeed * image_xscale;

if (place_meeting_collision(x + image_xscale, y))
    image_xscale *= -1;

if (grounded)
    instance_destroy();
