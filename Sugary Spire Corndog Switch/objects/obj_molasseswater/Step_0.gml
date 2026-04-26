if (place_meeting(x, y, obj_parent_player))
{
    with (obj_parent_player)
    {
        if (place_meeting(x, y, other))
        {
            if (state != UnknownEnum.Value_134 && !global.freezeframe)
            {
                if (vsp >= 0)
                {
                    if (state == UnknownEnum.Value_87 || state == UnknownEnum.Value_96)
                        instance_create(x, y, obj_poofeffect);
                    
                    scr_playerrespawn(false);
                }
            }
        }
    }
}
