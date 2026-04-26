var _values;
_values[0] = false;
var i = 0;

with (obj_parent_logicobjects)
{
    if (outputID == other.gateID)
        _values[i++] = logicOutput;
}

var _check = false;

for (i = 0; i < array_length(_values); i++)
{
    if (_values[i])
    {
        _check = true;
        break;
    }
}

if (_check)
{
    if (reversed)
        queuedEvent = UnknownEnum.Value_1;
    else
        queuedEvent = UnknownEnum.Value_2;
}
else if (reversed)
{
    queuedEvent = UnknownEnum.Value_2;
}
else
{
    queuedEvent = UnknownEnum.Value_1;
}

if ((currentState == UnknownEnum.Value_1 || currentState == UnknownEnum.Value_0) && queuedEvent != UnknownEnum.Value_0)
{
    if (queuedEvent == UnknownEnum.Value_2 && currentState != UnknownEnum.Value_0)
    {
        currentState = UnknownEnum.Value_2;
        nextState = UnknownEnum.Value_0;
        sprite_index = spr_gateRaising;
    }
    else if (queuedEvent == UnknownEnum.Value_1 && currentState != UnknownEnum.Value_1)
    {
        currentState = UnknownEnum.Value_3;
        nextState = UnknownEnum.Value_1;
        sprite_index = spr_gateLowering;
    }
    
    queuedEvent = UnknownEnum.Value_0;
}

if (currentState == UnknownEnum.Value_1)
{
    with (obj_parent_player)
    {
        if (state != UnknownEnum.Value_134)
        {
            if (place_meeting(x, y, other))
            {
                if ((other.image_angle % 180) != 0)
                {
                    var will_godown = distance_to_point(x, other.bbox_bottom) <= distance_to_point(x, other.bbox_top);
                    var try_count = 0;
                    
                    while (try_count < 2)
                    {
                        var _targetY1 = other.bbox_bottom + (bbox_top - y) + 1;
                        var _targetY2 = other.bbox_top - (y - bbox_bottom) - 1;
                        var _targetY = will_godown ? _targetY1 : _targetY2;
                        
                        if (!scr_solid(x, _targetY))
                        {
                            y = _targetY;
                            break;
                        }
                        else
                        {
                            will_godown = !will_godown;
                            try_count++;
                        }
                    }
                }
                else
                {
                    var will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y);
                    var try_count = 0;
                    
                    while (try_count < 2)
                    {
                        var _targetX1 = other.bbox_left - (bbox_right - x) - 1;
                        var _targetX2 = other.bbox_right + (x - bbox_left) + 1;
                        var _targetX = will_goleft ? _targetX1 : _targetX2;
                        
                        if (!scr_solid(_targetX, y))
                        {
                            x = _targetX;
                            break;
                        }
                        else
                        {
                            will_goleft = !will_goleft;
                            try_count++;
                        }
                    }
                }
            }
        }
    }
    
    with (obj_parent_baddie)
    {
        if (state != UnknownEnum.Value_7)
        {
            if (place_meeting(x, y, other))
            {
                if ((other.image_angle % 180) != 0)
                {
                    var will_godown = distance_to_point(x, other.bbox_bottom) <= distance_to_point(x, other.bbox_top);
                    var try_count = 0;
                    
                    while (try_count < 2)
                    {
                        var _targetY1 = other.bbox_bottom - (bbox_top - y) - 1;
                        var _targetY2 = other.bbox_top + (y - bbox_bottom) + 1;
                        var _targetY = will_godown ? _targetY1 : _targetY2;
                        
                        if (!scr_solid(x, _targetY))
                        {
                            y = _targetY;
                            break;
                        }
                        else
                        {
                            will_godown = !will_godown;
                            try_count++;
                        }
                    }
                }
                else
                {
                    var will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y);
                    var try_count = 0;
                    
                    while (try_count < 2)
                    {
                        var _targetX1 = other.bbox_left - (bbox_right - x) - 1;
                        var _targetX2 = other.bbox_right + (x - bbox_left) + 1;
                        var _targetX = will_goleft ? _targetX1 : _targetX2;
                        
                        if (!scr_solid(_targetX, y))
                        {
                            x = _targetX;
                            break;
                        }
                        else
                        {
                            will_goleft = !will_goleft;
                            try_count++;
                        }
                    }
                }
            }
        }
    }
}
