global.gameframe_can_input = room != Init;

if (!hovering)
    global.gameframe_default_cursor = -2;
else
{
    global.gameframe_default_cursor = -21;
    
    if (mouse_check_button_pressed(mb_left) && clicklink != -1)
        url_open(clicklink);
}

gameframe_update();
goawaytimer = max(goawaytimer - 1, 0);

if (room != Jeg)
{
    if ((device_mouse_x_to_gui(0) != mouse_xprev || device_mouse_y_to_gui(0) != mouse_yprev) && gameframe_mouse_in_window())
    {
        if (!(debugcam && debugcamcontrols && game_paused() && !in_debug_menu()))
            goawaytimer = 100;
    }
}

if (goawaytimer <= 0)
{
    global.gameframe_alpha = approach(global.gameframe_alpha, 0, 0.1);
    global.gameframe_set_cursor = false;
    window_set_cursor(cr_none);
}
else
{
    global.gameframe_alpha = approach(global.gameframe_alpha, 1, 0.1);
    global.gameframe_set_cursor = true;
}

mouse_xprev = device_mouse_x_to_gui(0);
mouse_yprev = device_mouse_y_to_gui(0);
var _px = obj_player.x;
var _py = obj_player.y;

if (obj_player.state == states.rope)
{
    _px = obj_player.ropeID.x;
    _py = obj_player.ropeID.y + obj_player.ropeID.sprite_height;
}

camera_set_view_size(camera, get_game_width() * zoom, get_game_height() * zoom);
camAsp = camera_get_view_width(camera) / camera_get_view_height(camera);
camDist = -get_game_height() / 2;
camFov = 88;

if (room == Titlescreen)
    camFov = 22.8;

if (!game_paused())
    camshake = irandom_range(-shake_mag, shake_mag) * global.screenshake;

