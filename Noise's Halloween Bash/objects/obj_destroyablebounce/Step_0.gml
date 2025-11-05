if (game_paused())
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    exit;
}

squish = min(squish + 0.05, 1);
