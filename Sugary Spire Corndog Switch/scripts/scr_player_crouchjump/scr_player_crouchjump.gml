function state_player_crouchjump()
{
    move = key_left + key_right;
    
    if (vsp > 5)
        fallingAnimation++;
    
    if (fallingAnimation >= 40 && fallingAnimation < 65)
    {
        sprite_index = spr_player_PZ_freeFall_1;
        
        if (sprite_index == spr_player_PZ_flinged_up && !instance_exists(obj_candifiedeffect1))
            instance_create(x, y, obj_candifiedeffect1);
        
        state = UnknownEnum.Value_55;
    }
    
    mask_index = spr_crouchmask;
    hsp = move * movespeed;
    movespeed = 4;
    
    if (jumpAnim && !jumpStop)
    {
        if (!key_jump2)
        {
            vsp /= 20;
            jumpStop = true;
        }
        
        if (scr_solid(x, y - 1))
        {
            vsp = grav;
            jumpStop = true;
        }
    }
    
    if (grounded)
    {
        if (key_down)
        {
            state = UnknownEnum.Value_60;
            jumpAnim = true;
            crouchAnim = true;
            image_index = 0;
            jumpStop = false;
        }
        else if (!scr_solid(x, y - 16))
        {
            movespeed = 0;
            state = UnknownEnum.Value_1;
            jumpAnim = true;
            landAnim = true;
            crouchAnim = true;
            image_index = 0;
            jumpStop = false;
            mask_index = spr_player_mask;
        }
        
        state = UnknownEnum.Value_60;
        jumpAnim = true;
        crouchAnim = true;
        image_index = 0;
        jumpStop = false;
    }
    
    if (jumpAnim)
    {
        sprite_index = spr_crouchjump;
        
        if (floor(image_index) == (image_number - 1))
        {
            jumpAnim = false;
            sprite_index = spr_crouchfall;
        }
    }
    else
    {
        sprite_index = spr_crouchfall;
    }
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
}
