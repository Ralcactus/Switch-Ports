if (game_paused())
{
    image_index -= image_speed;
    exit;
}

x += (dcos(flyangle) * 9);
z -= (dsin(flyangle) * 9);
lifetimer--;

if (is_outofview3d(x, y, z, max(sprite_width, sprite_height)) || lifetimer <= 0)
    instance_destroy();
