if (!audio_is_playing(global.bgmPlay))
{
    if (room == rm_city_s7a1 && !global.boss_cutscene)
        global.bgmPlay = audio_play_sound(bgm_city_b, 0, true);
    else
        global.bgmPlay = audio_play_sound(bgm, 0, true);
    
    if (global.bgmLoopStart != -4)
        audio_sound_loop_start(global.bgmPlay, global.bgmLoopStart);
    
    if (global.bgmLoopEnd != -4)
        audio_sound_loop_end(global.bgmPlay, global.bgmLoopEnd);
}
