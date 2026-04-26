DrawHUD = true;

if (room == timesuproom || room == souractive_tutorial || room == rm_levelSelect || room == rank_room || room == rm_credits || room == rm_titlecard || room == hub_w1 || room == hub_w2 || room == tutorial_1 || room == mineshaft_elevator || room == rm_poker || instance_exists(obj_bosscontroller))
    DrawHUD = false;

if (get_panic() && !global.freezeframe)
{
    if (global.fill > global.maxwave)
        global.maxwave = global.fill;
    
    if (!global.freezeframe)
    {
        if (!obj_tv.sucroseTimer && global.fill <= obj_tv.target_fill)
            global.fill--;
        
        if (((global.fill > 0 && (abs(global.fill) % 60) == 0) || (global.fill <= 0 && (abs(global.fill) % 10) == 0)) && global.Collect >= 5)
        {
            global.Collect -= 5;
            
            with (instance_create(obj_parent_player.x, obj_parent_player.y, obj_pizzaloss))
                sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
        }
    }
    
    if (global.panic && global.fill <= 0 && obj_tv.timer_out <= 0 && room != timesuproom)
    {
        if (!instance_exists(obj_coneball_timesUp))
            instance_create(obj_parent_player.x, obj_parent_player.y, obj_coneball_timesUp);
        
        global.greyscalefade = approach(global.greyscalefade, 0.45, 0.005);
    }
    else
    {
        global.greyscalefade = approach(global.greyscalefade, 0, 0.015);
    }
    
    global.wave = clamp(clamp(global.wave + (60 / room_speed), 0, global.maxwave - global.fill), 0, global.maxwave);
    panicshake = clamp(lerp(1, 3, global.wave / global.maxwave), 1, 3);
    panicshakeacc = 3 / room_speed;
}
else
{
    panicshake = 0;
    panicshakeacc = 0;
    
    if (!global.freezeframe)
        camera_set_view_angle(view_camera[0], 0);
}

if (global.seconds < 0)
{
    global.seconds = 59;
    global.minutes -= 1;
}

global.dancetimer = approach(global.dancetimer, 0, 1);

if (frozen && !global.freezeframe)
{
    for (var i = 0; i < 3; i++)
        alarm_set(i, frozenAlarm[i]);
    
    frozen = false;
}

if (room != realtitlescreen && room != rm_introVideo && !instance_exists(obj_startgate) && room != scootercutsceneidk && room != outer_room1 && room != outer_room2 && room != hub_w1 && room != hub_w2 && room != palroom && room != rm_titlecard)
{
    if (!global.freezeframe && obj_parent_player.state != UnknownEnum.Value_0 && room != rank_room && !instance_exists(obj_endlevelfade) && room != mineshaft_elevator)
    {
        global.playmiliseconds += 1;
        
        if (global.playmiliseconds >= 60)
        {
            global.playmiliseconds = 0;
            global.playseconds += 1;
            
            if (global.playseconds >= 60)
            {
                global.playseconds = 0;
                global.playminutes += 1;
                
                if (global.playminutes >= 60)
                {
                    global.playminutes = 0;
                    global.playhour += 1;
                }
            }
        }
    }
}
else
{
    global.playmiliseconds = 0;
    global.playseconds = 0;
    global.playminutes = 0;
    global.playhour = 0;
}

with (obj_parent_player)
{
    if (place_meeting(x, y, obj_exitgate) && state == UnknownEnum.Value_57)
        global.playmiliseconds = 0;
}

panicshake = approach(panicshake, 0, panicshakeacc);
lspd = 0.25;
cam_angle = lerp(cam_angle, cam_langle, lspd);
cam_zoom = lerp(cam_zoom, cam_lzoom, lspd);
camera_set_view_angle(view_camera[0], cam_angle + camera_get_view_angle(view_camera[0]));
var vw = cam_w * cam_zoom;
var vh = cam_h * cam_zoom;
camera_set_view_size(view_camera[0], vw, vh);

