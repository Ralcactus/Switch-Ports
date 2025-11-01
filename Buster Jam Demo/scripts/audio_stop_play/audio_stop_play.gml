function audio_stop_play(arg0, arg1, arg2)
{
    if (audio_is_playing(arg0))
        audio_stop_sound(arg0);
    
    return audio_play_sound(arg0, arg1, arg2);
}
