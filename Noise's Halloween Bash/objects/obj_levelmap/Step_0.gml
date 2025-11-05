if (global.gamePaused)
    exit;

switch (room)
{
    case Patch1:
        canswap = false;
        layera = false;
        roomorder = [0, 1, 2, 3, 4, 5, 6, 7];
        roomgreyout[0] = false;
        roomgreyout[1] = false;
        roomgreyout[2] = false;
        roomgreyout[3] = true;
        roomgreyout[4] = true;
        roomgreyout[5] = true;
        roomgreyout[6] = true;
        roomgreyout[7] = true;
        break;
    
    case Patch2A:
    case Patch3A:
    case Patch4A:
        canswap = true;
        layera = true;
        
        if (!swaplayer)
        {
            roomorder = [0, 2, 4, 6, 1, 3, 5, 7];
            roomgreyout[0] = false;
            roomgreyout[1] = false;
            roomgreyout[2] = true;
            roomgreyout[3] = false;
            roomgreyout[4] = true;
            roomgreyout[5] = false;
            roomgreyout[6] = true;
            roomgreyout[7] = false;
        }
        else
        {
            roomorder = [0, 1, 3, 5, 2, 4, 6, 7];
            roomgreyout[0] = false;
            roomgreyout[1] = true;
            roomgreyout[2] = false;
            roomgreyout[3] = true;
            roomgreyout[4] = false;
            roomgreyout[5] = true;
            roomgreyout[6] = false;
            roomgreyout[7] = false;
        }
        
        break;
    
    case Patch2B:
    case Patch3B:
    case Patch4B:
        canswap = true;
        layera = false;
        
        if (!swaplayer)
        {
            roomorder = [0, 1, 3, 5, 2, 4, 6, 7];
            roomgreyout[0] = false;
            roomgreyout[1] = true;
            roomgreyout[2] = false;
            roomgreyout[3] = true;
            roomgreyout[4] = false;
            roomgreyout[5] = true;
            roomgreyout[6] = false;
            roomgreyout[7] = false;
        }
        else
        {
            roomorder = [0, 2, 4, 6, 1, 3, 5, 7];
            roomgreyout[0] = false;
            roomgreyout[1] = false;
            roomgreyout[2] = true;
            roomgreyout[3] = false;
            roomgreyout[4] = true;
            roomgreyout[5] = false;
            roomgreyout[6] = true;
            roomgreyout[7] = false;
        }
        
        break;
    
    case Patch5:
        canswap = false;
        layera = false;
        roomorder = [0, 1, 2, 3, 4, 5, 6, 7];
        roomgreyout[0] = true;
        roomgreyout[1] = true;
        roomgreyout[2] = true;
        roomgreyout[3] = true;
        roomgreyout[4] = true;
        roomgreyout[5] = false;
        roomgreyout[6] = false;
        roomgreyout[7] = false;
        break;
}

if ((input_check_pressed("map") || (global.mapOpen && input_check_pressed("pause"))) && can_pause())
    event_user(0);

fmod_studio_system_set_parameter_by_name("mapmuffle", global.mapOpen, false);

if (global.mapOpen)
{
    openanim = min(openanim + 0.03, 1);
    closeanim = 0;
}

if (!global.mapOpen && openanim > 0)
{
    closeanim = min(closeanim + 0.03, 1);
    
    if (closeanim >= 1)
    {
        openanim = 0;
        closeanim = 0;
        swaplayer = false;
    }
}

outhouse_queue = [];
var _width = mapcorners[1].x - mapcorners[0].x;
var _height = mapcorners[1].y - mapcorners[0].y;
var _gw = get_game_width();
var _gh = get_game_height();
var _scale = min(_gw / _width, _gh / _height) * 0.9;
_scale = tween(_scale, 1, zoom, EASE_IN_SINE);

