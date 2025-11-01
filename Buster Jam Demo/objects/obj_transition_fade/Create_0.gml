alpha = 0;
timer[0] = -1;

timer_func[0] = function()
{
    timer[1] = 5;
    room_goto(myroom);
    
    if (fadeout_snd != -4 && audio_is_playing(fadeout_snd))
        audio_stop_sound(fadeout_snd);
    
    if (stop_all_audio)
        audio_stop_all();
};

timer[1] = -1;

timer_func[1] = function()
{
    state = 1;
};

stop_all_audio = false;
state = 0;
delay = 0;
fadeout_snd = -4;
alarm[0] = 1;
