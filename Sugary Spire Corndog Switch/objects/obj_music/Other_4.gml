if (!global.panic)
{
    var target_room_music = ds_map_find_value(global.RoomMusicMap, room);
    
    if (!is_undefined(target_room_music) && is_struct(target_room_music))
    {
        var previous_room_music = global.RoomMusic;
        
        if (is_undefined(previous_room_music) || previous_room_music.eventName != target_room_music.eventName)
        {
            fmod_event_play(target_room_music.musicInst);
            fmod_event_setPause(target_room_music.musicInst, false);
            
            if (!is_undefined(previous_room_music))
            {
                fmod_event_stop(previous_room_music.musicInst, true);
                
                if (!is_undefined(previous_room_music.secretMusicInst))
                    fmod_event_stop(previous_room_music.secretMusicInst, true);
            }
            
            global.RoomMusic = target_room_music;
            
            with (global.RoomMusic)
            {
                if (!is_undefined(musicFunc))
                    musicFunc(room, musicInst, secretMusicInst);
            }
        }
    }
    
    if (instance_exists(obj_gummyharry))
    {
        fmod_event_play(global.HarryMusicInst);
        fmod_event_setPause(global.HarryMusicInst, false);
        fmod_global_setParameter("pillarfade", 0, true);
    }
    else
    {
        fmod_event_stop(global.HarryMusicInst, true);
    }
}

if (global.RoomIsSecret)
{
    currentSecretStatus = true;
    
    if (!is_undefined(global.RoomMusic) && !is_undefined(global.RoomMusic.secretMusicInst))
    {
        fmod_event_play(global.RoomMusic.secretMusicInst);
        var music_timeline_percent = fmod_event_getTimelinePosition(global.RoomMusic.musicInst) / fmod_getEventLength(global.RoomMusic.eventName);
        var secret_pos = music_timeline_percent * fmod_getEventLength(global.RoomMusic.secretEventName);
        fmod_event_setTimelinePosition(global.RoomMusic.secretMusicInst, secret_pos);
        fmod_event_setPause(global.RoomMusic.musicInst, true);
        fmod_event_setPause(global.RoomMusic.secretMusicInst, false);
    }
    
    if (global.panic)
        fmod_event_setPause(global.EscapeMusicInst, true);
}

if (room == rank_room)
    stop_music();
