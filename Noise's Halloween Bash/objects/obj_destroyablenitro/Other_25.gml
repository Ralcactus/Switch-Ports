var _destroy = false;

with (other.id)
{
    var _prevmask = mask_index;
    
    if (mask_index == spr_player_uppunchhitbox)
        mask_index = spr_player_uppunchhitboxtnt;
    else
        mask_index = spr_player_punchhitboxtnt;
    
    if (place_meeting(x, y, other.id))
        _destroy = true;
    
    mask_index = _prevmask;
}

if (_destroy)
    event_inherited();