if (instance_exists(obj_parent_player) && obj_parent_player.state != UnknownEnum.Value_27 && obj_parent_player.state != UnknownEnum.Value_49)
{
    var target = 
    {
        x: global.targetCamX,
        y: global.targetCamY
    };
    var _cam_x = target.x - (vw / 2);
    var _cam_y = target.y - (vh / 2);
    var shake_value_x = 0;
    var shake_value_y = 0;
    
    if (!global.freezeframe)
    {
        var _player = obj_parent_player;
        var _targetcharge = 0;
        var _tspeed = 6;
        
        if (_player.state == UnknownEnum.Value_64 || _player.state == UnknownEnum.Value_65 || _player.state == UnknownEnum.Value_145 || _player.state == UnknownEnum.Value_100)
        {
            _targetcharge = _player.xscale * ((_player.movespeed / 4) * 50);
            _tspeed = 0.3;
            
            if (sign(chargeCameraX) != _player.xscale || _player.state == UnknownEnum.Value_100)
                _tspeed = 3;
        }
        else if (abs(_player.hsp) >= 16 && _player.state != UnknownEnum.Value_12 && _player.state != UnknownEnum.Value_11 && _player.state != UnknownEnum.Value_58)
        {
            _targetcharge = sign(_player.hsp) * ((_player.movespeed / 4) * 50);
            _tspeed = 2;
            
            if (sign(chargeCameraX) != sign(_player.hsp) && sign(_player.hsp) != 0)
                _tspeed = 8;
        }
        else if (_player.state == UnknownEnum.Value_66)
        {
            _tspeed = 10;
        }
        
        chargeCameraX = approach(chargeCameraX, _targetcharge, _tspeed);
    }
    
    _cam_x += chargeCameraX;
    _cam_x = clamp(_cam_x, Camera_xorigin, Camera_width - vw);
    _cam_y = clamp(_cam_y, Camera_yorigin, Camera_height - vh);
    _cam_x = clamp(_cam_x, 0, room_width - vw);
    _cam_y = clamp(_cam_y, 0, room_height - vh);
    shake_value_x += (panicshake * random_range(-1, 1));
    shake_value_y += (panicshake * random_range(-1, 1));
    
    for (var i = 0; i < ds_list_size(cameraShakeList); i++)
    {
        with (ds_list_find_value(cameraShakeList, i))
        {
            if (shakeTime == 0 && !global.freezeframe)
                shakeMag = approach(shakeMag, 0, shakeDecel);
            
            shake_value_x += random_range(-shakeMag, shakeMag);
            shake_value_y += random_range(-shakeMag, shakeMag);
            
            if (shakeMag <= 0)
            {
                ds_list_set(other.cameraShakeList, i, undefined);
                ds_list_delete(other.cameraShakeList, i);
            }
            else if (shakeTime > 0)
            {
                shakeTime = approach(shakeTime, 0, 1);
            }
        }
    }
    
    Cam_x = _cam_x;
    Cam_y = _cam_y;
    camera_set_view_pos(view_camera[0], Cam_x + shake_value_x, Cam_y + shake_value_y);
}

if (obj_parent_player.y < (180 + obj_camera.Cam_y) && obj_parent_player.x < (350 + obj_camera.Cam_x))
    DrawY = lerp(DrawY, -300, 0.15);
else
    DrawY = lerp(DrawY, 0, 0.15);

pointCollectShake = approach(pointCollectShake, 0, 20 / room_speed);

if (global.Collect < global.crank)
{
    global.currentrank = "D";
}
else if (global.Collect < global.brank)
{
    global.currentrank = "C";
}
else if (global.Collect < global.arank)
{
    global.currentrank = "B";
}
else if (global.Collect < global.srank)
{
    global.currentrank = "A";
}
else if (global.Collect >= global.srank)
{
    if (!global.ComboLost && global.secretfound > 2 && global.lapcount >= 1 && global.Treasure)
        global.currentrank = "P";
    else
        global.currentrank = "S";
}

if (lastRank != global.currentrank)
{
    bubblescale = 1.5;
    lastRank = global.currentrank;
}

bubblescale = approach(bubblescale, 0, 0.1);
global.screenflash -= 1;
audio_listener_position(camera_get_view_x(view_camera[0]) + (cam_w / 2), camera_get_view_y(view_camera[0]) + (cam_h / 2), 0);

if (painterdex < sprite_get_number(spr_painterhp))
    painterdex += 0.35;
else
    painterdex = 0;

if (pizdex < sprite_get_number(spr_pizzellehp))
    pizdex += 0.35;
else
    pizdex = 0;

with (cakeHud)
{
    var c_threshold = floor(global.Combo / 5);
    var target_speed = clamp(c_threshold / sprite_get_number(spr_comboTitles), 0, 1);
    
    if (target_speed != image_speed && (animation_end() || image_speed <= 0))
    {
        image_speed = target_speed;
        image_index -= (image_number - 1);
    }
    
    image_index += image_speed;
}

switch (room)
{
    case rm_devroom:
        window_set_caption("Developer's party in the Sugary Spire");
        break;
    
    case hub_w1:
        window_set_caption("Inside of the fabled Sugary Spire");
        break;
    
    case hub_w2:
        window_set_caption("The alienated floor of the Sugary Spire");
        break;
    
    case entryway_1:
        window_set_caption("Construction underway at the Sugary Spire");
        break;
    
    case steamy_1:
        window_set_caption("Downtown Sugary Spire");
        break;
    
    case molasses_1:
        window_set_caption("Sugary Spire's natural habitat");
        break;
    
    case mines_1:
        window_set_caption("Hard at work underneath the Sugary Spire");
        break;
    
    case rm_titlecard:
        window_set_caption("Loading the Sugary Spire");
        break;
    
    case rm_poker:
        window_set_caption("Betting it all at the Sugary Spire");
        break;
    
    case rm_painterarena:
        window_set_caption("Artist's representation of the Sugary Spire");
        break;
    
    case estate_1:
        window_set_caption("Property of the Sugary Spire");
        break;
}
