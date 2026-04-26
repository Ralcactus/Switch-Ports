function state_player_cotton()
{
    static cotton_afterimage_timer = 6;
    
    move = key_left + key_right;
    
    if ((sprite_index == spr_player_PZ_cotton_splat || sprite_index == spr_player_PZ_cotton_splat) && move != xscale)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_cotton_walk;
    }
    
    if (sprite_index != spr_player_PZ_cotton_attack && move != 0)
        xscale = move;
    
    if (dir != xscale)
        movespeed = 0;
    
    dir = xscale;
    
    if (momemtum)
        hsp = xscale * movespeed;
    else
        hsp = move * movespeed;
    
    if ((move != 0 && move != xscale) || grounded)
        momemtum = false;
    
    if (sprite_index != spr_player_PZ_cotton_attack)
        movespeed = approach(movespeed, (move == 0) ? 0 : 8, 0.5);
    
    if (place_meeting_solid(x + xscale, y) && !place_meeting_slope(x + xscale, y))
    {
        if (movespeed < 8 && (place_meeting(x + xscale, y, obj_destructibles) || place_meeting(x + xscale, y, obj_chocofrog)))
        {
            movespeed = 0;
        }
        else if (!place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_chocofrog))
        {
            if (movespeed >= 8 && grounded && sprite_index != spr_player_PZ_cotton_splat)
            {
                state = UnknownEnum.Value_87;
                sprite_index = spr_player_PZ_cotton_splat;
                image_index = 0;
                create_particle(x, y, spr_bangEffect);
            }
            
            movespeed = 0;
        }
    }
    
    if (inputBufferJump > 0 && !place_meeting(x, y, obj_cottonsolid))
    {
        if (groundedCot && can_jump)
        {
            cottonJumped = 1;
            inputBufferJump = 0;
            vsp = -16;
            grav = 0.025;
            image_index = 0;
            sprite_index = spr_player_PZ_cotton_jump;
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
            event_play_oneshot("event:/SFX/cotton/jump", x, y);
        }
        else if (!grounded && !cottonJumped && !can_jump)
        {
            inputBufferJump = 0;
            vsp = -14;
            cottonJumped = 1;
            image_index = 0;
            sprite_index = spr_player_PZ_cotton_doubleJump;
            
            with (instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            }))
            {
                image_xscale = other.xscale;
                sprite_index = spr_cottonpoof;
            }
            
            event_play_oneshot("event:/SFX/cotton/doublejump", x, y);
        }
    }
    
    if ((key_down2 || key_down) && (!grounded || scr_slope()))
    {
        verticalMovespeed = 2;
        inputBufferSlap = 0;
        grav = 0.35;
        state = UnknownEnum.Value_96;
        sprite_index = spr_player_PZ_cotton_drill;
        image_index = 0;
        event_play_oneshot("event:/SFX/cotton/attack", x, y);
        flash = true;
    }
    
    if (inputBufferSlap > 0 && sprite_index != spr_player_PZ_cotton_attack && !place_meeting(x, y, obj_cottonsolid))
    {
        if (state != UnknownEnum.Value_96)
        {
            flash = true;
            inputBufferSlap = 0;
            image_index = 0;
            sprite_index = spr_player_PZ_cotton_attack;
            movespeed = 12;
            vsp = grounded ? 0 : -6;
            grav = 0.2;
            grounded = false;
            event_play_oneshot("event:/SFX/cotton/attack", x, y);
            groundedCot = false;
        }
    }
    
    if (state != UnknownEnum.Value_96)
        vsp = min(vsp, 5);
    
    if (sprite_index == spr_player_PZ_cotton_attack)
    {
        hsp = movespeed * xscale;
        instance_create(x, y, obj_swordhitbox);
        
        if (movespeed < 12)
            movespeed = 12;
        
        move = xscale;
        
        if (!place_meeting(x, y, obj_cottonsolid) && ((-key_left2 && xscale == 1) || (key_right2 && xscale == -1)))
        {
            movespeed = 0;
            vsp = 0;
            hsp = 0;
            sprite_index = spr_player_PZ_cotton_fall;
        }
        
        if (place_meeting(x, y, obj_cottonsolid))
            vsp = 0;
    }
    
    var sprite_transitions = [[spr_player_PZ_cotton_attack, spr_cottonidle], [spr_player_PZ_cotton_jump, spr_player_PZ_cotton_fall], [spr_player_PZ_cotton_doubleJump, spr_player_PZ_cotton_doubleJump_fall], [spr_player_PZ_cotton_splat, spr_player_PZ_cotton_splat_end], [spr_player_PZ_cotton_splat_intro, spr_player_PZ_cotton_splat_end], [spr_player_PZ_cotton_splat_end, spr_player_PZ_cotton_idle]];
    
    if (!place_meeting(x, y, obj_cottonsolid))
    {
        for (var i = 0; i < array_length(sprite_transitions); i++)
        {
            if (sprite_index == sprite_transitions[i][0] && animation_end())
            {
                sprite_index = sprite_transitions[i][1];
                image_index = 0;
                break;
            }
        }
    }
    
    if (sprite_index == spr_cottonidle && move != 0)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_cotton_walk;
    }
    
    var move_sprites = [spr_player_PZ_cotton_walk, spr_player_PZ_cotton_run, spr_player_PZ_cotton_runMax];
    
    if (move == 0 && array_contains(move_sprites, sprite_index))
    {
        image_index = 0;
        sprite_index = spr_cottonidle;
    }
    
    var jump_sprites = [spr_player_PZ_cotton_jump, spr_player_PZ_cotton_doubleJump, spr_player_PZ_cotton_fall, spr_player_PZ_cotton_doubleJump_fall];
    
    if (grounded && vsp >= 0 && array_contains(jump_sprites, sprite_index))
    {
        sprite_index = (move == 0) ? spr_player_PZ_cotton_land : spr_player_PZ_cotton_land_walk;
        image_index = 0;
        cottonJumped = 0;
        instance_create(x, y, obj_landcloud);
        event_play_oneshot("event:/SFX/player/step", x, y);
    }
    
    var landing_transitions = [[spr_player_PZ_cotton_land, spr_cottonidle], [spr_player_PZ_cotton_land_walk, spr_player_PZ_cotton_walk]];
    
    for (var i = 0; i < array_length(landing_transitions); i++)
    {
        if (sprite_index == landing_transitions[i][0] && animation_end())
        {
            sprite_index = landing_transitions[i][1];
            image_index = 0;
            break;
        }
    }
    
    if (key_down2)
    {
        if (grounded)
        {
            if (move != 0 || scr_slope())
            {
                movespeed = max(movespeed, 6);
                vsp = 3;
                state = UnknownEnum.Value_97;
                image_index = 0;
                sprite_index = spr_player_PZ_cotton_roll;
            }
        }
    }
    
    var air_sprites = [spr_player_PZ_cotton_jump, spr_player_PZ_cotton_doubleJump, spr_player_PZ_cotton_attack, spr_player_PZ_cotton_drill, spr_player_PZ_cotton_drillup, spr_player_PZ_cotton_fall, spr_player_PZ_cotton_doubleJump_fall];
    
    if (!grounded && !array_contains(air_sprites, sprite_index))
        sprite_index = spr_player_PZ_cotton_fall;
    
    if (state != UnknownEnum.Value_96)
    {
        if (!key_jump2 && !jumpStop && vsp < 0.5)
        {
            vsp /= 20;
            jumpStop = true;
        }
        
        if (grounded && vsp > 0)
        {
            jumpStop = false;
            doubleJumped = false;
        }
    }
    
    if (sprite_index == spr_player_PZ_cotton_walk)
        image_speed = clamp((movespeed / 6) * 0.65, 0.35, 1);
    else
        image_speed = 0.35;
    
    cotton_afterimage_timer = max(cotton_afterimage_timer - 1, 0);
    
    if (cotton_afterimage_timer <= 0)
    {
        instance_create(x, y, obj_cottonAfterEffect, 
        {
            playerID: id
        });
        cotton_afterimage_timer = 6;
    }
}
