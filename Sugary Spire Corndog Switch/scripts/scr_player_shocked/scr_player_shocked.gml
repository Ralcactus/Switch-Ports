function state_player_shocked()
{
    image_speed = 0.35;
    sprite_index = spr_player_PZ_electrocuted;
    movespeed = 0;
    hsp = 0;
    
    if (animation_end())
        state = UnknownEnum.Value_1;
}
