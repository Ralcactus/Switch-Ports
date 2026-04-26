function state_player_climbwall()
{
    conveyorHsp = 0;
    hsp = xscale;
    
    if (windingAnim < 200)
        windingAnim++;
    
    jumpStop = false;
    move = key_right + key_left;
    suplexMove = false;
    vsp = -verticalMovespeed;
    
    if (vsp != 0 && place_meeting(x + xscale, y, obj_molassesWall))
    {
        if ((floor(image_index) % 4) == 0)
        {
            create_debris(x + (xscale * 16), y + 46, spr_molassesgoop);
            event_play_oneshot("event:/SFX/player/goopfloor", x, y);
        }
    }
    
    var _maxspeed = (move == xscale) ? 20 : 12;
    
    if (verticalMovespeed < _maxspeed && !place_meeting(x + xscale, y, obj_molassesWall))
    {
        verticalMovespeed += 0.1;
    }
    else if (place_meeting(x + xscale, y, obj_molassesWall))
    {
        if (verticalMovespeed > 0)
            verticalMovespeed -= 0.05;
    }
    
    if (verticalMovespeed > 0)
    {
        if (movespeed < 24)
        {
            if (!machFourMode)
                movespeed += 0.025;
            else
                movespeed += 0.1;
        }
    }
    
    if (movespeed > 16)
        machFourMode = true;
    
    sprite_index = spr_climbwall;
    
    if (verticalMovespeed <= 0)
    {
        movespeed = 0;
        machTwo = 0;
    }
    
    if (grabClimbBuffer > 0)
        grabClimbBuffer--;
    
    if (!key_attack && grabClimbBuffer <= 0)
    {
        movespeed = 0;
        vsp /= 2;
        state = UnknownEnum.Value_55;
        sprite_index = spr_fall;
        conveyorHsp = -6 * xscale;
    }
    
    if (!scr_solid(x + xscale, y))
    {
        instance_create(x, y, obj_jumpdust);
        vsp = 0;
        verticalMovespeed = max(verticalMovespeed, 6);
        
        if (verticalMovespeed < 12)
        {
            state = UnknownEnum.Value_64;
            movespeed = verticalMovespeed;
        }
        else if (verticalMovespeed >= 12)
        {
            state = UnknownEnum.Value_65;
            sprite_index = spr_mach3player;
            movespeed = verticalMovespeed;
        }
    }
    
    if ((place_meeting_collision(x, y - 1, UnknownEnum.Value_1) && vsp <= 0) && !place_meeting(x, y - 1, obj_boxofpizza) && !place_meeting(x, y - 1, obj_destructibles))
    {
        sprite_index = spr_player_PZ_wallclimb_crash;
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        image_index = 0;
        state = UnknownEnum.Value_50;
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
    }
    
    if (inputBufferJump > 0 && key_attack)
    {
        inputBufferJump = 0;
        image_index = 0;
        sprite_index = spr_secondjump1;
        vsp = -9;
        jumpStop = false;
        xscale *= -1;
        state = UnknownEnum.Value_64;
        
        if (movespeed >= 12 && !place_meeting(x + xscale, y, obj_molassesWall))
        {
            if (movespeed > 15)
                movespeed = 15;
            
            sprite_index = spr_mach3jump;
            state = UnknownEnum.Value_65;
        }
        else if (place_meeting(x + xscale, y, obj_molassesWall))
        {
            sprite_index = spr_mach2jump;
            movespeed = clamp(movespeed, 6, 10);
            create_debris(x + (xscale * 16), y + 46, spr_molassesgoop);
            event_play_oneshot("event:/SFX/player/goopjump", x, y);
        }
        
        instance_create(x, y, obj_jumpdust);
        fmod_event_play(sndJump);
    }
    
    if (grounded && verticalMovespeed < 0)
    {
        state = UnknownEnum.Value_55;
        sprite_index = spr_fall;
        vsp = -verticalMovespeed;
    }
    
    image_speed = 0.6;
    
    if (!instance_exists(obj_puffEffect))
        instance_create(x, y + 43, obj_puffEffect);
}

