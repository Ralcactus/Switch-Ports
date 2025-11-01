anim_init();
facing = 1;
timer[0] = -1;

timer_func[0] = function()
{
    var _inst = instance_find_micro(obj_sketchcollect_nice);
    
    with (_inst)
        event_user(0);
    
    var _snd = audio_play_sound_on(controller.audio, snd_coolguy, 0, 0);
    audio_sound_pitch(_snd, 1.12);
};

timer[1] = -1;

timer_func[1] = function()
{
};
