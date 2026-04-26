var old_activated = activated;

if (!place_meeting(x, y, obj_guard))
{
    activated = false;
}
else
{
    with (obj_guard)
    {
        if (place_meeting(x, y, other.id) && state == UnknownEnum.Value_1)
            other.activated = true;
    }
}

if (old_activated != activated)
{
    with (obj_toxicGasArea)
    {
        if (gasID == other.gasID)
            gasActivated = other.activated;
    }
}
