var _destroy = false;

with (other.id)
{
    if (other.fire && other.firescale > 0.5)
    {
        if (mask_index == spr_player_uppunchhitbox)
            mask_index = spr_player_uppunchhitboxtnt;
        else
            mask_index = spr_player_punchhitboxtnt;
    }
    
    if (place_meeting(x, y, other.id))
        _destroy = true;
    
    if (mask_index == spr_player_uppunchhitboxtnt)
        mask_index = spr_player_uppunchhitbox;
    else
        mask_index = spr_player_punchhitbox;
}

if (_destroy)
    event_inherited();
