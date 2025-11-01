rot = 0;
surf = -4;
zoom = 1.2;
shake = 1;
logo_scale = 1.6;
logo_alpha = 0;
logo_percent = 0;
logo_shake = 0;
logo_in = false;
timer[0] = 90;

timer_func[0] = function()
{
    logo_in = true;
    audio_play_sound(snd_blackknives_logo, 0, false);
};

audio_play_sound(snd_cutscene_knives_in, 0, false);