function state_player_climbceiling()
{
    conveyorHsp = 0;
    upsideDownJump = true;
    
    if (windingAnim < 2000)
        windingAnim++;
    
    move = key_right + key_left;
    
    if (move != dir && dir != -xscale)
        dir = -xscale;
    
    hsp = movespeed * -xscale;
    vsp = 0;
    
    if (movespeed < 24 && move == dir)
    {
        if (!machFourMode)
            movespeed += 0.025;
        else
            movespeed += 0.1;
    }
    
    sprite_index = spr_climbCeilingMach;
    
    if (!place_meeting_collision(x, y - 31))
    {
        vsp = 0;
        xscale *= -1;
        image_index = 0;
        sprite_index = spr_climbCeilingJump;
        
        if (movespeed < 12)
            state = UnknownEnum.Value_64;
        else if (movespeed >= 12)
            state = UnknownEnum.Value_65;
    }
    
    if (move == -dir)
    {
        vsp = 0;
        xscale *= -1;
        slopeAngle = 180;
        
        if (movespeed < 12)
        {
            event_play_oneshot("event:/SFX/player/machslideboost", x, y);
            sprite_index = spr_machslideboost;
            image_index = 0;
            state = UnknownEnum.Value_66;
        }
        else
        {
            event_play_oneshot("event:/SFX/player/machslideboost", x, y);
            sprite_index = spr_machslideboost3;
            flash = false;
            state = UnknownEnum.Value_66;
            image_index = 0;
            machTwo = 100;
        }
    }
    
    if (!key_attack)
    {
        upsideDownJump = false;
        vsp = 0;
        xscale *= -1;
        slopeAngle = 180;
        event_play_oneshot("event:/SFX/player/break", x, y);
        sprite_index = spr_machslidestart;
        image_index = 0;
        state = UnknownEnum.Value_66;
    }
    
    if (place_meeting_slope(x, y - 1) && scr_solid(x - xscale, y, true) && !place_meeting(x - xscale, y, obj_destructibles) && !(place_meeting(x - xscale, y, obj_metalblock) && movespeed >= 12))
    {
        dir = (move == xscale) ? xscale : -xscale;
        vsp = 0;
        verticalMovespeed = movespeed;
        state = UnknownEnum.Value_12;
    }
    else if (scr_solid(x - xscale, y, true) && !place_meeting(x - xscale, y, obj_destructibles) && !(place_meeting(x - xscale, y, obj_metalblock) && movespeed >= 12))
    {
        vsp = 0;
        event_play_oneshot("event:/SFX/player/groundpound", x, y);
        camera_shake_add(20, 40);
        image_speed = 0.35;
        
        with (obj_parent_baddie)
        {
            if (bbox_in_camera(id, view_camera[0]) && grounded)
            {
                stun = 1;
                alarm[0] = 200;
                ministun = 0;
                vsp = -5;
                hsp = 0;
            }
        }
        
        flash = false;
        combo = 0;
        sprite_index = spr_mach3hitwall;
        state = UnknownEnum.Value_67;
        hsp = -2.5 * -xscale;
        vsp = -3;
        machTwo = 0;
        image_index = 0;
        instance_create(x + (10 * -xscale), y + 10, obj_bumpEffect);
    }
    
    if (inputBufferJump > 0 && key_attack)
    {
        inputBufferJump = 0;
        
        if (movespeed >= 12)
        {
            upsideDownJump = true;
            image_index = 0;
            sprite_index = spr_climbCeilingJump;
            vsp = 5;
            jumpStop = false;
            state = UnknownEnum.Value_65;
            xscale *= -1;
        }
        else
        {
            upsideDownJump = true;
            image_index = 0;
            sprite_index = spr_climbCeilingJump;
            vsp = 5;
            jumpStop = false;
            state = UnknownEnum.Value_64;
            xscale *= -1;
        }
        
        instance_create(x, y, obj_jumpdust);
        fmod_event_play(sndJump);
    }
    
    do_taunt();
    image_speed = 0.6;
}

