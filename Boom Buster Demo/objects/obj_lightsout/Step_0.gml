if (exit_freeze() && !instance_exists(obj_player_death))
    exit;

timer_logic(0);

if (flick_timer < 16)
{
    flick_timer++;
    
    if (flick_timer == 4 || flick_timer == 12)
    {
        if (out)
            flicker = true;
        else
            flicker = false;
    }
    
    if (flick_timer == 8 || flick_timer == 16)
    {
        if (out)
            flicker = false;
        else
            flicker = true;
    }
    
    if (out && flick_timer == 16)
        instance_destroy();
}

if (instance_exists(obj_player_death))
    target = obj_player_death;
else if (instance_exists(obj_player))
    target = obj_player;
