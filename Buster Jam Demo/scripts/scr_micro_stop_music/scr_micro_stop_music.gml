function scr_micro_stop_music()
{
    if (instance_exists(obj_frenzy))
    {
        audio_sound_gain(obj_frenzy.music_play, 0, 0);
    }
    else if (instance_exists(obj_boss_tutorial))
    {
        audio_sound_gain(obj_boss_tutorial.music_play_action, 0, 0);
    }
    else
    {
        with (controller)
            audio_stop_sound(micro_bgm_play);
    }
}
