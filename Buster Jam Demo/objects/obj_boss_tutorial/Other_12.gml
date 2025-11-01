if (state == 4)
{
    audio_stop_sound(music_play);
    audio_stop_sound(music_play_action);
    music_frenzy = audio_play_sound(global.frenzy_music, 0, true);
    timer[3] = time_bpm_to_seconds(140) * 60 * 3;
}
else
{
    play_ready = true;
    
    with (obj_buster_machine)
        time_beat = -1;
}
