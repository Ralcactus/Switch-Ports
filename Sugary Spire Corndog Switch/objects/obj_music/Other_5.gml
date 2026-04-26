if (!currentSecretStatus)
    exit;

if (!is_undefined(global.RoomMusic))
{
    fmod_event_stop(global.RoomMusic.secretMusicInst, true);
    
    if (!global.panic)
        fmod_event_setPause(global.RoomMusic.musicInst, false);
}

if (global.panic)
    fmod_event_setPause(global.EscapeMusicInst, false);

currentSecretStatus = false;
global.RoomIsSecret = false;
