bgmPlay = audio_play_sound(bgm_paused, 0, true);
audio_sound_loop_start(bgmPlay, 5.998);
audio_sound_gain(bgmPlay, 0, 0);
audio_sound_gain(bgmPlay, 1, 1000);
ready = true;
