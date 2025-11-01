event_inherited();
bubble_alpha = 0;
percent = 0;
timer[0] = 24;

timer_func[0] = function()
{
    ready = true;
    audio_play_sound_on(controller.audio, snd_micro_pistol_angel_arrival, 0, 0);
};

ready = false;
anim_init();
played_bubble_sound = false;
alarm[0] = 1;
