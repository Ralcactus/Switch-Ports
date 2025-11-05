if (game_paused())
    exit;

if (start)
{
    fade = approach(fade, fadein, 0.1);
    
    if (fade >= 1 && fadein)
    {
        var _p = instance_find(obj_player, 0);
        player_reset(false, false);
        _p.nointro = true;
        _p.sendtocheckpoint = true;
        global.collect = _p.currcheckpoint.collect;
        global.destroyedcount = _p.currcheckpoint.destroyedcount;
        global.switchstate = _p.currcheckpoint.switchstate;
        global.combo = 0;
        ds_map_copy(global.respawnroom, _p.currcheckpoint.respawnroom);
        
        if (_p.currcheckpoint.pumpkins != noone)
            global.pumpkintotal = _p.currcheckpoint.pumpkins;
        
        if (_p.currcheckpoint.gems != noone)
            global.gems = _p.currcheckpoint.gems;
        
        if (_p.currcheckpoint.saveroom != noone)
            ds_map_copy(global.saveroom, _p.currcheckpoint.saveroom);
        
        with (obj_movingplatformguy)
            landed = false;
        
        if (_p.currcheckpoint.id != noone)
            room_goto(_p.currcheckpoint.room);
        else
        {
            room_goto(_p.firstroom);
            global.playerhit = false;
        }
        
        fadein = false;
    }
    
    if (fade <= 0 && !fadein)
        instance_destroy();
}
