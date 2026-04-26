if (global.gamePauseState)
    exit;

if (event_isplaying(global.RankMusicInst) && room != rank_room && !instance_exists(obj_endlevelfade) && !instance_exists(obj_rank))
    fmod_event_stop(global.RankMusicInst, true);

if (global.panic)
{
    if (!panicStart)
    {
        panicStart = true;
        fmod_event_play(global.EscapeMusicInst);
        fmod_event_setPause(global.EscapeMusicInst, false);
        fmod_event_setParameter(global.EscapeMusicInst, "state", 0, true);
        fmod_global_setParameter("pillarfade", 0, true);
        fmod_event_stop(global.HarryMusicInst, true);
        
        if (!is_undefined(global.RoomMusic))
        {
            fmod_event_stop(global.RoomMusic.musicInst, true);
            fmod_event_stop(global.RoomMusic.secretMusicInst, true);
        }
    }
    else if (event_isplaying(global.EscapeMusicInst))
    {
        var event_state = 0;
        
        if (global.fill <= time_in_frames(1, 0))
            event_state = 1;
        
        if (global.lapcount >= 1)
            event_state = 2;
        
        fmod_event_setParameter(global.EscapeMusicInst, "state", event_state, true);
    }
}
else
{
    if (panicStart)
    {
        panicStart = false;
        fmod_event_stop(global.EscapeMusicInst, true);
    }
    
    fmod_global_setParameter("pillarfade", false, false);
    
    if (bbox_in_camera(obj_gummyharry, view_camera[0], 100))
        fmod_global_setParameter("pillarfade", true, false);
    
    if (!is_undefined(global.RoomMusic))
    {
        with (global.RoomMusic)
        {
            if (!is_undefined(musicFunc))
                musicFunc(room, musicInst, secretMusicInst);
        }
    }
}
