if (delay == 0)
{
    if (!global.coneblock)
    {
        event_play_oneshot("event:/SFX/general/switchstart", x, y);
        sprite_index = spr_coneswitch_transtoON;
        global.coneblock = true;
        
        with (obj_coneblock_on)
            obj_coneblock_on.alarm[0] = 1;
        
        with (obj_coneblock_off)
            obj_coneblock_off.alarm[0] = 1;
    }
    else
    {
        event_play_oneshot("event:/SFX/general/switchoff", x, y);
        sprite_index = spr_coneswitch_transtoOFF;
        global.coneblock = false;
        
        with (obj_coneblock_on)
            obj_coneblock_on.alarm[1] = 1;
        
        with (obj_coneblock_off)
            obj_coneblock_off.alarm[1] = 1;
    }
    
    delay = 1;
    alarm[0] = 90;
}
