function state_player_mach2()
{
    windingAnim = min(windingAnim + 1, 2000);
    machTwo = 35;
    hsp = xscale * movespeed;
    scr_conveyorBeltKinematics();
    move = key_right + key_left;
    move2 = key_right2 + key_left2;
    
    if (!key_jump2 && !jumpStop && vsp < 0.5)
    {
        vsp /= 20;
        jumpStop = true;
    }
    
    if (grounded && vsp > 0)
        jumpStop = false;
    
    if (inputBufferJump > 0 && grounded && can_jump)
    {
        if (character == UnknownEnum.Value_0 && move != -xscale && key_attack)
        {
            image_index = 0;
            sprite_index = spr_airdash1;
            
            if (movespeed >= 8)
                sprite_index = spr_secondjump1;
        }
        else if (character == UnknownEnum.Value_3)
        {
            state = UnknownEnum.Value_119;
            gumbobBounceCounter = 0;
            sprite_index = spr_player_GB_bounce_mach1_intro;
            
            if (movespeed >= 8)
            {
                gumbobBounceCounter = 1;
                sprite_index = spr_player_GB_bounce_mach2_intro;
            }
            
            image_index = 0;
        }
        else if (character == UnknownEnum.Value_1 && move != -xscale && key_attack)
        {
            state = UnknownEnum.Value_123;
            image_index = 0;
            sprite_index = spr_player_PN_twirl;
        }
        
        inputBufferJump = 0;
        
        if (character != UnknownEnum.Value_3)
        {
            fmod_event_play(sndJump);
            vsp = -11;
        }
    }
    
    var mach_sprite = (movespeed >= 8) ? spr_mach2 : spr_mach1;
    var mach_jumpsprite = (movespeed >= 8) ? spr_secondjump1 : spr_airdash1;
    
    if (grounded)
    {
        if (!machPunchAnim && sprite_index != mach_sprite && sprite_index != spr_mach3player)
        {
            if (sprite_index != spr_suplexdash && sprite_index != spr_rollgetup)
                sprite_index = mach_sprite;
        }
        
        if (machPunchAnim)
        {
            if (!punch && sprite_index != spr_machpunch1)
            {
                sprite_index = spr_machpunch1;
                image_index = 0;
            }
            else if (punch && sprite_index != spr_machpunch2)
            {
                sprite_index = spr_machpunch2;
                image_index = 0;
            }
            
            if (animation_end())
            {
                punch = !punch;
                machPunchAnim = false;
            }
        }
    }
    
    if (!grounded)
        machPunchAnim = false;
    
    if (grounded)
    {
        if (slopeCheck(x, y) && hsp != 0 && movespeed > 8)
            player_slopeMomentum(0.2, 0);
        
        if (movespeed < 12)
            movespeed += 0.1;
        
        if (abs(hsp) >= 12 && sprite_index != spr_suplexdash)
        {
            movespeed = max(movespeed, 12);
            state = UnknownEnum.Value_65;
            flash = true;
            
            if (sprite_index != spr_rollgetup && sprite_index != spr_mach3hit)
                sprite_index = spr_mach3player;
            
            instance_create(x, y, obj_jumpdust, 
            {
                playerID: id
            });
        }
    }
    
    if (movespeed >= 8)
    {
        if (grounded && (character != UnknownEnum.Value_1 || kungBuffer <= 0))
        {
            if (!key_attack)
            {
                event_play_oneshot("event:/SFX/player/break", x, y);
                sprite_index = spr_machslidestart;
                image_index = 0;
                state = UnknownEnum.Value_66;
            }
            
            if (move == -xscale)
            {
                event_play_oneshot("event:/SFX/player/machslideboost", x, y);
                sprite_index = spr_machslideboost;
                image_index = 0;
                state = UnknownEnum.Value_66;
            }
        }
    }
    else if (movespeed < 8 && grounded)
    {
        if (!key_attack && (character != UnknownEnum.Value_1 || kungBuffer <= 0))
            state = UnknownEnum.Value_1;
        
        if (move == -xscale)
        {
            xscale *= -1;
            movespeed = 6;
        }
    }
    
    if (key_down && !place_meeting(x, y, obj_dashpad) && (character != UnknownEnum.Value_1 || kungBuffer <= 0))
    {
        flash = false;
        state = UnknownEnum.Value_28;
        image_index = 0;
        sprite_index = spr_machroll;
        
        if (!grounded)
            sprite_index = spr_dive;
        
        vsp = 10;
    }
    
    if ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && (character == UnknownEnum.Value_0 || character == UnknownEnum.Value_1))
    {
        verticalMovespeed = movespeed;
        
        if (vsp > 0 && place_meeting(x + xscale, y, obj_icyWall))
            verticalMovespeed -= vsp;
        
        grabClimbBuffer = 0;
        inputBufferJump = 0;
        state = UnknownEnum.Value_11;
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
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
            if (movespeed < 8)
            {
                state = UnknownEnum.Value_1;
            }
            else
            {
                state = UnknownEnum.Value_67;
                image_index = 0;
                sprite_index = spr_splat;
                event_play_oneshot("event:/SFX/player/splat", x, y);
            }
            
            movespeed = 0;
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
    
    if (!instance_exists(dashCloudID) && grounded)
    {
        with (instance_create(x, y, obj_dashCloud, 
        {
            playerID: id
        }))
        {
            playerID.dashCloudID = id;
            
            if (playerID.movespeed >= 8)
                sprite_index = spr_dashcloud2;
            else
                sprite_index = spr_dashCloud;
        }
    }
    
    if (sprite_index == spr_climbCeilingJump && animation_end())
        sprite_index = spr_climbCeilingFall;
    
    if (!grounded && sprite_index != spr_climbCeilingJump && sprite_index != spr_airdash2 && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump && sprite_index != spr_player_PZ_mach2_longJump_intro && sprite_index != spr_player_PZ_mach2_longJump && sprite_index != spr_player_PZ_bumped)
        sprite_index = mach_jumpsprite;
    
    if (animation_end())
    {
        if (sprite_index == spr_secondjump1)
            sprite_index = spr_secondjump2;
        
        if (sprite_index == spr_airdash1)
            sprite_index = spr_airdash2;
    }
    
    if (grounded && animation_end() && sprite_index == spr_rollgetup)
        sprite_index = spr_mach2;
    
    if (animation_end() && sprite_index == spr_player_PZ_mach2_longJump_intro)
        sprite_index = spr_player_PZ_mach2_longJump;
    
    do_taunt();
    do_grab();
    
    if (sprite_index == spr_rollgetup || sprite_index == spr_player_PZ_mach2_longJump_intro || sprite_index == spr_player_PZ_mach2_longJump || sprite_index == spr_suplexdash)
        image_speed = 0.4;
    else
        image_speed = abs(movespeed) / 15;
    
    if (grounded)
        upsideDownJump = false;
    
    if (character == UnknownEnum.Value_1 && key_up && inputBufferSlap > 0 && charged)
    {
        flash = true;
        inputBufferSlap = 0;
        alarm[0] = 240;
        image_index = 0;
        state = UnknownEnum.Value_58;
        sprite_index = spr_player_PN_superJump_prep;
    }
    
    if (character == UnknownEnum.Value_1)
    {
        if (key_jump > 0 && !can_jump && !grounded && !doubleJumped)
        {
            vsp = -11;
            sprite_index = spr_player_PN_machTwirl;
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