if (!debugcam)
{
    if (room != Jeg)
        window_mouse_set_locked(false);
    
    var _lockcond = obj_player.state != states.falllocked && !(obj_player.state == states.platformlocked && obj_player.sprite_index != spr_player_platformhop);
    
    if (_lockcond)
        camX = _px + camForward;
    
    if (room == Titlescreen)
    {
        camX = room_width / 2;
        
        switch (global.resmode)
        {
            case aspectratio.res4_3:
                camX -= 120;
                break;
            
            case aspectratio.res16_10:
                camX -= 40;
                break;
        }
        
        camY = room_height / 2;
    }
    else if (room == Jeg)
    {
        camX = obj_jegplayer.x;
        camY = -64;
    }
    else if (_lockcond)
    {
        camY = _py;
        
        if (obj_player.state == states.levelintro)
            camY = obj_player.levelstarty;
        
        camY += (camVerticalPan + camUp);
        camY -= 30;
    }
    
    if (obj_player.state == states.nitrocutscene)
    {
        var _scene = obj_nitrodetonatorcutscene;
        camX = _scene.nitrox + (_scene.nitrow / 2);
        camY = _scene.nitroy + (_scene.nitroh / 2);
        camY -= 30;
    }
    
    if (room == Titlescreen)
        camZ = obj_player.z;
    else if (room == Jeg)
        camZ = obj_jegplayer.y;
    else
        camZ = camDist;
    
    if (room == Jeg)
        camYAW = obj_jegplayer.yaw;
    else
        camYAW = 270;
    
    if (room == Titlescreen || room == Jeg)
        camPITCH = 0;
    else
    {
        var _zFrom = camDist;
        var _zTo = obj_player.z;
        var _yFrom = camY - 30;
        var _yTo = camY;
        camPITCH = point_direction(_zFrom, _yFrom, _zTo, _yTo) - 360;
    }
    
    prevlock = curlock;
    prevlockbboxdata = curlockbboxdata;
    var _preunlockX = camX;
    var _preunlockY = camY;
    
    if (prevlock != noone)
    {
        var _lock = lock_cam(_preunlockX, _preunlockY, prevlock, prevlockbboxdata);
        _preunlockX = _lock[0];
        _preunlockY = _lock[1];
    }
    
    var _prelockX = camX;
    var _prelockY = camY;
    
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
            
            other.curlock = noone;
            other.curlockbboxdata = [];
            
            if (player_collideable() || state == states.endplatform || state == states.dead || state == states.levelintro || state == states.outhouse || state == states.platformlocked)
            {
                var _lockid = instance_place(_meetx, _meety, par_camlock);
                
                if (!_lockid)
                {
                    var _extender = instance_place(_meetx, _meety, obj_lockcamextender);
                    
                    if (_extender)
                        _lockid = _extender.lock;
                }
                
                if (_lockid)
                {
                    other.curlock = _lockid.object_index;
                    other.curlockbboxdata = [_lockid.bbox_left, _lockid.bbox_top, _lockid.bbox_right, _lockid.bbox_bottom];
                }
            }
        }
        
        if (curlock != noone)
        {
            var _lock = lock_cam(camX, camY, curlock, curlockbboxdata);
            camX = _lock[0];
            camY = _lock[1];
        }
    }
    
    if (prevlock == noone && curlock != noone)
        offset_camera(_prelockX, _prelockY, camX, camY);
    
    if ((prevlock != noone && curlock == noone) || (!array_equals(curlockbboxdata, prevlockbboxdata) && curlock != noone))
        offset_camera(_preunlockX, _preunlockY, camX, camY);
    
    if (interpplaypos)
    {
        offset_camera(prevcamx + camXINTERP, prevcamy + camXINTERP, camX + camXINTERP, camY + camXINTERP);
        interpplaypos = false;
    }
    
    if (!game_paused())
    {
        camX += camXINTERP;
        camY += camYINTERP;
        camXINTERP *= 0.7;
        camYINTERP *= 0.7;
    }
}
else if (!in_debug_menu() && !game_paused() && debugcamcontrols)
{
    camX += (dcos(camYAW) * input_check_opposing("debug_cam_back", "debug_cam_forward") * 8);
    camZ -= (dsin(camYAW) * input_check_opposing("debug_cam_back", "debug_cam_forward") * 8);
    camX += (dsin(camYAW) * -input_check_opposing("debug_cam_left", "debug_cam_right") * 8);
    camZ += (dcos(camYAW) * -input_check_opposing("debug_cam_left", "debug_cam_right") * 8);
    camY += (input_check_opposing("debug_cam_up", "debug_cam_down") * 8);
    
    if (!input_player_using_gamepad())
    {
        window_mouse_set_locked(true);
        var _sens = 7;
        
        if (room == Titlescreen)
            _sens = 20;
        
        camYAW += (window_mouse_get_delta_x() / _sens);
        camPITCH -= (window_mouse_get_delta_y() / _sens);
        window_mouse_set(window_get_width() / 2, window_get_height() / 2);
        global.gameframe_set_cursor = false;
        window_set_cursor(cr_none);
    }
    else
    {
        window_mouse_set_locked(false);
        var _sens = 1;
        
        if (room == Titlescreen)
            _sens = 2;
        
        camYAW += (input_check_opposing("debug_cam_lookleft", "debug_cam_lookright") / _sens);
        camPITCH -= (input_check_opposing("debug_cam_lookup", "debug_cam_lookdown") / _sens);
    }
    
    camPITCH = clamp(camPITCH, -85, 85);
}
else
    window_mouse_set_locked(false);

listener_setPosition(0, camX, camY, camZ);

