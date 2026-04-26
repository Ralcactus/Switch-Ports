function state_player_frostburnnormal()
{
    jumpedOnce = false;
    doubleJumped = false;
    tripleJumped = false;
    momemtum = false;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    var a = xscale;
    
    if (move != 0)
    {
        xscale = move;
        
        if (a != xscale)
            movespeed = 2;
        
        movespeed += ((movespeed < 8) ? 0.25 : -0.15);
    }
    else
    {
        movespeed = approach(movespeed, 0, 0.6);
    }
    
    if (grounded && slopeCheck(x, y))
    {
        movespeed = 8;
        xscale = -slopeMomentum_direction();
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
        
        state = UnknownEnum.Value_151;
    }
    
    sprite_index = (move == 0) ? spr_player_PZ_frostburn_idle : spr_player_PZ_frostburn_walk_slow;
    
    if (inputBufferJump > 0 && can_jump)
    {
        inputBufferJump = 0;
        jumpStop = false;
        image_index = 0;
        sprite_index = spr_player_PZ_frostburn_jump;
        fmod_event_play(sndJump);
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        vsp = -10;
        movespeed = hsp;
        state = UnknownEnum.Value_152;
    }
    
    if (!grounded)
    {
        sprite_index = spr_player_PZ_frostburn_dive;
        movespeed = hsp;
        state = UnknownEnum.Value_152;
    }
    
    image_speed = 0.35;
}

function state_player_frostburnslide()
{
    momemtum = false;
    hsp = xscale * movespeed;
    move = key_left + key_right;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
    {
        vsp /= 2;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (key_jump2 && inputBufferJump > 0 && jumpedOnce == false)
    {
        vsp = -12;
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        fmod_event_play(sndJump);
        sprite_index = spr_player_PZ_frostburn_doubleJump_intro;
        image_index = 0;
        inputBufferJump = -1;
        jumpedOnce = true;
    }
    
    if (grounded && inputBufferJump == -1)
    {
        inputBufferJump = 0;
        jumpedOnce = false;
    }
    
    if (key_jump2 && inputBufferJump > 0 && !can_jump && !doubleJumped && !grounded && jumpedOnce == true)
    {
        jumpStop = true;
        doubleJumped = true;
        vsp = -14;
        image_index = 0;
        sprite_index = spr_player_PZ_frostburn_doubleJump_intro;
        
        with (instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        }))
            image_xscale = other.xscale;
        
        fmod_event_play(sndJump);
        state = UnknownEnum.Value_152;
        movespeed = hsp;
    }
    
    if (grounded && movespeed < 14)
        player_slopeMomentum(0.25, 0);
    
    if ((sprite_index != spr_player_PZ_frostburn_doubleJump_intro && sprite_index != spr_player_PZ_frostburn_doubleJump) || (grounded && vsp > 0))
        sprite_index = spr_player_PZ_frostburn_walk;
    
    if (animation_end() && sprite_index == spr_player_PZ_frostburn_doubleJump_intro)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_frostburn_doubleJump;
    }
    
    if (!grounded && vsp >= terminalVelocity)
    {
        movespeed = hsp;
        state = UnknownEnum.Value_152;
        flash = true;
        momemtum = true;
        sprite_index = spr_player_PZ_frostburn_spin;
    }
    
    if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_chocofrog) && !place_meeting(x + sign(hsp), y, obj_metalblock))
    {
        if (!grounded)
        {
            vsp = 0;
            image_index = 0;
            sprite_index = spr_player_PZ_frostburn_wallCling;
            state = UnknownEnum.Value_153;
            xscale = sign(hsp);
        }
        else
        {
            event_play_oneshot("event:/SFX/player/bumpwall", x, y);
            sprite_index = spr_player_PZ_frostburn_walk_fall;
            state = UnknownEnum.Value_152;
            vsp = -4;
            xscale = -sign(hsp);
            movespeed = xscale * 5;
            instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
        }
    }
    
    image_speed = 0.5;
}

