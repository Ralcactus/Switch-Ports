pausecount = -1;

if (room != rank_room && room != hub_w1 && room != outer_room1 && room != outer_room2 && room != scootercutsceneidk)
{
    global.gamePauseState = 0;
    fmod_event_setPause_all(false);
    scr_unpause_instances(true);
    fmod_event_stop_all(true);
    scr_levelSet();
    global.levelname = "none";
    room_goto_fixed(hub_w1);
    
    with (obj_tv)
        tvsprite = spr_tvoff;
    
    with (obj_parent_player)
        targetDoor = "A";
    
    with (instance_create(x, y, obj_fadeoutTransition))
    {
        fadealpha = 1;
        fadein = true;
    }
}
else if (room == hub_w1 || room == outer_room1 || room == outer_room2 || room == scootercutsceneidk)
{
    global.gamePauseState = 0;
    fmod_event_setPause_all(false);
    scr_unpause_instances(true);
    fmod_event_stop_all(true);
    scr_levelSet();
    global.levelname = "none";
    room_goto_fixed(realtitlescreen);
    
    with (obj_tv)
        tvsprite = spr_tvoff;
    
    with (obj_parent_player)
    {
        scr_characterSprite();
        state = UnknownEnum.Value_2;
        targetDoor = "A";
    }
    
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
