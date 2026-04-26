function state_player_bump()
{
    movespeed = 0;
    machTwo = 0;
    alarm[4] = 14;
    
    if (sprite_index != spr_player_PZ_caught && sprite_index != spr_splat && sprite_index != spr_tumbleend && sprite_index != spr_mach3hitwall && sprite_index != spr_player_PN_shoulderBash)
        sprite_index = spr_bump;
    
    if (sprite_index == spr_splat)
    {
        hsp = 0;
        vsp = 0;
    }
    else if (grounded && vsp > 0)
    {
        hsp = 0;
    }
    
    if (animation_end())
    {
        state = UnknownEnum.Value_55;
        sprite_index = shotgunAnim ? spr_shotgun_jump : spr_jump;
    }
    
    image_speed = 0.35;
}
