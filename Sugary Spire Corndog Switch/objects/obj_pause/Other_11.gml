if (global.levelname != "none")
{
    pausecount = -1;
    fmod_event_setPause_all(false);
    scr_unpause_instances(true);
    fmod_event_stop_all(true);
    scr_levelSet();
    room = global.firstlvlRoom;
    global.gamePauseState = 0;
    
    with (obj_parent_player)
        targetDoor = "A";
    
    with (instance_create(x, y, obj_fadeoutTransition))
    {
        fadealpha = 1;
        fadein = true;
    }
}
else
{
    event_play_oneshot("event:/SFX/ui/confirm");
}
