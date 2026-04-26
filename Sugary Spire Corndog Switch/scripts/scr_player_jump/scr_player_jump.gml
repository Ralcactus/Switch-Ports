function state_player_jump()
{
    move = key_left + key_right;
    
    if (momemtum)
        hsp = xscale * movespeed;
    else
        hsp = move * movespeed;
    
    scr_conveyorBeltKinematics();
    
    if (move != xscale && momemtum && movespeed != 0)
        movespeed = approach(movespeed, 0, 0.1);
    
    if (movespeed <= 0)
        momemtum = false;
    
    if ((move == 0 && !momemtum) || scr_solid(x + hsp, y))
    {
        movespeed = 0;
        machTwo = 0;
    }
    
    if (move != 0 && movespeed < 7)
        movespeed += 0.5;
    
    if (movespeed > 7)
        movespeed -= 0.1;
    
    if (move != 0 && scr_solid(x + move, y))
        movespeed = 0;
    
    if (dir != xscale)
    {
        machTwo = 0;
        dir = xscale;
        movespeed = 0;
    }
    
    if (move == -xscale)
    {
        machTwo = 0;
        movespeed = 0;
        momemtum = false;
    }
    
    landAnim = true;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5 && !stompAnim)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    ladderBuffer = max(ladderBuffer - 1, 0);
    
    if (scr_solid(x, y - 1) && !jumpStop && jumpAnim)
    {
        vsp = grav;
        jumpStop = true;
    }
    
    if (can_jump && inputBufferJump > 0 && !key_down && !key_attack)
    {
        fmod_event_play(sndJump);
        sprite_index = shotgunAnim ? spr_shotgun_jump : spr_jump;
        image_index = 0;
        instance_create(x, y, obj_highJumpCloud1, 
        {
            playerID: id
        });
        stompAnim = false;
        vsp = -11;
        state = UnknownEnum.Value_55;
        jumpAnim = true;
        jumpStop = false;
        freefallstart = 0;
        instance_create(x, y, obj_landcloud);
        inputBufferJump = 0;
    }
    
    if (character == UnknownEnum.Value_1 && charged)
    {
        if (key_up)
        {
            alarm[0] = 240;
            sprite_index = spr_player_PN_superJump_prep;
            image_index = 0;
            movespeed = 0;
            machTwo = 0;
            state = UnknownEnum.Value_58;
        }
        else if (key_attack)
        {
            sprite_index = spr_player_PN_sideSuperJump_prep;
            image_index = 0;
            movespeed = 0;
            machTwo = 0;
            charged = false;
            state = UnknownEnum.Value_103;
        }
    }
    
    if (grounded && vsp > 0 && !key_attack)
    {
        if (key_attack)
            landAnim = false;
        
        inputBufferSecondJump = 0;
        state = UnknownEnum.Value_1;
        jumpAnim = true;
        jumpStop = false;
        image_index = 0;
        freefallstart = 0;
        instance_create(x, y, obj_landcloud);
        event_play_oneshot("event:/SFX/player/step", x, y);
        doubleJumped = false;
    }
    
    if (character == UnknownEnum.Value_0)
    {
        if (vsp > 5)
            fallingAnimation++;
        
        if (fallingAnimation >= 40 && fallingAnimation < 65)
        {
            sprite_index = spr_player_PZ_freeFall_1;
            
            if (sprite_index == spr_player_PZ_flinged_up && !instance_exists(obj_candifiedeffect1))
                instance_create(x, y, obj_candifiedeffect1);
        }
        
        if (fallingAnimation >= 65)
            sprite_index = spr_player_PZ_freeFall_2;
    }
    
    if (!stompAnim)
    {
        if (jumpAnim && floor(image_index) == (image_number - 1))
            jumpAnim = false;
        
        if (!jumpAnim)
        {
            var aerial_sprite_transitions = [[spr_player_PZ_suplexDash_cancel, spr_fall], [spr_jump, spr_fall]];
            
            for (var i = 0; i < array_length(aerial_sprite_transitions); i++)
            {
                if (aerial_sprite_transitions[i][0] == sprite_index)
                {
                    sprite_index = aerial_sprite_transitions[i][1];
                    break;
                }
            }
        }
    }
    
    if (stompAnim == 1)
    {
        if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
            sprite_index = spr_stomp;
    }
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
    
    if (key_shoot2 && global.treat)
    {
        vsp = -5;
        state = UnknownEnum.Value_143;
        image_index = 0;
        sprite_index = spr_player_PZ_donut_throw;
        
        with (instance_create(x, y + 16, obj_donutThrowable))
        {
            image_xscale = other.xscale;
            
            if (other.key_up)
            {
                movespeed = 8;
                vsp = -5;
            }
            else
            {
                movespeed = 9;
                vsp = 5;
            }
        }
    }
    
    do_grab();
    
    if (grounded && (sprite_index == spr_player_PZ_freeFall_1 || sprite_index == spr_player_PZ_freeFall_2))
    {
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        
        with (obj_parent_baddie)
        {
            if (bbox_in_camera(id, view_camera[0]) && grounded)
            {
                vsp = -7;
                hsp = 0;
            }
        }
        
        camera_shake_add(10, 30);
        image_index = 0;
        sprite_index = spr_player_PZ_freeFall_land;
        state = UnknownEnum.Value_70;
        doubleJumped = false;
    }
    
    do_taunt();
    
    if (key_down2 && !grounded)
    {
        if (character == UnknownEnum.Value_3)
        {
            image_index = 0;
            sprite_index = spr_bodyslamstart;
            freeFallSmash = 2;
            vsp = 6;
            state = UnknownEnum.Value_69;
        }
        else
        {
            image_index = 0;
            sprite_index = spr_bodyslamstart;
            vsp = -6;
            freeFallSmash = -14;
            state = UnknownEnum.Value_51;
        }
    }
    
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
    
    if (inputBufferJump > 0 && character == UnknownEnum.Value_1 && !can_jump && !doubleJumped && !scr_solid(x + xscale, y, true))
    {
        doubleJumped = true;
        vsp = -10;
        sprite_index = spr_player_PN_doubleJump;
        inputBufferJump = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_PZ_flinged_up_start)
        sprite_index = spr_player_PZ_flinged_up;
    
    if (character == UnknownEnum.Value_4 && inhalingEnemy && key_slap && !grounded)
    {
        sprite_index = spr_coneboy_spitair;
        
        with (instance_create(x, y, obj_coneboyprojectile))
            inhalingEnemy = false;
        
        vsp -= 4;
    }
    
    if (sprite_index == spr_coneboy_spitair)
    {
        hsp = xscale * -5;
        move = 0;
    }
    
    if (key_attack && grounded && fallingAnimation < 40 && character != UnknownEnum.Value_3)
    {
        machTwo = 0;
        movespeed = max(movespeed, 6);
        sprite_index = spr_mach1;
        jumpAnim = true;
        state = UnknownEnum.Value_64;
        image_index = 0;
    }
    
    if (key_attack && character == UnknownEnum.Value_3)
    {
        state = UnknownEnum.Value_119;
        gumbobBounceCounter = 0;
        sprite_index = spr_player_GB_bounceAir_intro;
        image_index = 0;
    }
}
