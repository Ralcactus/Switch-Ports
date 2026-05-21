/// @description Control state of the gate.
// State changes must be induced externally.
var _values; _values[0] = false;
var i = 0;
// Input
with (par_logicobjects)
{
    if (outputID == other.gateID)
        _values[i++] = logicOutput;
}
// Process.
var _check = false;
for (i = 0; i < array_length(_values); i++)
{
    if (_values[i])
    {
        _check = true;
        break;
    }
}

if (_check)// Powered
{
    if (!reversed)
        queuedEvent = GateEvent.RAISE;
    else
        queuedEvent = GateEvent.LOWER;
}
// Unpowered
else if (!reversed)
    queuedEvent = GateEvent.LOWER;
else
    queuedEvent = GateEvent.RAISE;

// If an event is queued and we are ready for that event, begin the event.
// If the event is irrelevant (i.e. raising a gate that is already open), discard the event.
if ((currentState == GateState.LOWERED || currentState == GateState.RAISED) && queuedEvent != GateEvent.NONE)
{
    if (queuedEvent == GateEvent.RAISE && currentState != GateState.RAISED)
    {
        currentState = GateState.RAISING;
        nextState = GateState.RAISED;
        sprite_index = spr_gateRaising;
    }
    else if (queuedEvent == GateEvent.LOWER && currentState != GateState.LOWERED)
    {
        currentState = GateState.LOWERING;
        nextState = GateState.LOWERED;
        sprite_index = spr_gateLowering;
    }
    
    queuedEvent = GateEvent.NONE;
}

if (currentState == GateState.LOWERED)
{
	// Failsafe to ensure player doesn't get stuck on a gate that lowered on top of them.
	// If this happens - push a player out to the left/right side of the gate.
	// May behave oddly if space to the left/right of gate isn't clear.	
    with (obj_player)
    {
        if (state != states.noclip)
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
    
    with (obj_baddie)
    {
        if (state != baddiestate.grabbed)
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
