hsp *= image_xscale;

if (scr_solid(x, y + vsp, true) || (grounded && vsp > 0.5))
    instance_destroy();
