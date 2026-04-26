if (active && other.state != UnknownEnum.Value_155 && other.state != UnknownEnum.Value_0 && other.state != UnknownEnum.Value_68 && other.state != UnknownEnum.Value_67)
{
    with (other)
    {
        if (state == UnknownEnum.Value_11)
            state = UnknownEnum.Value_64;
        
        if (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_92)
            state = UnknownEnum.Value_1;
        
        if (state == UnknownEnum.Value_66)
        {
            state = UnknownEnum.Value_1;
            
            if (sprite_index == spr_machslideboost || sprite_index == spr_machslideboostFallStart || sprite_index == spr_machslideboostFall)
                state = UnknownEnum.Value_64;
            
            if (sprite_index == spr_machslideboost3 || sprite_index == spr_machslideboost3FallStart || sprite_index == spr_machslideboost3Fall)
                state = UnknownEnum.Value_65;
        }
        
        scr_taunt_storeVariables();
        state = UnknownEnum.Value_155;
        webID = other.id;
    }
}
