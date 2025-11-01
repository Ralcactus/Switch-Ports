if (controller.timer[0] <= (60 * time_bpm_to_seconds(140) * 7) && !controller.win)
    controller.timer_alpha_override = 1;

if (!ready)
    exit;

if (!controller.win)
{
    var _match = true;
    
    for (var i = 0; i < 3; i++)
    {
        if (instance_find_micro(obj_micro_nudematch_head).index[i] != instance_find_micro(obj_micro_nudematch_head_reference).index[i])
        {
            _match = false;
            break;
        }
    }
    
    if (_match)
    {
        with (instance_find_micro(obj_micro_nudematch_head))
            row = -1;
        
        scr_micro_win();
        
        with (controller)
        {
            if (timer[0] >= (time_bpm_to_seconds(140) * 4))
                event_round_time(4);
        }
        
        timer[1] = 15;
        audio_play_sound_on(controller.audio, snd_belltree, 0, 0);
    }
}

if (state == 1)
{
    flash = approach(flash, 1, 0.05);
    
    if (flash == 1 && timer[0] == -1)
        timer[0] = 5;
}
else if (state == 2)
{
    flash = approach(flash, 0, 0.1);
}

timer_logic(0);
timer_logic(1);
