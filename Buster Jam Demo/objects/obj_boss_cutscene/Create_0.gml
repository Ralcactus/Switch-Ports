if (audio_is_playing(global.bgm_play))
    audio_sound_gain(global.bgm_play, 0, 2000);

if (global.room_last == rm_setup)
    timer[0] = 2;
else
    timer[0] = 120;

timer_func[0] = function()
{
    if (audio_is_playing(global.bgm_play))
    {
        audio_stop_sound(global.bgm_play);
        global.bgm = -4;
        global.bgm_play = -4;
    }
    
    timer[1] = 60;
};

timer[1] = -1;

timer_func[1] = function()
{
    instance_create_layer(0, 0, "Instances", obj_boss_assassins);
};
