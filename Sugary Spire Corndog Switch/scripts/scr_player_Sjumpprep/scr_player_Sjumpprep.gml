function state_player_Sjumpprep()
{
    combo = 0;
    machTwo = 0;
    move = key_left + key_right;
    
    if (sprite_index == spr_player_PZ_superJump_prep)
    {
        hsp = xscale * movespeed;
        
        if (movespeed >= 0)
            movespeed -= 0.8;
    }
    
    scr_conveyorBeltKinematics();
    
    if (sprite_index == spr_player_PZ_superJump_prep_flash || sprite_index == spr_player_PZ_superJump_prep_right || sprite_index == spr_player_PZ_superJump_prep_left)
        hsp = move * 2;
    
    if (sprite_index != spr_player_PZ_superJump_prep)
    {
        if (sign(hsp) == 0)
        {
            sprite_index = spr_player_PZ_superJump_prep_flash;
        }
        else if (sign(hsp) == 1)
        {
            if (xscale == 1)
                sprite_index = spr_player_PZ_superJump_prep_right;
            else if (xscale == -1)
                sprite_index = spr_player_PZ_superJump_prep_left;
        }
        else if (xscale == 1)
        {
            sprite_index = spr_player_PZ_superJump_prep_left;
        }
        else if (xscale == -1)
        {
            sprite_index = spr_player_PZ_superJump_prep_right;
        }
    }
    
    alarm[4] = 14;
    jumpAnim = true;
    landAnim = false;
    machSlideAnim = true;
    crouchAnim = true;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_PZ_superJump_prep)
        sprite_index = spr_player_PZ_superJump_prep_flash;
    
    if (!key_up && (grounded || sJumpCanDoubleJump) && (sprite_index == spr_player_PZ_superJump_prep_flash || sprite_index == spr_player_PZ_superJump_prep_left || sprite_index == spr_player_PZ_superJump_prep_right || sprite_index == spr_player_PN_superJump_prep) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        instance_create(x, y, obj_mushroomCloudEffect);
        sprite_index = spr_player_PZ_superJump;
        
        if (character == UnknownEnum.Value_1)
            sprite_index = spr_player_PN_superjump;
        
        state = UnknownEnum.Value_58;
        vsp = -12;
        verticalMovespeed = vsp;
        sJumpCanDoubleJump = false;
    }
    
    image_speed = 0.35;
}
