function state_player_normal()
{
    var idle_sprites = [spr_idle1, spr_idle2, spr_idle3, spr_idle4, spr_idle5, spr_idle6];
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
        faceHurt = false;
    }
    
    machTwo = 0;
    move = key_left + key_right;
    hsp = move * movespeed;
    scr_conveyorBeltKinematics();
    var _idle_spr = spr_idle;
    var _move_spr = spr_move;
    var _dontidle = false;
    
    if (global.levelname == "fudge")
    {
        _idle_spr = spr_player_PZ_idle_freezing;
        _dontidle = true;
    }
    
    if (global.levelname == "dance")
    {
        _idle_spr = spr_player_PZ_idle_dance;
        _move_spr = spr_player_PZ_walk_dance;
        _dontidle = true;
    }
    
    if (global.panic)
    {
        _idle_spr = spr_player_PZ_idle_escape;
        
        if (instance_exists(obj_coneball_timesUp))
            _idle_spr = spr_player_PZ_idle_timesUp;
    }
    
    if (global.Combo >= 25)
    {
        _idle_spr = spr_smallComboIdle;
        _move_spr = spr_smallComboWalk;
    }
    
    if (global.Combo >= 50)
    {
        _idle_spr = spr_bigComboIdle;
        _move_spr = spr_bigComboWalk;
    }
    
    if (windingAnim > 0)
    {
        windingAnim -= 5;
        _idle_spr = spr_player_PZ_tired;
    }
    
    if (key_taunt)
    {
        breakdanceBuffer++;
        
        if (breakdanceBuffer >= 10)
        {
            breakdanceSpeed = approach(breakdanceSpeed, 0.6, 0.005);
            _idle_spr = spr_player_PZ_idle_breakdance;
            _move_spr = spr_player_PZ_walk_breakdance;
        }
    }
    else
    {
        breakdanceBuffer = 0;
        breakdanceSpeed = 0.25;
    }
    
    if (((!machSlideAnim && !landAnim) || animation_end()) && sprite_index != spr_coneboy_spit)
    {
        machSlideAnim = false;
        landAnim = false;
        
        if (move == 0 && (!array_contains(idle_sprites, sprite_index) || animation_end()))
        {
            if (faceHurt)
            {
                faceHurt--;
                
                if (sprite_index != spr_player_PZ_divebombEnd && sprite_index != spr_player_PZ_divebombEnd)
                    sprite_index = spr_player_PZ_divebombEnd_intro;
                
                if (animation_end())
                    sprite_index = spr_player_PZ_divebombEnd;
            }
            else
            {
                sprite_index = _idle_spr;
            }
            
            if (sprite_index != spr_player_PZ_walk_breakdance && !_dontidle && sprite_index != spr_player_PZ_tired)
            {
                if (idle < 300)
                {
                    idle++;
                }
                else
                {
                    if (global.Donutfollow && !global.panic)
                        sprite_index = spr_player_PZ_donutGet;
                    else
                        sprite_index = idle_sprites[irandom(array_length(idle_sprites) - 1)];
                    
                    image_index = 0;
                    idle = 0;
                    
                    if (chance(33))
                        fmod_event_play(voiceIdle);
                }
            }
        }
        
        if (move != 0)
        {
            faceHurt = false;
            sprite_index = _move_spr;
            stepBuffer--;
            
            if (stepBuffer <= 0 && grounded && vsp > 0)
            {
                stepBuffer = 16;
                instance_create(x, y + 43, obj_puffEffect);
                event_play_oneshot("event:/SFX/player/step", x, y + 46);
            }
        }
    }
    else
    {
        if (faceHurt)
            sprite_index = spr_player_PZ_divebombEnd_intro;
        
        if (landAnim)
            sprite_index = (move == 0) ? spr_land : spr_land2;
        
        if (machSlideAnim)
            sprite_index = spr_machslideend;
    }
    
    if (scr_solid(x + move, y, true))
        movespeed = 0;
    
    jumpStop = false;
    
    if (!grounded && !key_jump)
    {
        sprite_index = shotgunAnim ? spr_shotgun_fall : spr_fall;
        jumpAnim = false;
        state = UnknownEnum.Value_55;
        image_index = 0;
    }
    
    if (can_jump && inputBufferJump > 0 && !key_down && !key_attack)
    {
        if (character == UnknownEnum.Value_3 && (key_up || key_up2))
        {
            state = UnknownEnum.Value_119;
        }
        else
        {
            fmod_event_play(sndJump);
            sprite_index = shotgunAnim ? spr_shotgun_jump : spr_jump;
            instance_create(x, y, obj_highJumpCloud1, 
            {
                playerID: id
            });
            vsp = -11;
            state = UnknownEnum.Value_55;
        }
        
        image_index = 0;
        freefallstart = 0;
        jumpAnim = true;
        jumpStop = false;
        inputBufferJump = 0;
        stompAnim = 0;
    }
    
    if (move != 0)
    {
        if (movespeed < 7)
            movespeed += 0.5;
        else if (floor(movespeed) == 7)
            movespeed = 7;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > 7)
        movespeed -= 0.1;
    
    momemtum = false;
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 3 && move != 0)
            image_speed = 0.35;
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45;
        else
            image_speed = 0.6;
    }
    else
    {
        image_speed = 0.35;
    }
    
    if (sprite_index == spr_player_PZ_walk_breakdance || sprite_index == spr_player_PZ_idle_breakdance)
        image_speed = breakdanceSpeed;
    
    if ((key_down && grounded) || scr_solid(x, y - 1))
    {
        state = UnknownEnum.Value_60;
        landAnim = false;
        crouchAnim = true;
        image_index = 0;
        idle = 0;
    }
    
    if (!instance_exists(obj_puffEffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
    {
        instance_create(x, y + 43, obj_puffEffect);
        event_play_oneshot("event:/SFX/player/step", x, y + 46);
    }
    
    do_grab();
    do_taunt();
    
    if (key_attack && grounded && !scr_solid(x + xscale, y, true))
    {
        switch (character)
        {
            case UnknownEnum.Value_3:
            case UnknownEnum.Value_2:
                if (move != 0)
                {
                    xscale = move;
                    sprite_index = spr_mach1;
                    state = UnknownEnum.Value_3;
                    image_index = 0;
                }
                
                break;
            
            default:
                machTwo = 0;
                movespeed = max(movespeed, 6);
                sprite_index = spr_mach1;
                jumpAnim = true;
                state = UnknownEnum.Value_64;
                image_index = 0;
                break;
        }
    }
}
