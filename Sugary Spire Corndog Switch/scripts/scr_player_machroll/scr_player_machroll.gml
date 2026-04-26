function state_player_machroll()
{
    static afterimage_timer = 2;
    
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    machTwo = 100;
    machSlideAnim = true;
    move = key_right + key_left;
    
    if (!instance_exists(obj_puffEffect) && grounded)
        instance_create(x, y + 43, obj_puffEffect);
    
    if (grounded && sprite_index != spr_crouchslipintro && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall)
    {
        if (movespeed < 12)
        {
            sprite_index = spr_machroll;
        }
        else if (sprite_index != spr_machroll3intro && sprite_index != spr_machroll3 && (sprite_index != spr_machroll || animation_end()))
        {
            sprite_index = spr_machroll3intro;
            image_index = 0;
        }
    }
    else if (!grounded && sprite_index != spr_dive)
    {
        crouchSlipBuffer = 0;
        sprite_index = spr_dive;
        fmod_event_play(sndDive);
        vsp = 10;
    }
    
    if (sprite_index == spr_crouchslipintro || sprite_index == spr_crouchslip || sprite_index == spr_crouchslipfall)
    {
        if (key_down && crouchSlipAntiBuffer < 8)
        {
            crouchSlipAntiBuffer++;
            
            if (crouchSlipAntiBuffer >= 8)
            {
                crouchSlipBuffer = 0;
                crouchSlipAntiBuffer = 0;
            }
        }
    }
    
    if (key_down2)
    {
        crouchSlipBuffer = 0;
        crouchSlipAntiBuffer = 0;
    }
    
    crouchSlipBuffer = max(crouchSlipBuffer - 1, 0);
    
    if (animation_end())
    {
        if (sprite_index == spr_crouchslipintro)
            sprite_index = spr_crouchslip;
        
        if (sprite_index == spr_machroll3intro)
            sprite_index = spr_machroll3;
    }
    
    if (!key_down && grounded && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
    {
        if (crouchSlipBuffer <= 0 || (sprite_index != spr_crouchslip && sprite_index != spr_crouchslipintro && sprite_index != spr_crouchslipfall))
        {
            crouchSlipBuffer = 0;
            
            if (key_attack)
            {
                fmod_event_play(sndRollGetUp);
                image_index = 0;
                sprite_index = spr_rollgetup;
                state = (movespeed >= 12) ? UnknownEnum.Value_65 : UnknownEnum.Value_64;
            }
            else if (movespeed > 6)
            {
                event_play_oneshot("event:/SFX/player/break", x, y);
                sprite_index = spr_machslidestart;
                image_index = 0;
                state = UnknownEnum.Value_66;
            }
            else
            {
                state = UnknownEnum.Value_1;
            }
        }
    }
    
    if (inputBufferJump > 0)
    {
        inputBufferJump = 0;
        
        if (sprite_index == spr_dive && !place_meeting_collision(x, y + vsp))
        {
            state = UnknownEnum.Value_69;
            image_index = 0;
            sprite_index = spr_bombdropstart;
            dir = xscale;
            vsp = -6;
            verticalMovespeed = vsp;
            freeFallSmash = 0;
        }
        else if (!key_down && can_jump && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
        {
            fmod_event_play(sndRollGetUp);
            fmod_event_play(sndJump);
            image_index = 0;
            vsp = -11;
            
            if (movespeed >= 12)
            {
                state = UnknownEnum.Value_65;
                sprite_index = spr_mach3jump;
            }
            else
            {
                state = UnknownEnum.Value_64;
                sprite_index = spr_airdash1;
                
                if (movespeed >= 8)
                    sprite_index = spr_secondjump1;
            }
        }
    }
    
    var mach3_check = (movespeed >= 12 && !place_meeting(x + xscale, y, obj_metalblock)) || movespeed < 12;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        state = UnknownEnum.Value_67;
        image_index = 0;
        sprite_index = spr_splat;
        event_play_oneshot("event:/SFX/player/splat", x, y);
    }
    
    if (sprite_index == spr_crouchslip || sprite_index == spr_crouchslipfall || sprite_index == spr_crouchslipintro || sprite_index == spr_machroll || sprite_index == spr_machroll3 || sprite_index == spr_machroll3intro)
        image_speed = abs(movespeed) / 15;
    else
        image_speed = 0.35;
    
    if (!instance_exists(obj_chargeEffect) && sprite_index != spr_crouchslip && sprite_index != spr_crouchslipfall && sprite_index != spr_crouchslipintro && sprite_index != spr_dive && movespeed >= 12)
    {
        instance_create(x, y, obj_chargeEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(dashCloudID) && grounded)
    {
        with (instance_create(x, y, obj_dashCloud, 
        {
            playerID: id
        }))
        {
            playerID.dashCloudID = id;
            sprite_index = (playerID.movespeed >= 8) ? spr_dashcloud2 : spr_dashCloud;
        }
    }
    
    afterimage_timer = max(afterimage_timer - 1, 0);
    
    if (afterimage_timer <= 0)
    {
        with (create_afterimage(UnknownEnum.Value_0, xscale))
        {
            gonealpha = 0.8;
            alarm[0] = 1;
            alarm[1] = 60;
        }
        
        afterimage_timer = 2;
    }
}
