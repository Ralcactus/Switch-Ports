y += (vspd * global.delta_game_factor);
percent_scale = approach(percent_scale, 1, 0.04);
xscale = use_curve(acurv_elastic, percent_scale, undefined, 1.35, 1);
yscale = use_curve(acurv_elastic, percent_scale, undefined, 0.65, 1);
image_xscale = 0.55;

if (y >= y_target && !landed && !failed)
{
    with (obj_micro_bec)
        event_zoom();
    
    if (place_meeting_micro(x, y, topping_touch))
    {
        vspd = 0;
        y = y_target;
        audio_play_sound_on(controller.audio, snd_munch, 0, 0);
        landed = true;
        percent_scale = 0;
        
        with (obj_micro_bec)
        {
            if (ID == other.ID)
                event_user(0);
        }
        
        land_xoff = x - instance_find_micro(obj_micro_bec).x;
    }
    else
    {
        failed = true;
    }
}

if (y >= (controller.game_height - 59) && !lost)
{
    with (obj_micro_bec)
        event_zoom();
    
    y = controller.game_height - 59;
    audio_play_sound(snd_wronghuh, 0, 0);
    
    with (controller)
    {
        if (timer[0] > (60 * time_bpm_to_seconds(140) * 5))
            event_set_time(5);
        
        timer_alpha_override = 1;
    }
    
    with (obj_micro_bec_topping_fall)
    {
        if (ID == other.ID)
            vspd = 0;
    }
    
    lost = true;
    percent_scale = 0;
}

if (vspd > 0 && timer[0] == -1)
    timer[0] = 10;

timer_logic(0);
