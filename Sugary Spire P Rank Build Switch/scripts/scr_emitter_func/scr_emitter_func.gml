function create_emitter(emitter_x = x, emitter_y = y, falloff_ref = 500, falloff_max = 1200, falloff_factor = 2)
{
    var myemit = audio_emitter_create();
    audio_emitter_falloff(myemit, falloff_ref, falloff_max, falloff_factor);
    audio_emitter_position(myemit, emitter_y, emitter_x, 0);
    
    return myemit;
}

function play_sfx(emitter, sound, loop = false, priority = 0, gain = 1, pitch = 1)
{
    if audio_emitter_exists(emitter)
        return audio_play_sound_on(emitter, sound, loop, priority, gain, undefined, pitch)
    else
    {
        emitter = create_emitter()
        return audio_play_sound_on(emitter, sound, loop, priority, gain, undefined, pitch)
    }

}