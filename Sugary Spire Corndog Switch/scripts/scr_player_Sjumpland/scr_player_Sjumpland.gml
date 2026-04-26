function state_player_Sjumpland()
{
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    machSlideAnim = true;
    crouchAnim = false;
    movespeed = 0;
    alarm[4] = 14;
    vsp = 0;
    hsp = 0;
    
    if (animation_end())
    {
        sprite_index = spr_player_PZ_freeFallSpin;
        state = UnknownEnum.Value_55;
        jumpAnim = false;
    }
}