function state_player_frostburnjump()
{
    static blue_aft = 0;
    
    if (sprite_index != spr_player_PZ_frostburn_spin && animation_end())
    {
        image_index = 0;
        
        switch (sprite_index)
        {
            case spr_player_PZ_frostburn_jump:
                sprite_index = spr_player_PZ_frostburn_fall;
                break;
            
            case spr_player_PZ_frostburn_doubleJump_intro:
                sprite_index = spr_player_PZ_frostburn_doubleJump;
                break;
            
            case spr_player_PZ_frostburn_wallJump_intro:
                sprite_index = spr_player_PZ_frostburn_wallJump;
                break;
        }
    }
    
    if (key_jump2 && inputBufferJump > 0 && !can_jump && !doubleJumped)
    {
        jumpStop = true;
        doubleJumped = true;
        vsp = -14;
        image_index = 0;
        sprite_index = spr_player_PZ_frostburn_doubleJump_intro;
        
        with (instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        }))
            image_xscale = other.xscale;
        
        fmod_event_play(sndJump);
    }
    
    if (vsp >= terminalVelocity || sprite_index == spr_player_PZ_frostburn_spin || ((doubleJumped || sprite_index == spr_player_PZ_frostburn_wallJump || sprite_index == spr_player_PZ_frostburn_wallJump_intro) && vsp >= 1 && !tripleJumped))
    {
        jumpStop = true;
        
        if (sprite_index != spr_player_PZ_frostburn_spin)
        {
            flash = true;
            sprite_index = spr_player_PZ_frostburn_spin;
        }
        
        vsp += 0.5;
        vsp = min(vsp, 40);
        
        if (!instance_exists(groundpoundEffect))
        {
            groundpoundEffect = instance_create(x, y + 32, obj_groundPoundEffect, 
            {
                playerID: id
            });
        }
        
        if (vsp > 17 && !instance_exists(obj_piledrivereffect) && !tripleJumped)
        {
            instance_create(x, y, obj_piledrivereffect, 
            {
                playerID: id
            });
        }
        
        blue_aft++;
        
        if (blue_aft >= 6)
        {
            create_afterimage(UnknownEnum.Value_1, xscale);
            blue_aft = 0;
        }
        
        image_speed = clamp(floor(abs(vsp) / 20) * 0.5, 0, 0.5) + 0.4;
    }
    else
    {
        image_speed = 0.35;
    }
    
    hsp = movespeed;
    move = key_left + key_right;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
    {
        vsp /= 2;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (move != 0)
        movespeed = approach(movespeed, move * 8, 0.65);
    else
        movespeed = approach(movespeed, 0, 0.65);
    
    if (place_meeting_collision(x + sign(hsp), y, UnknownEnum.Value_1))
    {
        if (key_jump2 && move != 0 && move == sign(hsp))
        {
            vsp = 0;
            image_index = 0;
            sprite_index = spr_player_PZ_frostburn_wallCling;
            state = UnknownEnum.Value_153;
            xscale = sign(hsp);
        }
        else
        {
            movespeed = 0;
        }
    }
    
    if (grounded && vsp > 0)
    {
        jumpedOnce = false;
        doubleJumped = false;
        tripleJumped = false;
        
        if (sprite_index == spr_player_PZ_frostburn_spin && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_chocofrog))
        {
            if (slopeCheck(x, y))
            {
                movespeed = 11;
                xscale = -slopeMomentum_direction();
                
                with (instance_create(x, y, obj_jumpdust))
                    image_xscale = other.xscale;
                
                state = UnknownEnum.Value_151;
            }
            else
            {
                event_play_oneshot("event:/SFX/player/groundpound", x, y);
                image_index = 0;
                movespeed = 0;
                state = UnknownEnum.Value_153;
                jumpAnim = true;
                jumpStop = false;
                
                with (obj_parent_baddie)
                {
                    if (bbox_in_camera(id, view_camera[0]) && grounded)
                    {
                        vsp = -7;
                        hsp = 0;
                    }
                }
                
                camera_shake_add(10, 30);
                combo = 0;
                instance_create(x, y, obj_landcloud);
                freefallstart = 0;
                image_index = 0;
                sprite_index = spr_player_PZ_frostburn_land_spin;
                flash = true;
            }
        }
        else if (sprite_index != spr_player_PZ_frostburn_spin)
        {
            if (slopeCheck(x, y))
            {
                movespeed = 8;
                xscale = -slopeMomentum_direction();
                
                with (instance_create(x, y, obj_jumpdust))
                    image_xscale = other.xscale;
                
                state = UnknownEnum.Value_151;
            }
            else
            {
                state = UnknownEnum.Value_150;
                
                if (sign(hsp) != 0)
                    xscale = sign(hsp);
                
                movespeed = abs(movespeed);
                hsp = xscale * movespeed;
            }
        }
    }
}

function state_player_frostburnstick()
{
    doubleJumped = false;
    tripleJumped = false;
    jumpStop = true;
    momemtum = false;
    hsp = 0;
    vsp = 0;
    
    if (!place_meeting_collision(x + xscale, y, UnknownEnum.Value_1) && sprite_index == spr_player_PZ_frostburn_wallCling)
    {
        sprite_index = spr_player_PZ_frostburn_walk_fall;
        xscale *= -1;
        movespeed = xscale * 5;
        state = UnknownEnum.Value_152;
    }
    
    if (animation_end())
    {
        if (sprite_index == spr_player_PZ_frostburn_wallCling)
        {
            sprite_index = spr_player_PZ_frostburn_wallJump_intro;
            image_index = 0;
            xscale *= -1;
            vsp = -13;
            movespeed = xscale * 10;
            state = UnknownEnum.Value_152;
        }
        else
        {
            state = UnknownEnum.Value_150;
            sprite_index = spr_player_PZ_frostburn_idle;
            freeFallSmash = 0;
        }
    }
    
    image_speed = (sprite_index == spr_player_PZ_frostburn_wallCling) ? 0.5 : 0.35;
}
