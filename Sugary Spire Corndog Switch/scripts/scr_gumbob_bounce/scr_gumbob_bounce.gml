function state_player_gumbob_bounce()
{
    move = key_left + key_right;
    hsp = xscale * movespeed;
    var spr_bounce_start = (gumbobBounceCounter > 1) ? ((gumbobBounceCounter > 2) ? spr_player_GB_bounce_mach3_intro : spr_player_GB_bounce_mach2_intro) : spr_player_GB_bounce_mach1_intro;
    var spr_bounce_wall_start = (gumbobBounceCounter > 1) ? ((gumbobBounceCounter > 2) ? spr_player_GB_bounceSide_mach3_intro : spr_player_GB_bounceSide_mach2_intro) : spr_player_GB_bounceSide_mach1_intro;
    var spr_bounce_fall = (gumbobBounceCounter > 1) ? ((gumbobBounceCounter > 2) ? spr_player_GB_bounce_mach3 : spr_player_GB_bounce_mach2) : spr_player_GB_bounce_mach1;
    var min_speed = (gumbobBounceCounter > 1) ? ((gumbobBounceCounter > 2) ? 11 : 9) : 7;
    var wall_sprite_check = sprite_index == spr_player_GB_bounceSide_mach1_intro || sprite_index == spr_player_GB_bounceSide_mach2_intro || sprite_index == spr_player_GB_bounceSide_mach3_intro;
    scr_conveyorBeltKinematics();
    
    if (move == 0 && grounded)
        movespeed = 0;
    
    if ((grounded && vsp >= 0) && (key_jump2 || inputBufferJump > 0 || sprite_index == spr_bounce_start))
    {
        hsp = 0;
        vsp = 0;
        
        if (sprite_index != spr_bounce_start)
        {
            sprite_index = spr_bounce_start;
            image_index = 0;
            event_play_oneshot("event:/SFX/player/gumbobbounce", x, y);
            instance_create(x, y, obj_landcloud);
        }
        else if (animation_end(undefined, 3))
        {
            if (move == xscale)
            {
                gumbobBounceCounter++;
                
                if (movespeed < min_speed)
                    movespeed = min_speed;
                else if (movespeed <= 20)
                    movespeed += 2;
            }
            else if (move != 0)
            {
                movespeed = min_speed;
                xscale = move;
            }
            
            if (movespeed > 20)
                movespeed = 20;
            
            gumbobBounceCounter = clamp(gumbobBounceCounter, 0, 3);
            var jump_pitch = clamp((gumbobBounceCounter / 3) * 2, 0.6, 2);
            fmod_event_setPitch(event_play_oneshot("event:/SFX/player/gumbobbounceJump", x, y), jump_pitch);
            vsp = key_up ? -14 : -11;
            grounded = false;
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
        }
    }
    else if (grounded && vsp > 0.5)
    {
        if (key_attack && move != 0 && !scr_solid(x + xscale, y, true))
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
            event_play_oneshot("event:/SFX/player/step", x, y);
            sprite_index = spr_land;
            hsp = 0;
            vsp = 0;
        }
        
        image_index = 0;
        gumbobBounceCounter = 0;
    }
    else if (!wall_sprite_check)
    {
        if (!gumbobWallBounceBuff && (abs(movespeed) < min_speed || sign(movespeed) != move))
        {
            var mvsp = (move == xscale) ? min_speed : 0;
            movespeed = approach(movespeed, mvsp, 0.5);
        }
        
        if (key_down)
        {
            if (move == 0 || hsp == 0)
            {
                image_index = 0;
                sprite_index = spr_bodyslamstart;
                freeFallSmash = 2;
                vsp = 6;
                state = UnknownEnum.Value_69;
            }
            else if (vsp < terminalVelocity)
            {
                vsp += 0.4;
            }
        }
    }
    
    var hit_wall = place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && !place_meeting(x + xscale, y, obj_destructibles) && (gumbobBounceCounter < 3 || !place_meeting(x + xscale, y, obj_metalblock));
    
    if (wall_sprite_check && hit_wall)
    {
        hsp = 0;
        vsp = 0;
        movespeed = 0;
        
        if (animation_end(undefined, 4))
        {
            gumbobBounceCounter = clamp(gumbobBounceCounter + 1, 0, 3);
            xscale *= -1;
            movespeed = 10;
            gumbobWallBounceBuff = 1;
            var jump_pitch = clamp((gumbobBounceCounter / 3) * 2, 0.6, 2);
            fmod_event_setPitch(event_play_oneshot("event:/SFX/player/gumbobbounceJump", x, y), jump_pitch);
            vsp = key_up ? -16 : -14;
            grounded = false;
            hit_wall = false;
        }
    }
    
    if (hit_wall && !grounded && movespeed > 0)
    {
        movespeed = 0;
        
        if (key_jump2 && (!wall_sprite_check || (wall_sprite_check && animation_end(undefined, 4))))
        {
            sprite_index = spr_bounce_wall_start;
            wall_sprite_check = true;
            image_index = 0;
            event_play_oneshot("event:/SFX/player/gumbobbounce", x, y);
            instance_create(x, y, obj_landcloud);
        }
    }
    
    if (sprite_index != spr_bounce_fall && animation_end())
        sprite_index = spr_bounce_fall;
    
    if (sprite_index == spr_bounce_fall)
    {
        if (!can_jump && inputBufferJump > 0 && gumbobPropellerFuel > 0)
        {
            instance_create(x, y, obj_highJumpCloud2);
            gumbobPropellerFuel = 0;
            inputBufferJump = 0;
            vsp = -16;
            movespeed *= sign(xscale);
            sprite_index = spr_player_GB_bounce_mach2;
            state = UnknownEnum.Value_122;
            jumpStop = false;
            fmod_event_play(sndJump);
        }
        
        do_taunt();
        do_grab();
    }
    
    if (sprite_index == spr_bounce_start || wall_sprite_check)
        image_speed = 0.55;
    else
        image_speed = 0.35;
    
    var can_fly = vsp < 3 || !place_meeting_collision(x, y + (bbox_bottom - bbox_top));
    
    if (character == UnknownEnum.Value_3 && !can_jump && inputBufferJump > 0 && gumbobPropellerFuel > 0)
    {
        instance_create(x, y, obj_highJumpCloud2);
        gumbobPropellerFuel = 0;
        inputBufferJump = 0;
        vsp = -16;
        movespeed *= sign(xscale);
        sprite_index = spr_player_GB_bounce_mach2;
        state = UnknownEnum.Value_122;
        jumpStop = false;
        fmod_event_play(sndJump);
    }
}
