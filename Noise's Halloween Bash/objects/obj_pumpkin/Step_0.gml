if (game_paused())
{
    image_index -= image_speed;
    
    if (alarm[0] != -1)
        alarm[0]++;
    
    exit;
}
