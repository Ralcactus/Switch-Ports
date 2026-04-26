for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    var b = ds_list_find_value(global.afterimage_list, i);
    
    with (b)
    {
        for (var l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0 && !global.freezeframe)
                alarm[l]--;
        }
        
        if (blink)
            visible = global.BlinkTrail;
        
        if (instance_exists(identity) && object_is_ancestor(identity.object_index, obj_parent_player) && !global.freezeframe)
        {
            switch (identity.state)
            {
                case UnknownEnum.Value_45:
                case UnknownEnum.Value_46:
                    image_alpha = abs(identity.movespeed) / 12;
                    break;
                
                default:
                    image_alpha = identity.movespeed / 12;
                    break;
            }
        }
        
        if (instance_exists(identity) && (object_get_parent(identity.object_index) == obj_parent_player || identity.object_index == obj_parent_player) && identity.state != UnknownEnum.Value_65 && !(identity.state == UnknownEnum.Value_3 && identity.movespeed >= 12) && identity.state != UnknownEnum.Value_46 && identity.state != UnknownEnum.Value_45 && identity.state != UnknownEnum.Value_5 && identity.state != UnknownEnum.Value_64 && identity.state != UnknownEnum.Value_16 && identity.state != UnknownEnum.Value_66 && identity.state != UnknownEnum.Value_34 && identity.state != 28 && identity.state != UnknownEnum.Value_31 && identity.state != UnknownEnum.Value_33 && identity.state != UnknownEnum.Value_100 && !(identity.state == UnknownEnum.Value_28 && identity.sprite_index != identity.spr_crouchslipintro && identity.sprite_index != identity.spr_crouchslipfall && identity.sprite_index != identity.spr_crouchslip && identity.movespeed >= 12) && identity.state != UnknownEnum.Value_58 && identity.state != UnknownEnum.Value_92 && identity.state != UnknownEnum.Value_95 && identity.state != 125 && identity.state != UnknownEnum.Value_55 && identity.state != UnknownEnum.Value_88 && identity.state != UnknownEnum.Value_102 && !global.Cane && identity.state != UnknownEnum.Value_103 && identity.state != UnknownEnum.Value_125 && identity.state != UnknownEnum.Value_63 && identity.state != UnknownEnum.Value_105 && identity.state != UnknownEnum.Value_152 && identity.state != UnknownEnum.Value_95)
            vanish = true;
        
        if (vanish)
            gonealpha = approach(gonealpha, 0, 0.15);
        
        x += hsp;
        y += vsp;
        
        if (alarm[0] == 0 || !instance_exists(identity))
            vanish = true;
        
        if (alarm[1] == 0 || gonealpha == 0)
        {
            b = undefined;
            ds_list_delete(global.afterimage_list, i);
            i--;
        }
    }
}

if (!global.freezeframe)
{
    if (blinkingBuffer > 0)
    {
        blinkingBuffer--;
    }
    else
    {
        event_user(0);
        blinkingBuffer = 3;
    }
}
