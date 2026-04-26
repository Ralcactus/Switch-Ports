if (fadealpha > 1)
{
    fadein = 1;
    
    if (instance_exists(obj_parent_player))
    {
        if (room_exists(obj_parent_player.targetRoom))
            room_goto_fixed(obj_parent_player.targetRoom);
        else
            room_goto_fixed(rm_missing);
    }
    
    if (levelStart)
        scr_levelSet();
    
    if (secretRoom)
        global.RoomIsSecret = true;
}

if (fadein == 0)
    fadealpha += 0.1;
else if (fadein == 1)
    fadealpha -= 0.1;

if (fadein == 1 && fadealpha < 0)
    instance_destroy();

if (fadein == 0 && fadealpha > 1)
{
    if (instance_exists(obj_titlecard))
        instance_destroy(obj_titlecard);
}
