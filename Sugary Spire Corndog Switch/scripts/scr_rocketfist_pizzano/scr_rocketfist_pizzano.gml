function scr_rocketfist_pizzano()
{
    if (windingAnim < 2000)
        windingAnim++;
    
    machTwo = 100;
    move = key_left + key_right;
    vsp = 0;
    hsp = xscale * movespeed;
    machTwo++;
    
    if (sprite_index == spr_player_PN_sideSuperJump_prep && floor(image_index) == (image_number - 1))
    {
        image_index = 0;
        
        if (grounded)
        {
            if (movespeed > 16)
                sprite_index = spr_player_PN_sideSuperJump_mach4_grounded;
            else if (movespeed <= 16)
                sprite_index = spr_player_PN_mach3_fall;
        }
        else if (movespeed > 16)
        {
            sprite_index = spr_player_PN_sideSuperJump_mach4;
        }
        else if (movespeed <= 16)
        {
            sprite_index = spr_player_PN_sideSuperJump;
        }
        
        movespeed *= 1.5;
        flash = true;
    }
    else if (sprite_index != spr_player_PN_sideSuperJump_prep)
    {
        if (!key_up && !key_down)
            vsp = 0;
        
        move = key_left + key_right;
        
        if (movespeed > 12)
        {
            hsp = xscale * movespeed;
        }
        else
        {
            hsp = xscale * 12;
            movespeed = 12;
        }
        
        if (move != 0 && move == xscale)
        {
            if (movespeed < 24)
            {
                if (!machFourMode)
                    movespeed += 0.0375;
                else
                    movespeed += 0.15;
            }
        }
        
        if (movespeed > 16 && !machFourMode && sprite_index != spr_player_PN_sideSuperJump_mach4 && sprite_index != spr_player_PN_sideSuperJump_mach4_grounded && sprite_index != spr_player_PN_crouchSlip)
        {
            machFourMode = true;
            flash = true;
            
            if (!grounded)
                sprite_index = spr_player_PN_sideSuperJump_mach4;
            else
                sprite_index = spr_player_PN_sideSuperJump_mach4_grounded;
            
            with (instance_create(x, y, obj_slapstar))
            {
                hsp = random_range(-5, 5);
                vsp = random_range(-10, 10);
            }
        }
        else if (movespeed <= 16 && (sprite_index == spr_player_PN_sideSuperJump_mach4 || sprite_index == spr_player_PN_sideSuperJump_mach4_grounded))
        {
            machFourMode = false;
            
            if (!grounded)
                sprite_index = spr_player_PN_sideSuperJump;
            else
                sprite_index = spr_player_PN_sideSuperJump_grounded;
        }
        
        if (inputBufferJump > 0 && grounded)
        {
            state = UnknownEnum.Value_124;
            inputBufferJump = 0;
        }
        
        if (key_up)
            vsp = -5;
        
        if (key_down)
            vsp = 5;
        
        if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
        {
            vsp = -6;
            movespeed = -6;
            sprite_index = spr_player_PZ_hitWall_mach3;
            state = UnknownEnum.Value_67;
        }
        
        if (!grounded && hsp != 0 && sprite_index != spr_player_PN_sideSuperJump)
            sprite_index = spr_player_PN_sideSuperJump;
        
        if (inputBufferSlap > 0 && key_up && charged)
        {
            flash = true;
            inputBufferSlap = 0;
            alarm[0] = 240;
            image_index = 0;
            state = UnknownEnum.Value_58;
            sprite_index = spr_player_PN_superJump_prep;
        }
        
        if (key_down && grounded)
            sprite_index = spr_player_PN_crouchSlip;
        else if (!key_down && grounded && hsp != 0)
            sprite_index = spr_player_PN_sideSuperJump_grounded;
        
        if (key_jump2)
        {
            state = UnknownEnum.Value_64;
            doubleJumped = true;
            vsp = -10;
            sprite_index = spr_player_PN_doubleJump;
        }
        
        if (inputBufferSlap > 0)
        {
            image_index = 0;
            inputBufferSlap = 0;
            state = UnknownEnum.Value_51;
            sprite_index = spr_bodyslamstart;
            vsp = -6;
        }
        
        if (key_attack2)
        {
            image_index = 0;
            state = UnknownEnum.Value_64;
            sprite_index = spr_player_PN_mach2;
            vsp = -5;
        }
        
        if (!instance_exists(obj_crazyRunHoopEffect) && sprite_index == spr_crazyrun)
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
    }
    
    image_speed = 0.35;
    do_taunt();
}
