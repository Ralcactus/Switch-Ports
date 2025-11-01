anim_logic();
timer_logic(0);
timer_logic(1);

if (controller.timer[0] <= (60 * time_bpm_to_seconds(140) * 0.5) && !cannon_set_timer && anim_sprite == spr_micro_pistol_demon)
{
    timer[0] = 24;
    cannon_set_timer = true;
    
    with (controller)
    {
        event_round_time(6);
        timer_alpha_override = 0;
    }
    
    with (obj_micro_pistol)
    {
        if (ID == other.ID)
            deac = true;
    }
}

if (cannon_in)
{
    anim_index = approach(anim_index, 0, 0.7);
    cannon_xoff = approach(cannon_xoff, 0, 0.015);
    
    if (cannon_xoff == 0 && !cannon_shot_timer_set)
    {
        timer[1] = 15;
        cannon_shot_timer_set = true;
    }
}

if (laser_go)
{
    laser_ind += ((sprite_get_speed(spr_micro_pistol_demon_laser) / 60) * global.delta_game_factor);
    
    if (laser_ind >= 3)
        laser_ind = 1;
}
