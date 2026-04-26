function state_player_minecart()
{
    move = key_left + key_right;
    var _xscale = xscale;
    
    if (place_meeting(x, y + 1, obj_minecartRail_Slope))
    {
        with (instance_place(x, y + 1, obj_minecartRail_Slope))
        {
            var slope_acceleration = abs(image_yscale) / abs(image_xscale);
            
            if (_xscale == sign(image_xscale))
            {
                if (other.movespeed > 5)
                    other.movespeed -= (0.15 * slope_acceleration);
            }
            else if (_xscale == -sign(image_xscale))
            {
                if (other.movespeed < 20)
                    other.movespeed += (0.2 * slope_acceleration);
            }
        }
    }
    
    if (move == 0 && movespeed < 5)
        movespeed += 0.05;
    else if (move != 0 && move != xscale && movespeed > 3 && dashpadBuffer <= 0)
        movespeed -= 0.05;
    
    if (move != 0 && move == xscale && movespeed < 14)
        movespeed += 0.075;
    
    movespeed = clamp(movespeed, 0, 15);
    hsp = xscale * movespeed;
    
    if (movespeed >= 14 && !instance_exists(obj_chargeEffect))
    {
        instance_create(x + (32 * xscale), y, obj_chargeEffect, 
        {
            playerID: id
        });
    }
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock) && !place_meeting(x + xscale, y, obj_chocofrog))
    {
        sprite_index = spr_player_PZ_hitWall_mach3;
        state = UnknownEnum.Value_67;
        hsp = 2.5 * -xscale;
        vsp = -3;
        machTwo = 0;
        image_index = 0;
        instance_create(x, y, obj_bombExplosionHarmless);
        
        for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
        {
            with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
                image_index = i;
        }
    }
    
    if (inputBufferJump > 0)
    {
        if (can_jump)
        {
            vsp = -10;
            sprite_index = spr_player_PZ_minecart_jump;
            image_index = 0;
        }
        else
        {
            state = UnknownEnum.Value_64;
            vsp = -12;
            sprite_index = spr_mach2jump;
            image_index = 0;
            
            with (instance_create(x, y + 8, obj_minedummycart))
            {
                image_xscale = other.xscale;
                movespeed = other.movespeed;
            }
        }
        
        inputBufferJump = 0;
    }
    
    var grounded_land_sprite = (movespeed >= 12) ? spr_player_PZ_minecart_fast_land : spr_player_PZ_minecart_land;
    var grounded_sprite = (movespeed >= 12) ? spr_player_PZ_minecart_fast : spr_player_PZ_minecart;
    
    if (grounded)
    {
        if (sprite_index != grounded_land_sprite && (sprite_index == spr_player_PZ_minecart_fall || sprite_index == spr_player_PZ_minecart_jump))
        {
            sprite_index = grounded_land_sprite;
            image_index = 0;
        }
        
        if (sprite_index == grounded_land_sprite && animation_end())
            sprite_index = grounded_sprite;
        
        if (sprite_index != grounded_sprite && (sprite_index == spr_player_PZ_minecart_fast || sprite_index == spr_player_PZ_minecart))
            sprite_index = grounded_sprite;
    }
    else if (sprite_index != spr_player_PZ_minecart_jump)
    {
        sprite_index = spr_player_PZ_minecart_fall;
    }
    else if (sprite_index == spr_player_PZ_minecart_jump && animation_end())
    {
        sprite_index = spr_player_PZ_minecart_fall;
    }
    
    if (sprite_index == spr_player_PZ_minecart_fast || sprite_index == spr_player_PZ_minecart)
        image_speed = clamp(movespeed / 24, 0.35, 0.6);
    else
        image_speed = 0.35;
}
