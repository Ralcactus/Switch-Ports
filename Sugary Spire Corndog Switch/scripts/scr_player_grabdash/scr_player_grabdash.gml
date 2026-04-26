function state_player_grabdash()
{
    static speed_nerf = 2;
    
    move = key_left + key_right;
    landAnim = false;
    machTwo = max(machTwo, 35);
    
    if (floor(image_index) < 5)
    {
        vsp = min(vsp, 0);
        speed_nerf = approach(speed_nerf, 0, 0.5);
    }
    else
    {
        speed_nerf = 1;
    }
    
    if (movespeed < 10)
        movespeed = approach(movespeed, 10, 0.5);
    
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    momemtum = true;
    dir = xscale;
    
    if (move != xscale && move != 0)
    {
        state = UnknownEnum.Value_55;
        image_index = 0;
        sprite_index = spr_player_PZ_suplexDash_cancel;
        jumpAnim = true;
        momemtum = false;
        machTwo = 0;
        xscale *= -1;
        event_play_oneshot("event:/SFX/player/grabcancel", x, y);
    }
    
    if (inputBufferJump > 0 && can_jump)
    {
        image_index = 0;
        sprite_index = spr_player_PZ_mach2_longJump_intro;
        instance_create(x, y, obj_jumpdust);
        state = UnknownEnum.Value_64;
        jumpStop = false;
        vsp = -11;
        fmod_event_play(sndJump);
        inputBufferJump = 0;
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        var _ledge = 0;
        _ledge -= slope_check_up(x + xscale, y, 32);
        _ledge += slope_check_down(x + xscale, y, 3);
        
        if (_ledge != 0)
        {
            y += _ledge;
        }
        else if (!place_meeting(x + xscale, y, obj_destructibles))
        {
            if (!grounded || slopeCheck(x + xscale, y))
            {
                verticalMovespeed = 7;
                
                if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
                    verticalMovespeed -= vsp;
                
                grabClimbBuffer = 10;
                inputBufferJump = 0;
                state = UnknownEnum.Value_11;
            }
            else
            {
                jumpStop = true;
                state = UnknownEnum.Value_55;
                vsp = -4;
                sprite_index = spr_player_PZ_suplexDash_bump;
                image_index = 0;
                event_play_oneshot("event:/SFX/player/splat", x, y);
            }
        }
    }
    
    image_speed = 0.3;
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
        instance_create(x, y, obj_slidecloud);
    
    if (animation_end())
    {
        image_speed = 0.35;
        grav = 0.5;
        
        if (key_attack)
        {
            state = UnknownEnum.Value_64;
            sprite_index = spr_mach2;
        }
        else
        {
            sprite_index = spr_fall;
            momemtum = true;
            state = UnknownEnum.Value_55;
            jumpStop = true;
        }
    }
    
    if (inputBufferSlap > 0 && (!key_down || !grounded) && animation_end(undefined, 2))
    {
        fmod_event_play(sndCrouchslide);
        sprite_index = spr_player_PZ_suplexTumble;
        image_index = 0;
        image_speed = 0.2;
        
        if (!grounded)
            vsp = -6;
        
        state = UnknownEnum.Value_102;
        inputBufferSlap = 0;
        movespeed = max(movespeed, 12);
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
    
    if (key_down)
    {
        if (grounded)
        {
            grav = 0.5;
            sprite_index = spr_crouchslip;
            fmod_event_play(sndCrouchslide);
            state = UnknownEnum.Value_28;
            
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            movespeed = 12;
            crouchSlipBuffer = 25;
            crouchSlipAntiBuffer = 0;
        }
    }
}
