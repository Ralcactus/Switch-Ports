idle_snd_gain = 0;
my_idle_snd = audio_play_sound_on(controller.audio, snd_micro_jetpack_idle, true, 0);
audio_sound_gain(my_idle_snd, idle_snd_gain, 0);
ready = true;
