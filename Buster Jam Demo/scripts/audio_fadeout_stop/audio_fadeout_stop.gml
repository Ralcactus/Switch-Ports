function audio_fadeout_stop(arg0, arg1, arg2)
{
    if (!audio_is_playing(arg0))
        exit;
    
    var _inst = instance_create_depth(0, 0, 0, obj_fadeout_persistent);
    audio_sound_gain(arg0, arg1, arg2);
    
    with (_inst)
    {
        my_snd = arg0;
        timer[0] = arg2 / 16.666666666666668;
    }
}
