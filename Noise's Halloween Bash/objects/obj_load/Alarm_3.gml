///@description Phase 4 (Map Generation)
if (array_length(maplist) > 0)
{
    loadedassets++;
    var _room = array_pop(maplist);
    trace(string("Phase 4: Generating Map for room {0}", room_get_name(_room)));
    var r = array_find_pos(global.levelrooms, _room);
    var _roominfo = room_get_info(_room, false, false, true, true, true);
    
    with (obj_levelmap)
    {
        vBuffMap[r] = vertex_create_buffer();
        vertex_begin(vBuffMap[r], global.vFormatMap);
        var _min = new Vec2(-1, -1);
        var _max = new Vec2(-1, -1);
        
        for (var i = 0; i < array_length(_roominfo.layers); i++)
        {
            for (var b = 0; b < array_length(_roominfo.layers[i].elements); b++)
            {
                var _element = _roominfo.layers[i].elements[b];
                
                if (_element.type != layerelementtype_tilemap || string_pos("MAP", _element.name) == 0)
                    continue;
                
                var _tilemw = _element.width;
                var _tilemh = _element.height;
                var _tileinfo = tileset_get_info(_element.background_index);
                var _tilew = _tileinfo.tile_width;
                var _tileh = _tileinfo.tile_height;
                
                for (var c = 0; c < array_length(_element.tiles); c++)
                {
                    var _tile = _element.tiles[c];
                    
                    if (tile_get_empty(_tile))
                        continue;
                    
                    var _x = (c % _tilemw) * _tilew;
                    var _y = floor(c / _tilemw) * _tileh;
                    _x += (roomoffset[r].x * _tilew);
                    _y += (roomoffset[r].y * _tileh);
                    var _tileid = _tile & 0x7FFFF;
                    var _tilexscale = (_tile & 0x10000000) ? -1 : 1;
                    var _tileyscale = (_tile & 0x20000000) ? -1 : 1;
                    
                    if (_min.x == -1 || _min.x > _x)
                        _min.x = _x;
                    
                    if (_min.y == -1 || _min.y > _y)
                        _min.y = _y;
                    
                    if (_max.x == -1 || _max.x < _x)
                        _max.x = _x + _tilew;
                    
                    if (_max.y == -1 || _max.y < _y)
                        _max.y = _y + _tileh;
                    
                    if (mapcorners[0].x == -1 || mapcorners[0].x > _x)
                        mapcorners[0].x = _x;
                    
                    if (mapcorners[0].y == -1 || mapcorners[0].y > _y)
                        mapcorners[0].y = _y;
                    
                    if (mapcorners[1].x == -1 || mapcorners[1].x < _x)
                        mapcorners[1].x = _x + _tilew;
                    
                    if (mapcorners[1].y == -1 || mapcorners[1].y < _y)
                        mapcorners[1].y = _y + _tileh;
                    
                    switch (_tileid)
                    {
                        case 21:
                        case 43:
                        case 87:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_yellow);
                            break;
                        
                        case 65:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + (_tileh * 2)), new Vec2(_x, _y + (_tileh * 2)), c_white);
                            map_create_face(vBuffMap[r], new Vec2(_x, _y + ((_tilexscale == -1) ? (_tileh * 1.5) : (_tileh / 2))), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? (_tileh / 2) : (_tileh * 1.5))), new Vec2(_x + _tilew, _y + (_tileh * 2)), new Vec2(_x, _y + (_tileh * 2)), c_yellow);
                        
                        case 22:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? 0 : _tileh)), new Vec2(_x, _y + ((_tilexscale == -1) ? _tileh : 0)), c_yellow);
                            break;
                        
                        case 67:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_white);
                            map_create_face(vBuffMap[r], new Vec2(_x, _y + ((_tilexscale == -1) ? _tileh : (_tileh / 2))), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? (_tileh / 2) : _tileh)), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_yellow);
                        
                        case 23:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? 0 : (_tileh / 2))), new Vec2(_x, _y + ((_tilexscale == -1) ? (_tileh / 2) : 0)), c_yellow);
                            break;
                        
                        case 68:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_white);
                        
                        case 24:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? (_tileh / 2) : _tileh)), new Vec2(_x, _y + ((_tilexscale == -1) ? _tileh : (_tileh / 2))), c_yellow);
                            break;
                        
                        case 88:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_white);
                            map_create_face(vBuffMap[r], new Vec2(_x, _y + ((_tilexscale == -1) ? (_tileh / 2) : 0)), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? 0 : (_tileh / 2))), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_yellow);
                            break;
                        
                        case 25:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? 0 : ceil(_tileh / 3))), new Vec2(_x, _y + ((_tilexscale == -1) ? ceil(_tileh / 3) : 0)), c_yellow);
                            break;
                        
                        case 26:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? ceil(_tileh / 3) : (ceil(_tileh / 3) * 2))), new Vec2(_x, _y + ((_tilexscale == -1) ? (ceil(_tileh / 3) * 2) : ceil(_tileh / 3))), c_yellow);
                            break;
                        
                        case 27:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? (ceil(_tileh / 3) * 2) : _tileh)), new Vec2(_x, _y + ((_tilexscale == -1) ? _tileh : (ceil(_tileh / 3) * 2))), c_yellow);
                            break;
                        
                        case 41:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? 0 : (ceil(_tileh / 3) * 2))), new Vec2(_x, _y + ((_tilexscale == -1) ? (ceil(_tileh / 3) * 2) : 0)), c_yellow);
                            break;
                        
                        case 42:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? (ceil(_tileh / 3) * 2) : ceil(_tileh * 1.333))), new Vec2(_x, _y + ((_tilexscale == -1) ? ceil(_tileh * 1.333) : (ceil(_tileh / 3) * 2))), c_yellow);
                            break;
                        
                        case 63:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + ((_tilexscale == -1) ? ceil(_tileh / 3) : _tileh)), new Vec2(_x, _y + ((_tilexscale == -1) ? _tileh : ceil(_tileh / 3))), c_yellow);
                            break;
                        
                        case 64:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_white);
                            map_create_face(vBuffMap[r], new Vec2(_x, _y + ((_tileyscale == 1) ? (_tileh / 2) : _tileh)), new Vec2(_x + _tilew, _y + ((_tileyscale == 1) ? (_tileh / 2) : _tileh)), new Vec2(_x + _tilew, _y + ((_tileyscale == 1) ? _tileh : 0)), new Vec2(_x, _y + ((_tileyscale == 1) ? _tileh : 0)), c_yellow);
                            break;
                        
                        case 66:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_white);
                            map_create_face(vBuffMap[r], new Vec2(_x + ((_tilexscale == 1) ? 0 : (_tilew / 2)), _y), new Vec2(_x + ((_tilexscale == 1) ? (_tilew / 2) : _tilew), _y), new Vec2(_x + ((_tilexscale == 1) ? (_tilew / 2) : _tilew), _y + _tileh), new Vec2(_x + ((_tilexscale == 1) ? 0 : (_tilew / 2)), _y + _tileh), c_yellow);
                            break;
                        
                        case 69:
                            map_create_face(vBuffMap[r], new Vec2(_x, _y), new Vec2(_x + _tilew, _y), new Vec2(_x + _tilew, _y + _tileh), new Vec2(_x, _y + _tileh), c_white);
                            map_create_face(vBuffMap[r], new Vec2(_x + ((_tilexscale == 1) ? 0 : _tilew), _y + (_tileh / 2)), new Vec2(_x + (_tilew / 2), _y + (_tileh / 2)), new Vec2(_x + (_tilew / 2), _y + ((_tileyscale == 1) ? _tileh : 0)), new Vec2(_x + ((_tilexscale == 1) ? 0 : _tilew), _y + ((_tileyscale == 1) ? _tileh : 0)), c_yellow);
                            break;
                    }
                }
            }
        }
        
        roomcorners[r] = [_min, _max];
        vertex_end(vBuffMap[r]);
        vertex_freeze(vBuffMap[r]);
    }
    
    alarm[3] = 1;
}
else
{
    trace("Loading: Phase 4 Finished");
    alarm[4] = 10;
}
