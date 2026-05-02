function state_player_machtumble()
{
    static attack_afterimage_timer = 6;
    
    hsp = xscale * movespeed;
    
    if (movespeed < 11)
        movespeed += (grounded ? 0.5 : 11);
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        var _ledge = 0;
        _ledge -= slope_check_up(x + xscale, y, 32);
        _ledge += slope_check_down(x + xscale, y, 3);
        
        if (_ledge != 0)
        {
            y += _ledge;
        }
        else
        {
            state = UnknownEnum.Value_67;
            image_index = 0;
            sprite_index = spr_splat;
            event_play_oneshot("event:/SFX/player/splat", x, y);
        }
    }
    
    if (key_down)
    {
        if (grounded)
        {
            grav = 0.5;
            sprite_index = spr_crouchslip;
            state = UnknownEnum.Value_28;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            movespeed = 12;
            crouchSlipBuffer = 25;
            crouchSlipAntiBuffer = 0;
        }
        else if (vsp < 6)
        {
            vsp = 6;
        }
    }
    
    if (inputBufferJump > 0 && can_jump)
    {
        inputBufferJump = 0;
        image_index = 0;
        sprite_index = spr_player_PZ_mach2_longJump_intro;
        instance_create(x, y, obj_jumpdust);
        state = UnknownEnum.Value_64;
        jumpStop = false;
        vsp = -11;
    }
    
    if (animation_end())
    {
        if (key_attack)
        {
            state = UnknownEnum.Value_64;
            sprite_index = spr_mach2;
        }
        else if (inputBufferSlap > 0)
        {
            fmod_event_play(sndCrouchslide);
            sprite_index = spr_player_PZ_suplexTumble;
            image_index = 0;
            inputBufferSlap = 0;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
        }
        else
        {
            sprite_index = spr_fall;
            momemtum = true;
            state = UnknownEnum.Value_55;
            jumpStop = true;
        }
    }
    
    image_speed = 0.35;
    attack_afterimage_timer = max(attack_afterimage_timer - 1, 0);
    
    if (attack_afterimage_timer <= 0 && vsp <= 0)
    {
        with (instance_create(x, y, obj_attackAfterEffect))
            playerID = other.id;
        
        attack_afterimage_timer = 6;
    }
}