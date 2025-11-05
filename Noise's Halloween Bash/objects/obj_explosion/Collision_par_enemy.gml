if (game_paused())
    exit;

if (image_index < 9)
    instance_destroy(other.id);
