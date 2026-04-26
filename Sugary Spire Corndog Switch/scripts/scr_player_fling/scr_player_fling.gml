function state_player_fling()
{
    image_speed = 0.35;
    
    if (sprite_index == spr_player_PZ_flinged_start && animation_end())
        sprite_index = spr_player_PZ_flinged;
}
