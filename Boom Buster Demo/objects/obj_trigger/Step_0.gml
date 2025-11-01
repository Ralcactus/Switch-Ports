var _touched = false;

if (type == type_ground && place_meeting(x, y - 1, obj_player))
    _touched = true;
else if (type == type_area && place_meeting(x, y, obj_player))
    _touched = true;

if (_touched && !triggered)
{
    triggered = true;
    event_trigger();
}