if (!game_paused())
{
    if (obj_player.state != states.hitstun && obj_player.state != states.actor)
    {
        if (floor(abs(obj_player.hsp)) != 0)
            camForward = approach(camForward, 100 * sign(obj_player.hsp), 2.5);
        else
            camForward = approach(camForward, 0, 1.5);
        
        if (obj_player.state == states.wall && floor(abs(obj_player.vsp)) != 0)
            camUp = approach(camUp, 50 * sign(obj_player.vsp), 2.5);
        else
            camUp = approach(camUp, 0, 1.5);
    }
    
    if (shake_mag > 0)
    {
        shake_mag -= shake_mag_acc;
        
        if (shake_mag < 0)
            shake_mag = 0;
    }
    
    for (var _s = 0; _s < array_length(scoresparkles); _s++)
    {
        var _sparkle = scoresparkles[_s];
        _sparkle.index += 0.5;
        
        if (_sparkle.index >= sprite_get_number(_sparkle.sprite))
            array_delete(scoresparkles, _s--, 1);
    }
    
    scoresparkletimer = approach(scoresparkletimer, 0, 0.1);
    
    if (global.combo >= 5)
    {
        if (scoresparkletimer <= 0)
        {
            array_push(scoresparkles, new ScoreSparkle(33, 24));
            scoresparkletimer = 2.5;
        }
    }
    
    hpatimer = max(hpatimer - 1, 0);
    collectatimer = max(collectatimer - 1, 0);
    comboatimer = max(comboatimer - 1, 0);
    pumpkinatimer = max(pumpkinatimer - 1, 0);
    crateatimer = max(crateatimer - 1, 0);
    gematimer = max(gematimer - 1, 0);
    hpalpha = approach(hpalpha, hpatimer > 0, 0.1);
    collectalpha = approach(collectalpha, collectatimer > 0, 0.1);
    comboalpha = approach(comboalpha, comboatimer > 0, 0.1);
    pumpkinalpha = approach(pumpkinalpha, pumpkinatimer > 0, 0.1);
    cratealpha = approach(cratealpha, crateatimer > 0, 0.1) * !in_perilousroute();
    gemalpha = approach(gemalpha, gematimer > 0, 0.1);
    
    if (input_check("inv") && !instance_exists(obj_dointro))
    {
        hpatimer = 240;
        collectatimer = 240;
        comboatimer = 240;
        pumpkinatimer = 240;
        crateatimer = 240;
        gematimer = 240;
    }
    
    hudcratespin = (hudcratespin + 1) % 360;
    candyind = (candyind + 0.35) % sprite_get_number(spr_candyicon);
    
    if (noisehudshaketime > 0)
    {
        noisehudshaketime = approach(noisehudshaketime, 0, 1);
        noisehudshake = irandom_range(3, -3);
    }
    else
        noisehudshake = 0;
}

globallight = (room == PatchPerilousEntrance) ? 0.5 : 1;
var _num = collision_circle_list(camX, camY, max(global.maxscreenwidth, global.maxscreenheight), shadedobjects, false, true, global.instancelist, false);

for (var i = 0; i < _num; i++)
{
    with (global.instancelist[| i])
    {
        if (!visible)
            continue;
        
        lightlevel = (room == PatchPerilousEntrance) ? 0.5 : 1;
        var _darkarea = instance_place(x, y, obj_darkarea);
        
        if (_darkarea != noone)
        {
            var _perc = (max(bbox_left, _darkarea.bbox_left) - min(bbox_right, _darkarea.bbox_right)) * (max(bbox_top, _darkarea.bbox_top) - min(bbox_bottom, _darkarea.bbox_bottom + 1));
            var _area = (bbox_left - bbox_right) * (bbox_top - bbox_bottom);
            _perc = _perc / _area;
            lightlevel -= (_perc * _darkarea.darkness);
        }
        
        var _percl1 = 0;
        var _percl2 = 0;
        var _temppercl = 0;
        
        with (obj_flamecratefire)
        {
            _temppercl = point_distance(other.x, other.y, x + (sprite_xoffset / 2), y + (sprite_yoffset / 2)) / (((45 + (35 * firescale)) * (image_xscale + image_yscale)) / 2);
            _temppercl = 1 - clamp(_temppercl, 0, 1);
            _temppercl *= firescale;
            
            if (_temppercl > _percl1)
                _percl1 = _temppercl;
        }
        
        with (obj_torchplatformfire)
        {
            _temppercl = point_distance(other.x, other.y, x, y) / 100;
            _temppercl = 1 - clamp(_temppercl, 0, 1);
            
            if (_temppercl > _percl1)
                _percl1 = _temppercl;
        }
        
        lightlevel += min(_percl1 + _percl2, 1);
    }
}

ds_list_clear(global.instancelist);
ds_list_clear(billboardlist);

if (room != Init)
{
    _num = collision_circle_list(camX, camY, max(global.maxscreenwidth, global.maxscreenheight), [obj_player, par_billboard], false, true, billboardlist, false);
    toshadow = array_create(_num, noone);
}

prevcamx = camX;
prevcamy = camY;
