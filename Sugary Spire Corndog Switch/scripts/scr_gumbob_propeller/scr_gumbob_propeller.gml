function state_gumbob_propeller()
{
    alarm[5] = 2;
    alarm[7] = 60;
    landAnim = false;
    grav = 0.4;
    move = key_left + key_right;
    dir = xscale;
    hsp = xscale * movespeed;
    
    if (key_jump2 && gumbobPropellerFuel > 0 && (vsp < 0 || !place_meeting_collision(x, y + vsp)))
    {
        if (key_down)
            vsp = approach(vsp, 0, 1.2);
        else
            vsp = approach(vsp, -8, 1.2);
        
        gumbobPropellerFuel -= 1.5;
        image_speed = approach(image_speed, 0.6, 0.05);
    }
    else
    {
        if (key_down && vsp < terminalVelocity)
            vsp += 0.4;
        
        image_speed = approach(image_speed, 0.4, 0.1);
        
        if (grounded && vsp >= 0)
        {
            if (key_jump2)
            {
                state = UnknownEnum.Value_119;
                sprite_index = spr_player_GB_bounce_mach1_intro;
                image_index = 0;
            }
            else if (key_attack && move != 0)
            {
                xscale = move;
                sprite_index = spr_mach2;
                state = UnknownEnum.Value_3;
                image_index = 0;
                movespeed = max(movespeed, 12);
            }
            else
            {
                state = UnknownEnum.Value_1;
            }
        }
    }
    
    if (move != 0)
    {
        if (move != xscale)
        {
            if (movespeed > 0)
                movespeed -= 0.7;
            
            if (movespeed <= 0)
                xscale = move;
        }
        else if (movespeed < 8)
        {
            movespeed += 0.7;
        }
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.7);
    }
    
    if (place_meeting_collision(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        if (!grounded && move == xscale && key_jump2)
        {
            var spr_bounce_wall_start = (gumbobBounceCounter > 1) ? ((gumbobBounceCounter > 2) ? spr_player_GB_bounceSide_mach3_intro : spr_player_GB_bounceSide_mach2_intro) : spr_player_GB_bounceSide_mach1_intro;
            state = UnknownEnum.Value_119;
            hsp = 0;
            vsp = 0;
            sprite_index = spr_bounce_wall_start;
            image_index = 0;
            event_play_oneshot("event:/SFX/player/gumbobbounce", x, y);
            instance_create(x, y, obj_landcloud);
        }
        else
        {
            movespeed = 0;
        }
    }
    
    do_taunt();
    do_grab();
    
    if (animation_end() && sprite_index == spr_player_GB_propeller_intro)
        sprite_index = spr_player_GB_propeller;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 5;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
}
