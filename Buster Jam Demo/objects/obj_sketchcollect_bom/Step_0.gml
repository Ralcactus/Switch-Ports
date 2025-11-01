anim_logic();

if (place_meeting_micro(x, y, obj_sketchcollect_player) && !controller.win)
{
    scr_micro_win();
    var _snd = audio_play_sound_on(controller.audio, snd_coin, 0, 0);
    audio_sound_pitch(_snd, 1.2);
    
    if (instance_find_micro(obj_sketchcollect_player).vspd < 0)
        instance_find_micro(obj_sketchcollect_player).vspd = 0;
    
    timer[0] = 40;
    timer[1] = 10;
    
    with (controller)
    {
        if (timer[0] >= (time_bpm_to_seconds(140) * 3))
            event_round_time(3);
    }
}

timer_logic(0);
timer_logic(1);
