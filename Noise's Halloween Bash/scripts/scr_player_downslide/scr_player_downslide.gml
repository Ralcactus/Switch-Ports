function scr_player_downslide()
{
    hit_vertical = function(_v)
    {
        if (_v >= 0 && sprite_index == spr_player_downslidedive)
        {
            sprite_index = spr_player_downslide;
            slidetime = 18;
            scr_fmod_soundeffect(slidesnd, x, y);
        }
    };
    
    collide_destructibles = function(_h, _v)
    {
        scr_destroy_horizontal(_h);
        
        if (sprite_index == spr_player_downslidedive)
            scr_destroy_vertical(_v);
        
        if (sprite_index == spr_player_downslide && !prevGrounded)
            scr_destroybounce(1);
    };
    
    var ceilingcheck = check_ceiling();
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    dir = image_xscale;
    momentum = 0;
    
    if (grounded && on_slippery_slope() && vsp >= 0)
    {
        lastslipperyplat = instance_place(x, y + 1, obj_slipperyplatformslope);
        
        with (lastslipperyplat)
        {
            var slope_acceleration = (abs(image_yscale) / -image_xscale) * sign(other.image_xscale);
            slope_acceleration *= ((other.move == sign(image_xscale)) ? 0.25 : 0.75);
            
            if ((sign(slope_acceleration) > 0 && other.movespeed < 17) || (sign(slope_acceleration) < 0 && other.movespeed > -17))
                other.movespeed += slope_acceleration;
        }
    }
    
    if (movespeed < 14)
        movespeed = 14;
    
    if (sprite_index == spr_player_downslidedive && !ceilingcheck)
        hover();
    
    if (!input_check("down"))
        holdingdown = false;
    
    if (slidetime <= 0)
    {
        if (ceilingcheck)
            state = states.crouch;
        else if (grounded)
        {
            if (!holdingdown)
                state = states.normal;
            else
            {
                state = states.crouch;
                movespeed = clamp(movespeed, 0, 4);
                exit;
            }
        }
        else if (!input_check("down"))
        {
            state = states.jump;
            sprite_index = spr_player_jumpend;
            image_index = 0;
        }
        else
        {
            sprite_index = spr_player_downslidedive;
            vsp = 10;
            slidetime = 18;
        }
    }
    
    if (sprite_index == spr_player_downslide)
    {
        var _cond = true;
        var cloudspr = spr_jumpcloud;
        var cloudspd = 0.35;
        
        if (move != 0)
        {
            cloudspr = spr_longjumpcloud;
            cloudspd = 0.5;
        }
        else
        {
            cloudspr = spr_jumpcloud;
            cloudspd = 0.35;
        }
        
        if (ceilingcheck && grounded)
            _cond = scr_solid(x + image_xscale, y, [obj_solid, obj_oneWayWall]);
        
        if (_cond)
            slidetime = max(slidetime - 1, 0);
        
        if (slidetime > 8)
            vsp = 0;
        
        if (jumpbuffer > 0 && !ceilingcheck)
        {
            jumpbuffer = 0;
            jump();
            sprite_index = spr_player_downslidejump;
        }
        
        if (slidebuffer > 0 && !grounded)
        {
            sprite_index = spr_player_downslidedive;
            vsp = 10;
            slidetime = 18;
        }
        
        particlewithcooldown(7, true, x, bbox_bottom - 7, z + 4, spr_cloudeffect, 1, 1, 0, 0.5);
    }
    
    if (!grounded && sprite_index != spr_player_longjump && onslipperyplat && lastslipperyplat && sign(lastslipperyplat.image_xscale) == sign(hsp))
    {
        vsp = -movespeed;
        sprite_index = spr_player_longjump;
        jumpstop = 1;
        state = states.jump;
        image_index = 0;
        scr_fmod_soundeffect(longjumpsnd, x, y);
    }
    
    if (!ceilingcheck)
        attack();
    
    image_speed = 0.4;
}
