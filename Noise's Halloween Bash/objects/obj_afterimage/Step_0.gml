if (game_paused())
{
    image_index -= image_speed;
    exit;
}

image_alpha -= 0.05;

if (image_alpha <= 0)
    instance_destroy();
