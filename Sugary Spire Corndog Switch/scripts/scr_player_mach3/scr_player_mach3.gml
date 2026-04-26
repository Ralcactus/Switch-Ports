function state_player_mach3()
{
    windingAnim = min(windingAnim + 1, 2000);
    machTwo = 100;
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    move = key_right + key_left;
    move2 = key_right2 + key_left2;
    momemtum = true;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && can_jump && move != -xscale)
    {
        if (character == UnknownEnum.Value_3)
        {
            state = UnknownEnum.Value_119;
            gumbobBounceCounter = 3;
        }
        else
        {
            image_index = 0;
            sprite_index = spr_mach3jump;
            inputBufferJump = 0;
            fmod_event_play(sndJump);
            vsp = -11;
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
    
    if (grounded)
    {
        if (slopeCheck(x, y) && hsp != 0 && movespeed > 12 && movespeed < 18)
            player_slopeMomentum(0.2, 0);
    }
    
    var maxspd = (character == UnknownEnum.Value_3) ? 12 : 20;
    
    if (move == xscale && grounded)
    {
        if (movespeed < maxspd)
            movespeed += (machFourMode ? 0.1 : 0.025);
    }
    
    if (grounded && vsp >= 0 && character == UnknownEnum.Value_3 && (key_jump2 || inputBufferJump > 0))
    {
        state = UnknownEnum.Value_119;
        gumbobBounceCounter = 3;
        inputBufferJump = 0;
    }
    
    if (sprite_index == spr_climbCeilingJump && animation_end())
        sprite_index = spr_climbCeilingFall;
    
    if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_mach3player;
    
    if (sprite_index == spr_player_PZ_superJump_cancel && grounded)
        sprite_index = spr_mach3player;
    
    if (animation_end() && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_machdashpad))
        sprite_index = spr_mach3player;
    
    if (grounded && (sprite_index == spr_dive || sprite_index == spr_climbCeilingFall || sprite_index == spr_climbCeilingJump))
        sprite_index = spr_mach3player;
    
    if (!grounded && !key_down && sprite_index == spr_dive)
    {
        vsp = 15;
        sprite_index = spr_mach3player;
    }
    
    if (movespeed > 16 && character != UnknownEnum.Value_3 && sprite_index != spr_crazyrun && sprite_index != spr_climbCeilingFall && sprite_index != spr_climbCeilingJump && sprite_index != spr_dive)
    {
        machFourMode = true;
        flash = true;
        sprite_index = spr_crazyrun;
        
        with (instance_create(x, y, obj_slapstar))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    else if (movespeed <= 16 && sprite_index == spr_crazyrun)
    {
        sprite_index = spr_mach3player;
    }
    
    if (grounded)
        sJumpCanDoubleJump = true;
    
    if (key_up && sprite_index != spr_machdashpad && character != UnknownEnum.Value_3 && sprite_index != spr_dive && grounded)
    {
        sprite_index = spr_player_PZ_superJump_prep;
        state = UnknownEnum.Value_59;
        hsp = 0;
        image_index = 0;
    }
    
    if (grounded && dashpadBuffer <= 0 && (character != UnknownEnum.Value_1 || kungBuffer <= 0))
    {
        if (!key_attack && sprite_index != spr_machdashpad)
        {
            event_play_oneshot("event:/SFX/player/break", x, y);
            sprite_index = spr_machslidestart;
            image_index = 0;
            state = UnknownEnum.Value_66;
        }
        
        if (move == -xscale)
        {
            event_play_oneshot("event:/SFX/player/machslideboost", x, y);
            sprite_index = spr_machslideboost3;
            flash = false;
            state = UnknownEnum.Value_66;
            image_index = 0;
            machTwo = 100;
        }
    }
    
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
                movespeed = 7;
                vsp = -14;
            }
            else
            {
                movespeed = 8;
                vsp = -5;
            }
            
            movespeed += other.movespeed;
        }
    }
    
    if (key_down && !place_meeting(x, y, obj_dashpad) && character != UnknownEnum.Value_3 && (character != UnknownEnum.Value_1 || kungBuffer <= 0))
    {
        flash = false;
        state = UnknownEnum.Value_28;
        image_index = 0;
        sprite_index = spr_machroll;
        
        if (!grounded)
            sprite_index = spr_dive;
        
        vsp = 10;
    }
    
    if ((!grounded || slopeCheck(x + xscale, y)) && character != UnknownEnum.Value_3 && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
    {
        verticalMovespeed = movespeed;
        
        if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
            verticalMovespeed -= vsp;
        
        grabClimbBuffer = 0;
        inputBufferJump = 0;
        state = UnknownEnum.Value_11;
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
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
            hsp = -2.5 * xscale;
            vsp = -3;
            machTwo = 0;
            image_index = 0;
            instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
        }
    }
    
    if (sprite_index == spr_crazyrun && !instance_exists(obj_crazyRunHoopEffect))
    {
        instance_create(x, y, obj_crazyRunHoopEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(obj_crazyRunEffect))
    {
        instance_create(x, y, obj_crazyRunEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(obj_chargeEffect) && sprite_index != spr_dive)
    {
        instance_create(x, y, obj_chargeEffect, 
        {
            playerID: id
        });
    }
    
    if (!instance_exists(obj_superdashcloud) && grounded)
    {
        instance_create(x, y, obj_superdashcloud, 
        {
            playerID: id
        });
    }
    
    if (sprite_index == spr_mach3player)
        image_speed = 0.4;
    else if (sprite_index == spr_crazyrun)
        image_speed = 0.65;
    else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4;
    else if (sprite_index == spr_machdashpad)
        image_speed = 0.3;
    
    if (sprite_index != spr_dive)
    {
        do_taunt();
        do_grab();
    }
    
    if (character == UnknownEnum.Value_1)
    {
        if (key_jump > 0 && !can_jump && !grounded && !doubleJumped)
        {
            vsp = -11;
            sprite_index = spr_player_PN_mach3_jump;
            image_index = 0;
            move = key_left + key_right;
            
            if (move != 0)
                xscale = move;
            
            if (move == 0)
                movespeed = 0;
            
            doubleJumped = true;
        }
        
        if (grounded)
            doubleJumped = false;
    }
}
