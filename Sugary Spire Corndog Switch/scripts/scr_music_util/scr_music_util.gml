function set_volume_options(arg0 = global.masterVolume, arg1 = global.musicVolume, arg2 = global.soundVolume)
{
    fmod_global_setParameter("masterVolume", arg0, true);
    fmod_global_setParameter("musicVolume", arg1, true);
    fmod_global_setParameter("sfxVolume", arg2, true);
}

function stop_music(arg0 = true)
{
    if (!is_undefined(global.RoomMusic))
    {
        fmod_event_stop(global.RoomMusic.musicInst, arg0);
        fmod_event_stop(global.RoomMusic.secretMusicInst, arg0);
    }
    
    fmod_event_stop(global.HarryMusicInst, arg0);
    fmod_event_stop(global.EscapeMusicInst, arg0);
}
