if (game_paused() && shouldpause)
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    exit;
}

alpha = approach(alpha, fadein, 0.05);

if (!fadein && alpha <= 0)
    instance_destroy();
