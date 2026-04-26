function state_player_uppercut()
{
    static attack_afterimage_timer = 6;
    
    image_speed = 0.35;
    
    if (sprite_index == spr_uppercutbegin && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_uppercutend;
        image_index = 0;
    }
    
    if (scr_solid(x + sign(hsp), y) && !scr_slope_ext(x + xscale, y) && move != 0)
        movespeed = 0;
    
    if (sprite_index == spr_player_GB_uppercut_intro)
    {
        if (!instance_exists(obj_gumbobBrewHitbox))
        {
            with (instance_create(x, y, obj_gumbobBrewHitbox))
                playerID = other.id;
        }
        
        if (floor(image_index) == (image_number - 8))
        {
            if (!instance_exists(obj_gumbobprojectile))
            {
                with (instance_create_depth(x + 5, y - 110, -2, obj_gumbobprojectile))
                    hsp = 4;
                
                with (instance_create_depth(x - 5, y - 110, -2, obj_gumbobprojectile))
                    hsp = -4;
            }
        }
    }
    else
    {
        instance_destroy(obj_gumbobBrewHitbox);
    }
    
    move = key_left + key_right;
    landAnim = true;
    jumpStop = false;
    hsp = movespeed;
    
    if (move != 0)
    {
        dir = move;
        movespeed = approach(movespeed, move * 5, 0.5);
    }
    
    if (grounded && vsp > 0)
    {
        event_play_oneshot("event:/SFX/player/step", x, y);
        landAnim = true;
        movespeed = abs(movespeed);
        inputBufferSecondJump = 0;
        state = UnknownEnum.Value_1;
        jumpAnim = true;
        jumpStop = false;
        image_index = 0;
        freefallstart = 0;
        instance_destroy(obj_gumbobBrewHitbox);
        instance_create_depth(x, y, 0, obj_landcloud);
    }
    
    attack_afterimage_timer = max(attack_afterimage_timer - 1, 0);
    
    if (attack_afterimage_timer <= 0 && vsp <= 0)
    {
        with (instance_create(x, y, obj_attackAfterEffect))
            playerID = other.id;
        
        attack_afterimage_timer = 6;
    }
}
