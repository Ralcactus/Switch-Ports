///@description Phase 3 (3D Tile Generation)
var _platdepth = 48;

if (array_length(threedeeslist) > 0)
{
    loadedassets++;
    var _room = array_pop(threedeeslist);
    trace(string("Phase 3: Generating 3D Tiles for room {0}", room_get_name(_room)));
    var r = array_find_pos(global.levelrooms, _room);
    var _roominfo = room_get_info(_room, false, false, true, true, true);
    _roominfo.layers = array_reverse(_roominfo.layers);
    
    with (obj_drawcontroller)
    {
        vBuffTiles[r] = vertex_create_buffer();
        vertex_begin(vBuffTiles[r], global.vFormat);
        
        for (var i = 0; i < array_length(_roominfo.layers); i++)
        {
            var _layer = _roominfo.layers[i];
            
            if (!_layer.visible)
                continue;
            
            for (var b = 0; b < array_length(_layer.elements); b++)
            {
                var _element = _layer.elements[b];
                
                if (_element.type != layerelementtype_tilemap)
                    continue;
                
                if (roomTileset[r] == -1)
                    roomTileset[r] = _element.background_index;
                else if (roomTileset[r] != _element.background_index)
                    trace(string("Mixed up tileset in room {0}!", room_get_name(room)));
                
                var _tilemw = _element.width;
                var _tilemh = _element.height;
                var _tilemdepth = _layer.depth;
                var _tileinfo = tileset_get_info(roomTileset[r]);
                var _tilew = _tileinfo.tile_width;
                var _tileh = _tileinfo.tile_height;
                var _suffix = "";
                
                switch (_element.background_index)
                {
                    case tileset_death:
                        _suffix = "_death";
                }
                
                for (var c = 0; c < array_length(_element.tiles); c++)
                {
                    var _tile = _element.tiles[c];
                    
                    if (tile_get_empty(_tile))
                        continue;
                    
                    var _tileid = _tile & 0x7FFFF;
                    var _x = (c % _tilemw) * _tilew;
                    var _y = floor(c / _tilemw) * _tileh;
                    var _tilexscale = (_tile & 0x10000000) ? -1 : 1;
                    var _tileyscale = (_tile & 0x20000000) ? -1 : 1;
                    var _reverse = (_tilexscale == -1) ^^ (_tileyscale == -1);
                    vertex_create_face_tile(vBuffTiles[r], _x, _y, _tilemdepth, _tilew, _tileh, _tileinfo.tile_horizontal_separator, _tileinfo.tile_vertical_separator, _tilexscale, _tileyscale, _element.background_index, _tileid, _reverse);
                    
                    switch (_tileid)
                    {
                        case 34:
                        case 35:
                        case 36:
                        case 37:
                        case 38:
                        case 39:
                        case 40:
                        case 41:
                        case 206:
                        case 207:
                        case 337:
                        case 338:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), false, true);
                            break;
                        
                        case 33:
                        case 307:
                        case 739:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_main_top1{0}", _suffix)), false, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x, _y, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side1{0}", _suffix)));
                            break;
                        
                        case 42:
                        case 304:
                        case 736:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_main_top3{0}", _suffix)), false, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side1{0}", _suffix)), true);
                            break;
                        
                        case 110:
                        case 111:
                        case 258:
                        case 259:
                        case 260:
                        case 261:
                        case 262:
                        case 263:
                        case 264:
                        case 265:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_bottom2{0}", _suffix)), true);
                            break;
                        
                        case 257:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_bottom1{0}", _suffix)), true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x, _y, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side3{0}", _suffix)));
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + _tileh, _tilemdepth + 64), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + (_tileh * 2), _tilemdepth), new Vec3(_x, _y + (_tileh * 2), _tilemdepth + 64), asset_get_index(string("tex_tilesize_main_hang{0}", _suffix)));
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + _tileh, _tilemdepth + 64), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + (_tileh * 2), _tilemdepth), new Vec3(_x, _y + (_tileh * 2), _tilemdepth + 64), asset_get_index(string("tex_tilesize_main_hang{0}", _suffix)), true);
                            break;
                        
                        case 266:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_bottom3{0}", _suffix)), true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side3{0}", _suffix)), true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + (_tileh * 2), _tilemdepth), new Vec3(_x + _tilew, _y + (_tileh * 2), _tilemdepth + 64), asset_get_index(string("tex_tilesize_main_hang{0}", _suffix)), true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + (_tileh * 2), _tilemdepth), new Vec3(_x + _tilew, _y + (_tileh * 2), _tilemdepth + 64), asset_get_index(string("tex_tilesize_main_hang{0}", _suffix)));
                            break;
                        
                        case 65:
                        case 97:
                        case 129:
                        case 161:
                        case 193:
                        case 225:
                        case 641:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x, _y, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side2{0}", _suffix)));
                            break;
                        
                        case 497:
                        case 496:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == 1)), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == 1)), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == 1)), _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == 1)), _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_slop_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 144:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x, _y, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side1{0}", _suffix)));
                            break;
                        
                        case 176:
                        case 743:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x, _y, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side3{0}", _suffix)));
                            break;
                        
                        case 74:
                        case 106:
                        case 138:
                        case 170:
                        case 202:
                        case 234:
                        case 650:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side2{0}", _suffix)), true);
                            break;
                        
                        case 141:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side1{0}", _suffix)), true);
                            break;
                        
                        case 173:
                        case 740:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_main_side3{0}", _suffix)), true);
                            break;
                        
                        case 54:
                        case 85:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 59:
                        case 89:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 60:
                        case 90:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2), _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 245:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 246:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 214:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 215:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 218:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 219:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 220:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth), asset_get_index(string("tex_tileside_main_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 610:
                        case 611:
                        case 612:
                        case 613:
                        case 614:
                        case 615:
                        case 616:
                        case 617:
                        case 769:
                        case 770:
                        case 773:
                        case 774:
                        case 901:
                        case 902:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), false, true);
                            break;
                        
                        case 900:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_slop_top1{0}", _suffix)), false, true);
                            break;
                        
                        case 903:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_slop_top3{0}", _suffix)), false, true);
                            break;
                        
                        case 609:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), false, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x, _y, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth), new Vec3(_x, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_slop_side{0}", _suffix)));
                            break;
                        
                        case 618:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x, _y, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), false, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew, _y, _tilemdepth + 64), new Vec3(_x + _tilew, _y, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth), new Vec3(_x + _tilew, _y + _tileh, _tilemdepth + 64), asset_get_index(string("tex_tileside_slop_side{0}", _suffix)), true);
                            break;
                        
                        case 526:
                        case 559:
                        case 621:
                        case 652:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 530:
                        case 531:
                        case 626:
                        case 656:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 627:
                        case 657:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2), _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 812:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 813:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 781:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 782:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 785:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 786:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 787:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth), asset_get_index(string("tex_tileside_slop_top2{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 354:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x - 2, _y + (_tileh * (_tileyscale == -1)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + (_tileh * (_tileyscale == -1)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + (_tileh * (_tileyscale == -1)), _tilemdepth), new Vec3(_x - 2, _y + (_tileh * (_tileyscale == -1)), _tilemdepth), asset_get_index(string("tex_tileside_platform_top1{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x - 2, _y + ((_tileyscale == 1) ? 0 : _tileh), _tilemdepth + _platdepth), new Vec3(_x - 2, _y + ((_tileyscale == 1) ? 0 : _tileh), _tilemdepth), new Vec3(_x - 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), new Vec3(_x - 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)));
                            vertex_create_face(vBuffTiles[r], new Vec3(_x - 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), new Vec3(_x - 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 355:
                        case 356:
                        case 357:
                        case 358:
                        case 359:
                        case 360:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + (_tileh * (_tileyscale == -1)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + (_tileh * (_tileyscale == -1)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + (_tileh * (_tileyscale == -1)), _tilemdepth), new Vec3(_x, _y + (_tileh * (_tileyscale == -1)), _tilemdepth), asset_get_index(string("tex_tileside_platform_top{0}{1}", (_tileid - 355) + 2, _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), new Vec3(_x + _tilew, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), new Vec3(_x, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 361:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + (_tileh * (_tileyscale == -1)), _tilemdepth + _platdepth), new Vec3(_x + _tilew + 2, _y + (_tileh * (_tileyscale == -1)), _tilemdepth + _platdepth), new Vec3(_x + _tilew + 2, _y + (_tileh * (_tileyscale == -1)), _tilemdepth), new Vec3(_x, _y + (_tileh * (_tileyscale == -1)), _tilemdepth), asset_get_index(string("tex_tileside_platform_top8{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + _tilew + 2, _y + ((_tileyscale == 1) ? 0 : _tileh), _tilemdepth + _platdepth), new Vec3(_x + _tilew + 2, _y + ((_tileyscale == 1) ? 0 : _tileh), _tilemdepth), new Vec3(_x + _tilew + 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), new Vec3(_x + _tilew + 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), new Vec3(_x + _tilew + 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth + _platdepth), new Vec3(_x + _tilew + 2, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), new Vec3(_x, _y + ((_tileyscale == 1) ? 14 : (_tileh - 14)), _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 470:
                        case 501:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 505:
                        case 475:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2), _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2) + 14, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (_tileh / 2) + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 506:
                        case 476:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2), _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2), _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2) + 14, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (_tileh / 2) + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 661:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3) + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 662:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3) + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 630:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + ((_tilew / 2) * _tilexscale), _y + _tileh + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 631:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 634:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh, _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + _tileh + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 635:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3), _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2), _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + ceil(_tileh / 3) + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + (ceil(_tileh / 3) * 2) + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 636:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3), _tilemdepth), asset_get_index(string("tex_tileside_slopeplatform_top{0}", _suffix)), _reverse, true);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3) + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth + 64), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilew * _tilexscale), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + ceil(_tileh / 3) + 14, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 532:
                        case 536:
                        case 665:
                        case 692:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == 1)), _y + 0, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == 1)), _y + 0, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == 1)), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == 1)), _y + 14, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), _reverse);
                            break;
                        
                        case 471:
                        case 477:
                        case 632:
                        case 637:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + 0, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + 0, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + 14, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)), _y + 14, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 364:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y - 2, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y - 2, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_oneway_side2{0}", _suffix)), _reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y - 2, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y - 2, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + ((_tilexscale == 1) ? 0 : _tilew), _y - 2, _tilemdepth + _platdepth), new Vec3(_x + ((_tilexscale == 1) ? 14 : (_tilew - 14)), _y - 2, _tilemdepth + _platdepth), new Vec3(_x + ((_tilexscale == 1) ? 14 : (_tilew - 14)), _y - 2, _tilemdepth), new Vec3(_x + ((_tilexscale == 1) ? 0 : _tilew), _y - 2, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), _reverse, true);
                            break;
                        
                        case 396:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_oneway_side2{0}", _suffix)), _reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 428:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_oneway_side3{0}", _suffix)), _reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 460:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_oneway_side4{0}", _suffix)), _reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                        
                        case 492:
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh + 2, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + _tilexscale, _y + _tileh + 2, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_oneway_side5{0}", _suffix)), _reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth + _platdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh + 2, _tilemdepth), new Vec3(_x + (_tilew * (_tilexscale == -1)) + (_tilexscale * 14), _y + _tileh + 2, _tilemdepth + _platdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            vertex_create_face(vBuffTiles[r], new Vec3(_x + ((_tilexscale == 1) ? 0 : _tilew), _y + _tileh + 2, _tilemdepth + _platdepth), new Vec3(_x + ((_tilexscale == 1) ? 14 : (_tilew - 14)), _y + _tileh + 2, _tilemdepth + _platdepth), new Vec3(_x + ((_tilexscale == 1) ? 14 : (_tilew - 14)), _y + _tileh + 2, _tilemdepth), new Vec3(_x + ((_tilexscale == 1) ? 0 : _tilew), _y + _tileh + 2, _tilemdepth), asset_get_index(string("tex_tileside_platform_side{0}", _suffix)), !_reverse);
                            break;
                    }
                }
            }
        }
        
        vertex_end(vBuffTiles[r]);
        vertex_freeze(vBuffTiles[r]);
    }
    
    alarm[2] = 1;
}
else
{
    trace("Loading: Phase 3 Finished");
    trace("Loading: Begin Phase 4 (Map Generation)");
    alarm[3] = 1;
}
