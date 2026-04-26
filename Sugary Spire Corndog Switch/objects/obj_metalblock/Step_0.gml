with (instance_nearest(x, y, obj_parent_player))
{
    if (place_meeting(x + hsp, y + vsp, other.id) && state == UnknownEnum.Value_47)
        instance_destroy(other.id);
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == UnknownEnum.Value_65 || (state == UnknownEnum.Value_3 && movespeed >= 12) || state == UnknownEnum.Value_151 || (state == UnknownEnum.Value_152 && movespeed > 5) || (state == UnknownEnum.Value_94 && object_index != obj_brimthwomp) || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_13 || (state == UnknownEnum.Value_28 && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && sprite_index != spr_crouchslipintro && movespeed >= 12) || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_100 || (state == UnknownEnum.Value_17 && momemtum) || (state == UnknownEnum.Value_139 && substate == 0)))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == UnknownEnum.Value_119 && gumbobBounceCounter >= 3))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && state == UnknownEnum.Value_145 && movespeed >= 12)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && (state == UnknownEnum.Value_146 || state == UnknownEnum.Value_147) && abs(movespeed) >= 12)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if ((place_meeting(x, y + vsp, other.id) || place_meeting(x, y + 1, other.id)) && state == UnknownEnum.Value_12 && verticalMovespeed >= 12)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == UnknownEnum.Value_58)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == UnknownEnum.Value_11 && machTwo >= 100)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
    
    if (((place_meeting(x, y + vsp, other.id) && vsp >= 0) || place_meeting(x, y + 1, other.id)) && state == UnknownEnum.Value_70 && freeFallSmash > 10)
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
}

with (instance_nearest(x, y, obj_donutShitted))
{
    if (bigShot && (place_meeting(x + hsp, y + vsp, other.id) || place_meeting(x + sign(hsp), y + sign(vsp), other.id)))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
        
        instance_destroy();
    }
}

with (instance_nearest(x, y, obj_donutSlammable))
{
    if (place_meeting(x, y + vsp, other.id) || place_meeting(x, y + sign(vsp), other.id))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
        
        instance_destroy();
    }
}

with (instance_nearest(x, y, obj_minedummycart))
{
    if (place_meeting(x + sign(hsp), y, other.id) && place_meeting(x + hsp, y, other.id))
    {
        with (other.id)
        {
            DestroyedBy = other.id;
            event_user(0);
        }
    }
}
