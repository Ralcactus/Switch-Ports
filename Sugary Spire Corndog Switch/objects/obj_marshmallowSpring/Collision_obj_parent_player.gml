with (other)
{
    if (!cutscene && !global.freezeframe && (state != UnknownEnum.Value_42 && state != UnknownEnum.Value_69 && state != UnknownEnum.Value_51 && state != UnknownEnum.Value_70))
    {
        jumpStop = true;
        vsp = -18;
        
        if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_62 || state == UnknownEnum.Value_60 || state == UnknownEnum.Value_16 || state == UnknownEnum.Value_66)
            state = UnknownEnum.Value_55;
        
        if (state == UnknownEnum.Value_150 || state == UnknownEnum.Value_153 || state == UnknownEnum.Value_152)
        {
            image_index = 0;
            sprite_index = spr_player_PZ_frostburn_jump;
            state = UnknownEnum.Value_152;
        }
        
        if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_145 || state == UnknownEnum.Value_28)
            state = UnknownEnum.Value_64;
        
        if (state == UnknownEnum.Value_55 || state == UnknownEnum.Value_1)
        {
            sprite_index = spr_player_PZ_fall_outOfControl;
            image_index = 0;
        }
        
        with (other)
        {
            if (sprite_index != spr_marshmallowSpring_active)
                event_play_oneshot("event:/SFX/general/mallowbounce", x, y);
            
            sprite_index = spr_marshmallowSpring_active;
            image_index = 0;
        }
    }
}
