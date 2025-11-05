if (game_paused())
{
    image_index -= image_speed;
    exit;
}

x += hsp;
y += vsp;
depth += zsp;
vsp += grav;

if (is_outofview3d(x, y, depth, max(sprite_width, sprite_height)))
    instance_destroy();
