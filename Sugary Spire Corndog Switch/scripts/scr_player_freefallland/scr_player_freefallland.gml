function state_player_freefallland()
{
    scr_conveyorBeltKinematics();
    machTwo = 0;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = false;
    movespeed = 0;
    faceHurt = (sprite_index == spr_bombdropland || sprite_index == spr_bodyslamland) ? 180 : 0;
    alarm[4] = 14;
    vsp = 0;
    hsp = 0;
    
    if (animation_end())
    {
        state = UnknownEnum.Value_1;
        
        if (!faceHurt)
            sprite_index = spr_idle;
        
        freeFallSmash = 0;
    }
    
    image_speed = 0.35;
}
