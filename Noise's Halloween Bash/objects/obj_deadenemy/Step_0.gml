if (game_paused())
{
    image_index -= image_speed;
    exit;
}

if (vsp < 20)
    vsp += grav;

x += hsp;
y += vsp;
depth += zsp;

if (spinout)
    image_angle = wrap(image_angle + (15 * image_xscale), 0, 360);
