event_inherited();
lose_scale = 4;
lose_alpha = 0;
lose = false;
timer[0] = -1;

timer_func[0] = function()
{
    lose = true;
    audio_play_sound_on(controller.audio, snd_micro_apedino_dinowins, false, 0);
};
