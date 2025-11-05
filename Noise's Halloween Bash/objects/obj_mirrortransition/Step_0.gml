if (game_paused())
{
    if (alarm[0] != -1)
        alarm[0]++;
    
    exit;
}

alpha = approach(alpha, !roomchanged, 0.1);

if (alpha >= 1 && !roomchanged)
{
    if (alarm[0] == -1)
        alarm[0] = 60;
}

if (alpha <= 0 && roomchanged)
{
    set_player_checkpoint();
    
    with (instance_create_depth(0, 0, 0, obj_dointro))
        event_perform(ev_other, ev_room_start);
    
    instance_destroy();
}
