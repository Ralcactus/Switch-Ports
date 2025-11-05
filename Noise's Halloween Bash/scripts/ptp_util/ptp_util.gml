function array_get_undefined(_var, _index)
{
    try
        return array_get(_var, _index);
    catch (_ex)
        return undefined;
}

function roundlower(_val)
{
    if (frac(_val) <= 0.5)
        return floor(_val);
    
    if (frac(_val) > 0.5)
        return ceil(_val);
}

function array_find_pos(_array, _entry)
{
    for (var i = 0; i < array_length(_array); i++)
    {
        if (_array[i] == _entry)
            return i;
    }
    
    return -1;
}

function object_is_parent_or_ancestor(_parent, _obj = object_index)
{
    return _obj == _parent || object_is_ancestor(_obj, _parent);
}

function check_in_rect(_obj, _x1, _x2, _y1, _y2)
{
    return point_in_rectangle(_obj.x, _obj.y, _x1, _y1, _x2, _y2);
}

function string_padzeros(_string, _as_prefix = true, _pad_amount = 2)
{
    var _str = "";
    
    repeat (_pad_amount - string_length(string(_string)))
        _str += "0";
    
    if (_as_prefix) return _str + string(_string);
    if (!_as_prefix) return string(_string) + _str;
}

function struct_equals(_structA, _structB)
{
    var _varA = variable_struct_get_names(_structA);
    var _varB = variable_struct_get_names(_structB);
    
    if (array_length(_varA) != array_length(_varB))
        return false;
    
    for (var i = 0; i < array_length(_varA); i++)
    {
        if (!variable_struct_exists(_structB, _varA[i]) || !variable_struct_exists(_structA, _varB[i]))
            return false;
        
        var _n = _varA[i];
        var _valtype = typeof(variable_struct_get(_structA, _n));
        
        if (typeof(variable_struct_get(_structB, _n)) != _valtype)
            return false;
        
        switch (_valtype)
        {
            case "struct":
                if (!struct_equals(variable_struct_get(_structA, _n), variable_struct_get(_structB, _n)))
                    return false;
                
                break;
            
            case "array":
                if (!array_equals(variable_struct_get(_structA, _n), variable_struct_get(_structB, _n)))
                    return false;
                
                break;
            
            default:
                if (variable_struct_get(_structA, _n) != variable_struct_get(_structB, _n))
                    return false;
        }
    }
    
    return true;
}

function sprite_animation_end(_sprite = sprite_index, _index = image_index, _total_frames = sprite_get_number(_sprite), _speed = image_speed)
{
    return (_index + ((_speed * sprite_get_speed(_sprite)) / ((sprite_get_speed_type(_sprite) == 1) ? 1 : game_get_speed(gamespeed_fps)))) >= _total_frames;
}

function count_in_room(_room, _func)
{
    if (is_array(_room))
    {
        var _count = 0;
        
        for (var i = 0; i < array_length(_room); i++)
            _count += count_in_room(_room[i], _func);
        
        return _count;
    }
    else
    {
        var _info = room_get_info(_room, false, true, false, false, false);
        return array_length(array_filter(_info.instances, _func));
    }
}

function loop_in_room(_room, _func)
{
    if (is_array(_room))
    {
        for (var i = 0; i < array_length(_room); i++)
            loop_in_room(_room[i], _func);
    }
    else
    {
        var _info = room_get_info(_room, false, true, false, false, false);
        array_foreach(_info.instances, _func);
    }
}

function running_on_steamdeck()
{
    return environment_get_variable("SteamDeck") == "1";
}

function hexstr_to_col(_colstr)
{
    if (string_char_at(_colstr, 0) == "#")
        _colstr = string_copy(_colstr, 2, string_length(_colstr) - 1);
    
    _colstr = string_upper(_colstr);
    _colstr = string_copy(_colstr, 5, 2) + string_copy(_colstr, 3, 2) + string_copy(_colstr, 1, 2);
    var _hex = "0123456789ABCDEF";
    var _colour = #000000;
    
    for (var i = 1; i < (string_length(_colstr) + 1); i++)
        _colour = (_colour << 4) + (string_pos(string_char_at(_colstr, i), _hex) - 1);
    
    return _colour;
}

function surface_fallback(_surf_format)
{
    if (!surface_format_is_supported(_surf_format))
    {
        trace("Platform does not support format ", _surf_format, "! Falling back to standard surface format...");
        return surface_rgba8unorm;
    }
    
    return _surf_format;
}

function game_paused()
{
    return global.gamePaused || global.mapOpen || global.noControlType;
}

function add_saveroom(_obj = id, _room = global.saveroom)
{
    ds_map_add(_room, _obj, true);
}

function in_saveroom(_obj = id, _room = global.saveroom)
{
    return ds_map_exists(_room, _obj);
}
