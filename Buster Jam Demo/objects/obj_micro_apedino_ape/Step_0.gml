if (state == state_free)
    event_user(0);

if (state == state_jump || state == state_hit || (state == state_death && death_bounces))
{
    vspd += (grav * global.delta_game_factor);
    y += (vspd * global.delta_game_factor);
}

if ((state == state_jump && y > (ystart + 20)) || (state != state_jump && y > ystart))
{
    y = ystart;
    vspd = 0;
    
    if (state == state_hit || state == state_death)
    {
        state = state_death;
        
        if (death_bounces)
        {
            if (death_bounces > 2)
                vspd = -4;
            else if (death_bounces > 1)
                vspd = -1.5;
            else
                vspd = -0.8;
            
            death_bounces--;
        }
    }
    else
    {
        state = state_free;
    }
}

anim_index = state;
timer_logic(0);

if (place_meeting_micro(x, y, obj_micro_apedino_fireball))
{
    with (obj_micro_apedino_dino)
    {
        if (ID == other.ID)
            timer[0] = -1;
    }
    
    with (obj_micro_apedino_fireball)
    {
        if (ID == other.ID)
            instance_destroy();
    }
    
    timer[0] = -1;
    
    with (controller)
    {
        event_set_time(4);
        timer_alpha_override = 0;
    }
    
    audio_play_sound_on(controller.audio, snd_micro_apedino_apedeath, 0, 0);
    state = state_hit;
    hspd = -3;
    vspd = -9;
    controller.win = false;
    instance_find_micro(obj_micro_apedino_gui).timer[0] = time_bpm_to_seconds(140) * 60 * 2;
}

if (state == state_hit || state == state_death)
    cam_xoff = easy_smooth(cam_xoff, -40, 21);

if (state == state_crouch)
{
    mask_index = spr_micro_apedino_ape_mask_crouch;
    cam_yoff = easy_smooth(cam_yoff, 20, 5);
}
else
{
    mask_index = spr_micro_apedino_ape_mask_free;
    cam_yoff = easy_smooth(cam_yoff, 0, 5);
}

x += (hspd * global.delta_game_factor);

if (death_bounces < 4)
    hspd = approach(hspd, 0, 0.2);
