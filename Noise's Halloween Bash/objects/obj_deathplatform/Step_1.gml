if (!in_room() || game_paused())
    exit;

checkbuffer = max(checkbuffer - 1, 0);
moveSpd = 2 / path_get_length(currpath);
var _plr = instance_find(obj_player, 0);

if (_plr.ondeathplatform != id)
{
    if (player_collideable() && canCollide(_plr) && checkbuffer <= 0 && !obj_player.diddeathroute)
    {
        if (!playerstillonplatform)
        {
            if (place_meeting(x, y - 1, _plr) && !place_meeting(x, y, _plr) && _plr.grounded && _plr.vsp >= 0 && _plr.state == states.normal && _plr.hsp == 0)
                platformmovetimer--;
            else
                platformmovetimer = 40;
            
            if (platformmovetimer <= 0)
            {
                platformmovetimer = 40;
                _plr.ondeathplatform = id;
                _plr.state = states.platformlocked;
                _plr.platformstartpos = _plr.x;
                _plr.platformtargetpos = x;
                
                if (!returnTrip)
                {
                    _plr.beforedeathroute = 
                    {
                        room: room,
                        path: originalPathA
                    };
                }
                
                lerpval = 0;
                reachedhalfway = false;
                currpath = pathA;
                persistent = true;
                
                if (round(_plr.platformstartpos) != round(_plr.platformtargetpos))
                {
                    _plr.sprite_index = spr_player_platformhop;
                    _plr.image_index = 0;
                }
                
                playerstillonplatform = true;
            }
        }
        else if (!(place_meeting(x, y - 1, _plr) && !place_meeting(x, y, _plr) && _plr.grounded && _plr.vsp >= 0))
            playerstillonplatform = false;
    }
}
else
{
    if (_plr.sprite_index != spr_player_platformhop)
        lerpval = min(lerpval + moveSpd, 1);
    
    var _finallerp = clamp((lerpval * 2) - (room == targetroom), 0, 1);
    x = round(path_get_x(currpath, _finallerp));
    y = round(path_get_y(currpath, _finallerp));
    
    with (_plr)
    {
        if (sprite_index != spr_player_platformhop)
        {
            x = other.x;
            y = other.y - 45.65;
        }
    }
    
    var _z = -easy_sin(lerpval) * 65;
    z = zstart + _z;
    _plr.z = _plr.nonplatZ;
    _plr.depth = (_plr.nonplatZ + _z) - 10;
    var _lastspin = spin;
    spin = lerpval * 1440;
    
    if (_plr.sprite_index == spr_player_idle)
    {
        _plr.showturnsprite = true;
        _plr.platformspin -= spin - _lastspin;
    }
    
    if (lerpval >= 0.5 && !reachedhalfway)
    {
        reachedhalfway = true;
        _plr.targetroom = targetroom;
        
        with (obj_deathplatform)
            persistent = id == other.id;
        
        instance_create_depth(0, 0, 0, obj_deathroutetransition);
    }
    
    if (lerpval >= 1)
    {
        lerpval = 1;
        z = zstart;
        var _endplat = instance_place(x, y, obj_deathplatformend);
        
        if (_endplat != noone)
            add_saveroom(_endplat);
        
        _plr.ondeathplatform = noone;
        _plr.diddeathroute |= returnTrip;
        _plr.z = _plr.nonplatZ;
        _plr.depth = _plr.nonplatZ;
        set_player_checkpoint(id, true);
        
        if (_plr.state == states.platformlocked)
        {
            _plr.state = states.normal;
            deathplat_camupdate();
        }
        
        var _temp = targetroom;
        targetroom = startingroom;
        startingroom = _temp;
        path_reverse(pathA);
        path_reverse(pathB);
        _temp = pathA;
        pathA = pathB;
        pathB = _temp;
    }
}

curpalette = approach(curpalette, _plr.diddeathroute, 0.025);
