with (obj_levelmap)
{
    event_user(0);
    
    if (!in_saveroom("maptip", global.saveroom))
        instance_create_depth(0, 0, 0, obj_maptip);
    
    outhoused = true;
    zoom = 0.1;
    var _room = array_find_pos(global.levelrooms, room);
    var _gw = get_game_width();
    var _gh = get_game_height();
    var _width = mapcorners[1].x - mapcorners[0].x;
    var _height = mapcorners[1].y - mapcorners[0].y;
    var _xoff = (_width / 2) + mapcorners[0].x;
    var _yoff = (_height / 2) + mapcorners[0].y;
    panx = (other.x + 32 + (roomoffset[_room].x * 32)) - ((_width / 2) + mapcorners[0].x);
    pany = ((other.y - 32) + 31 + (roomoffset[_room].y * 32)) - ((_height / 2) + mapcorners[0].y);
    panx *= 2;
    pany *= 2;
}

alarm[0] = -1;
