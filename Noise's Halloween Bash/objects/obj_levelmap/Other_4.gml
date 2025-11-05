if (instance_exists(obj_nitrodetonatorcutscene))
    exit;

var _roomind = array_find_pos(global.levelrooms, room);

if (_roomind >= (array_length(global.levelrooms) - 4))
    _roomind = -1;

if (_roomind != -1)
{
    if (!visitedrooms[_roomind])
    {
        with (instance_create_depth(x, y, depth + 4, obj_roomdiscoveredtext))
            text = array_get(string_get("roomnames"), _roomind);
    }
    
    visitedrooms[_roomind] = true;
}
