function state_player_rocketlauncher()
{
    hsp = 0;
    movespeed = 0;
    sprite_index = spr_player_PZ_bazooka_shoot;
    
    if (animation_end())
        state = UnknownEnum.Value_1;
}