if (global.mapOpen)
{
    var _roomind = array_find_pos(global.levelrooms, playerroom);
    
    if (_roomind >= (array_length(global.levelrooms) - 4))
        _roomind = -1;
    
    if (_roomind != -1 && !in_debug_menu())
    {
        var _prevzoom = zoom;
        zoom = clamp(zoom + ((input_value("zoomin") - input_value("zoomout")) * 0.005), 0, 1);
        _scale = min(_gw / _width, _gh / _height) * 0.9;
        _scale = tween(_scale, 1, zoom, EASE_IN_SINE);
        
        if (zoom != _prevzoom)
        {
            zoomclicktimer++;
            
            if (zoomclicktimer > 2)
            {
                zoomclicktimer = 0;
                zoompitch += ((zoom > _prevzoom) ? 0.05 : -0.05);
                fmod_studio_event_instance_start(zoomclick);
                fmod_studio_event_instance_set_parameter_by_name(zoomclick, "state", zoompitch);
            }
        }
        else
        {
            zoomclicktimer = 0;
            zoompitch = 5;
        }
        
        var _zoommul = 32 / _scale / 32;
        var _pandir = input_direction(undefined, "left", "right", "up", "down");
        
        if (!is_undefined(_pandir))
        {
            panx += lengthdir_x((6 + (input_check("dash") * 4)) * _zoommul, _pandir);
            pany += lengthdir_y((6 + (input_check("dash") * 4)) * _zoommul, _pandir);
        }
        
        panx = clamp(panx, -_width, _width);
        pany = clamp(pany, -_height, _height);
        
        if (is_undefined(_pandir) && outhoused)
        {
            var _foundouthouse = false;
            var _prevouthouse = array_get_undefined(roominfo_outhouses, outhouse);
            var _xoff = (((_width + panx) / 2) + mapcorners[0].x) * _scale;
            var _yoff = (((_height + pany) / 2) + mapcorners[0].y) * _scale;
            
            for (var b = 0; b < array_length(roominfo_outhouses); b++)
            {
                var _outhouseinfo = roominfo_outhouses[b];
                var _outhouseroom = array_find_pos(global.levelrooms, _outhouseinfo.room);
                var _roomx = (_outhouseinfo.x + 32 + (roomoffset[_outhouseroom].x * 32)) * _scale;
                var _roomy = ((_outhouseinfo.y - 32) + 31 + (roomoffset[_outhouseroom].y * 32)) * _scale;
                var _outhousex = ((_gw / 2) - _xoff) + _roomx;
                var _outhousey = ((_gh / 2) - _yoff) + _roomy;
                
                if (point_distance(_gw / 2, _gh / 2, _outhousex, _outhousey) < 24)
                {
                    _foundouthouse = true;
                    outhouse = b;
                    
                    if (is_undefined(_prevouthouse) || _outhouseinfo.id != _prevouthouse.id)
                        event_play_oneshot("event:/sfx/misc/mapclick");
                    
                    panx += ((_outhousex - (_gw / 2)) * _zoommul * 0.25);
                    pany += ((_outhousey - (_gh / 2)) * _zoommul * 0.25);
                    break;
                }
            }
            
            if (!_foundouthouse)
                outhouse = -1;
        }
        else
            outhouse = -1;
        
        if (outhoused && outhouse != -1)
        {
            if (input_check("inv"))
            {
                invcharge++;
                
                if (invcharge > 30)
                {
                    global.mapOpen = false;
                    openanim = 0;
                    closeanim = 0;
                    swaplayer = false;
                    invcharge = 0;
                    fmod_studio_bus_set_paused(fmod_studio_system_get_bus("bus:/SFX/Pausable"), global.mapOpen);
                    
                    with (obj_player)
                    {
                        if (!(other.roominfo_outhouses[other.outhouse].room == room && place_meeting(x, y, other.roominfo_outhouses[other.outhouse].id)))
                        {
                            targetroom = other.roominfo_outhouses[other.outhouse].room;
                            targetdoor = -1;
                            targetouthouse = other.roominfo_outhouses[other.outhouse].id;
                            instance_create_depth(0, 0, 0, obj_outhousetransition);
                        }
                        else
                            instance_place(x, y, obj_outhouse).alarm[1] = 20;
                    }
                }
            }
            else
            {
                if (canswap && invcharge > 0)
                {
                    swaplayer = !swaplayer;
                    event_play_oneshot("event:/sfx/misc/mapswaplayer");
                }
                
                invcharge = 0;
            }
        }
        else if (input_check_pressed("inv") && canswap)
        {
            swaplayer = !swaplayer;
            event_play_oneshot("event:/sfx/misc/mapswaplayer");
        }
    }
    
    patternscroll = (patternscroll + 0.25) % sprite_get_width(spr_maprepeats);
}

if ((openanim + closeanim) > 0)
{
    var _xoff = (((_width + panx) / 2) + mapcorners[0].x) * _scale;
    var _yoff = (((_height + pany) / 2) + mapcorners[0].y) * _scale;
    
    for (var b = 0; b < array_length(roominfo_outhouses); b++)
    {
        _scale = min(_gw / _width, _gh / _height) * 0.9;
        _scale = tween(_scale, 1, zoom, EASE_IN_SINE);
        var _outhouseinfo = roominfo_outhouses[b];
        var _outhouseroom = array_find_pos(global.levelrooms, _outhouseinfo.room);
        var _roomx = (_outhouseinfo.x + 32 + (roomoffset[_outhouseroom].x * 32)) * _scale;
        var _roomy = (_outhouseinfo.y + (roomoffset[_outhouseroom].y * 32)) * _scale;
        array_push(outhouse_queue, 
        {
            id: roominfo_outhouses[b].id,
            x: ((_gw / 2) - _xoff) + _roomx,
            y: ((_gh / 2) - _yoff) + _roomy
        });
    }
}
