function scr_sound()
{
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
    audio_sound_gain(snd, global.soundVolume, 0);
    return snd;
}

function scr_soundloop()
{
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, true);
    audio_sound_gain(snd, global.soundVolume, 0);
    return snd;
}

function scr_dialogue()
{
    var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
    audio_sound_gain(snd, global.dialogueVolume, 0);
    return snd;
}

function scr_music(arg0, arg1 = 0, arg2 = 0)
{
    var _snd = audio_play_sound(arg0, 10, true);
    audio_sound_gain(_snd, global.musicVolume, 0);
    return _snd;
}

function scr_musicnoloop(arg0)
{
    global.music = audio_play_sound(arg0, 10, false);
    audio_sound_gain(global.music, global.musicVolume, 0);
    return global.music;
}

function audio_stop_all_music()
{
    with (obj_music)
    {
        audio_stop_sound(global.music);
        audio_stop_sound(prevmuID);
        audio_stop_sound(global.secretmusic);
        audio_stop_sound(global.harrymusic);
        global.music = -4;
        prevmuID = -4;
        global.secretmusic = -4;
        global.harrymusic = -4;
    }
}

function force_song(arg0, arg1, arg2 = true, arg3 = 0, arg4 = undefined)
{
    with (obj_music)
    {
        room_details = 
        {
            rm: rm_rm_devroom,
            song: arg0,
            secret_song: arg1,
            continuous: false,
            loop_begin: arg3,
            loop_end: arg4
        };
        ignore_change = true;
        hard_force = arg2;
        unforce_continuous = true;
        event_perform(ev_other, ev_room_start);
    }
    
    exit;
}

function scr_get_music_loop(arg0)
{
    if (!audio_is_playing(arg0))
        return 0;
    
    var file = asset_get_index(audio_get_name(arg0));
    
    switch (file)
    {
        default:
            return 0;
            break;
        
        case "event:/music/w3/sucrose":
            return 8.15;
            break;
    }
}
