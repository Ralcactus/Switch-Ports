if (alarm[0] > -1)
    exit;

if (!rising)
{
    if (place_meeting(x, y - 1, obj_parent_player))
    {
        with (obj_parent_player)
        {
            if (place_meeting(x, y + 1, other.id) && y <= other.y && grounded && vsp >= 0)
            {
                other.rising = true;
                other.risingBuffer = other.risingBufferMax;
            }
        }
    }
    
    exit;
}

risingBuffer--;

if (risingBuffer <= 0)
{
    if (vsp > -10)
        vsp += (verticalMoveSpeed * targetDirection);
    
    if (y < -128 || place_meeting(x, y - 1, obj_platformStop))
    {
        vsp = 0;
        alarm[0] = 150;
    }
}

event_inherited();