function state_player_climbdownwall()
{
    conveyorHsp = 0;
    hsp = -xscale;
    upsideDownJump = false;
    
    if (windingAnim < 200)
        windingAnim++;
    
    move = key_right + key_left;
    suplexMove = false;
    vsp = verticalMovespeed;
    
    if (vsp != 0 && place_meeting(x - xscale, y, obj_molassesWall))
    {
        if ((floor(image_index) % 4) == 0)
            create_debris(x + (xscale * 16), y + 46, spr_molassesgoop);
    }
    
    var _maxspeed = (move == xscale) ? 25 : 14;
    
    if (verticalMovespeed < _maxspeed && !place_meeting(x - xscale, y, obj_molassesWall))
    {
        verticalMovespeed += 0.1;
    }
    else if (place_meeting(x - xscale, y, obj_molassesWall))
    {
        if (verticalMovespeed > 0)
            verticalMovespeed -= 0.05;
    }
    
    if (verticalMovespeed > 0)
    {
        if (movespeed < 24)
        {
            if (!machFourMode)
                movespeed += 0.025;
            else
                movespeed += 0.1;
        }
    }
    
    if (movespeed > 16)
        machFourMode = true;
    
    sprite_index = spr_climbdownwall;
    
    if (!key_attack && grabClimbBuffer <= 0)
    {
        xscale *= -1;
        movespeed = 0;
        vsp /= 2;
        state = UnknownEnum.Value_55;
        sprite_index = spr_fall;
        conveyorHsp = -6 * xscale;
    }
    
    if (!scr_solid(x - (xscale * 3), y))
    {
        instance_create(x, y, obj_jumpdust);
        xscale *= -1;
        vsp = verticalMovespeed;
        state = UnknownEnum.Value_69;
        hsp = 0;
        movespeed = 0;
        sprite_index = spr_player_PZ_fall_outOfControl;
        freeFallSmash = 10;
    }
    
    if (scr_solid(x, y + 1) && !place_meeting(x, y + 1, obj_boxofpizza) && !place_meeting(x, y + 1, obj_metalblock) && !place_meeting(x, y + 1, obj_destructibles))
    {
        if (scr_slope_ext(x, y + 1))
        {
            if (verticalMovespeed < 6)
                verticalMovespeed = 6;
            
            if (verticalMovespeed >= 6 && verticalMovespeed < 12)
            {
                state = UnknownEnum.Value_64;
                movespeed = verticalMovespeed;
            }
            else if (verticalMovespeed >= 12)
            {
                state = UnknownEnum.Value_65;
                sprite_index = spr_mach3player;
                movespeed = verticalMovespeed;
            }
        }
        else
        {
            xscale *= -1;
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            image_index = 0;
            state = UnknownEnum.Value_70;
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
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            combo = 0;
            instance_create(x, y, obj_landcloud);
            freefallstart = 0;
            image_index = 0;
            sprite_index = spr_bodyslamland;
        }
    }
    
    if (inputBufferJump > 0 && key_attack)
    {
        inputBufferJump = 0;
        
        if (movespeed >= 12 && !place_meeting(x - xscale, y, obj_molassesWall))
        {
            upsideDownJump = true;
            image_index = 0;
            sprite_index = spr_mach3jump;
            vsp = 3;
            jumpStop = false;
            state = UnknownEnum.Value_65;
        }
        else if (movespeed >= 6 && !place_meeting(x - xscale, y, obj_molassesWall))
        {
            upsideDownJump = true;
            image_index = 0;
            sprite_index = spr_secondjump1;
            vsp = 3;
            jumpStop = false;
            state = UnknownEnum.Value_64;
        }
        else
        {
            upsideDownJump = true;
            sprite_index = spr_mach2jump;
            movespeed = clamp(movespeed, 6, 10);
            jumpStop = false;
            vsp = 3;
            state = UnknownEnum.Value_64;
            create_debris(x + (xscale * 16), y + 46, spr_molassesgoop);
        }
        
        instance_create(x, y, obj_jumpdust);
        fmod_event_play(sndJump);
    }
    
    image_speed = 0.6;
    
    if (!instance_exists(obj_puffEffect))
        instance_create(x, y + 43, obj_puffEffect);
}
