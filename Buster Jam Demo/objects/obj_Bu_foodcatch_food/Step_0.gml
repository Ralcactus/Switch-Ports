y += (8 * global.delta_game_factor);

if (place_meeting_micro(x, y, obj_Bu_foodcatch_buster))
{
    instance_destroy();
    
    with (instance_find_micro(obj_Bu_foodcatch_buster))
        event_user(0);
}
