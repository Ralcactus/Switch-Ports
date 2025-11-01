timer_logic(0);
anim_logic();
x += (hspd * global.delta_game_factor);

if (input_check_pressed("jump", player) && go && !stopped)
{
    hspd = 0;
    stopped = true;
    anim_play(spr_Bu_defuse_out);
    xoff = -29;
    yoff = -41;
    
    if (place_meeting_micro(x, y, obj_Bu_defuse_marker))
    {
        scr_micro_win();
        audio_play_sound_on(controller.audio, snd_Bu_defuse_fuseout, 0, 0);
    }
    else
    {
        event_user(0);
    }
}

if (x < 546 && !stopped)
{
    hspd = 0;
    stopped = true;
    event_user(0);
}

if (audio_is_playing(sndFuse) && stopped)
    audio_stop_sound(sndFuse);
