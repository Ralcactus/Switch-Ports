if (instance_exists(currcheckpoint.id) && sendtocheckpoint)
{
    sendtocheckpoint = false;
    
    switch (currcheckpoint.object_index)
    {
        case obj_destroyablecheckpoint:
            x = currcheckpoint.x + 32;
            y = currcheckpoint.y + 18;
            break;
        
        case obj_outhouse:
            x = currcheckpoint.x;
            y = currcheckpoint.y - 14;
            break;
        
        case obj_deathplatform:
            x = currcheckpoint.x;
            y = currcheckpoint.y - 45.65;
            currcheckpoint.id.playerstillonplatform = true;
            currcheckpoint.id.checkbuffer = 5;
            break;
        
        default:
            x = currcheckpoint.x;
            y = currcheckpoint.y;
    }
}
else if (targetouthouse != noone)
{
    with (targetouthouse)
    {
        flagspr = spr_outhouse_flagappear;
        flagind = 0;
        set_player_checkpoint(id, true);
        other.x = x;
        other.y = y - 14;
        alarm[1] = 20;
    }
    
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/outhouseflush", outhousestartx, outhousestarty);
    targetouthouse = noone;
}
else if (targetdoor != "")
{
    with (obj_door)
    {
        if (targetdoor == other.targetdoor)
        {
            with (other.id)
            {
                if (verticalhallway == 0)
                {
                    x = other.x;
                    y = other.y + 0.35;
                }
                else
                {
                    x = other.x + verticalhallwayposoffset;
                    y = other.y + (verticalhallway * 80);
                }
                
                levelstarty = y;
            }
        }
    }
}

outhousestartx = x;
outhousestarty = y;
xprev = x;

with (obj_playerheart)
{
    x = (obj_player.image_xscale == 1) ? (obj_player.x - 64) : (obj_player.x + 64);
    y = obj_player.y - 16;
    z = obj_player.z + 5;
    image_xscale = -sign(x - obj_player.x);
}

with (obj_nitrodetonatorcutscene)
{
    if (nextroom >= (array_length(rooms) + 1))
    {
        nitro = obj_deathplatform;
        nitrox = nitro.x;
        nitroy = nitro.y;
        nitrow = 0;
        nitroh = 0;
    }
    else
    {
        nitro = instance_nearest(room_width / 2, room_height / 2, obj_destroyablenitro);
        
        if (instance_exists(obj_destroyablenitroarrow))
        {
            var _nitroarrow = instance_nearest(room_width / 2, room_height / 2, obj_destroyablenitroarrow);
            var _nitroarrowdist = point_distance(room_width / 2, room_height / 2, _nitroarrow.x, _nitroarrow.y);
            var _nitrodist = point_distance(room_width / 2, room_height / 2, nitro.x, nitro.y);
            
            if (_nitroarrowdist <= _nitrodist)
            {
                if (in_saveroom(string("{0}_ARROW", real(_nitroarrow)), global.respawnroom) && !in_saveroom(string("{0}_NITRO", real(_nitroarrow)), global.respawnroom))
                    nitro = _nitroarrow;
            }
        }
        
        nitrox = nitro.x;
        nitroy = nitro.y;
        nitrow = nitro.sprite_width;
        nitroh = nitro.sprite_height;
    }
}

with (obj_drawcontroller)
{
    curlock = noone;
    curlockbboxdata = [];
    
    if (obj_player.state != states.noclip)
    {
        with (obj_player)
        {
            var _meetx = x;
            var _meety = y;
            
            if (state == states.levelintro)
                _meety = levelstarty;
            
            if (state == states.nitrocutscene)
            {
                var _scene = obj_nitrodetonatorcutscene;
                _meetx = _scene.nitrox + (_scene.nitrow / 2);
                _meety = _scene.nitroy + (_scene.nitroh / 2);
            }
            
            if ((player_collideable() || state == states.levelintro || obj_player.state == states.outhouse) && (place_meeting(_meetx, _meety, par_camlock) || place_meeting(_meetx, _meety, obj_lockcamextender)))
            {
                var _lockid = noone;
                
                if (place_meeting(_meetx, _meety, par_camlock))
                    _lockid = instance_place(_meetx, _meety, par_camlock);
                else
                    _lockid = instance_place(_meetx, _meety, obj_lockcamextender).lock;
                
                other.curlock = _lockid.object_index;
                other.curlockbboxdata = [_lockid.bbox_left, _lockid.bbox_top, _lockid.bbox_right, _lockid.bbox_bottom];
            }
            else
            {
                other.curlock = noone;
                other.curlockbboxdata = [];
            }
        }
        
        if (curlock != noone)
        {
            var _lock = lock_cam(camX, camY, curlock, curlockbboxdata);
            camX = _lock[0];
            camY = _lock[1];
        }
    }
    
    prevlock = curlock;
    prevlockbboxdata = curlockbboxdata;
    interpplaypos = false;
    camXINTERP = 0;
    camYINTERP = 0;
}
