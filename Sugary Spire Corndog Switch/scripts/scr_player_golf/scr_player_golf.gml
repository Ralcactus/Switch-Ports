function state_player_golf()
{
    move = key_left + key_right;
    
    if (move != 0)
        move = xscale;
    
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != spr_player_PZ_hauling_idle)
        sprite_index = spr_player_PZ_swingDing;
    else if (animation_end())
        state = UnknownEnum.Value_1;
    
    if (key_slap2)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_swingDing_end;
        instance_create(x, y, obj_slaphitbox);
    }
}
