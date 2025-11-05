function scr_player_cartwheel()
{
    hit_horizontal = function(_h)
    {
        momentum = 0;
        
        if (scr_solid(x, y + 1, [obj_slope, obj_slopePlatform]) && grounded && sign(_h) == image_xscale)
            state = states.wall;
        else
        {
            state = states.bump;
            sprite_index = spr_player_wallsplat;
            event_stop(tornadosnd, 1);
            movespeed = 0;
            vsp = 0;
            gamepadvibrate(0.3, 0, 3);
            scr_fmod_soundeffect(splatsnd, x, y);
            image_index = 0;
        }
    };
    
    collide_destructibles = function(_h, _v)
    {
        scr_destroy_horizontal(_h * 2);
        
        if (!prevGrounded)
            scr_destroy_vertical(_v);
    };
    
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    
    if (grounded && on_slippery_slope() && vsp >= 0)
    {
        lastslipperyplat = instance_place(x, y + 1, obj_slipperyplatformslope);
        
        with (lastslipperyplat)
        {
            var slope_acceleration = (abs(image_yscale) / -image_xscale) * sign(other.image_xscale);
            slope_acceleration *= ((other.move == sign(image_xscale)) ? 0 : 0.75);
            
            if ((sign(slope_acceleration) > 0 && other.movespeed < 17) || (sign(slope_acceleration) < 0 && other.movespeed > -17))
                other.movespeed += slope_acceleration;
        }
    }
    
    momentum = onslipperyplat && abs(movespeed) > 9;
    
    if (vsp < 0.5 && !input_check("jump") && !jumpstop)
        vsp = grav;
    
    if (jumpbuffer > 0 && coyotetime > 0)
    {
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
        
        jumpnum = 1;
        jumpbuffer = 0;
        state = states.sprintjump;
        sprite_index = spr_player_longjump;
        image_index = 0;
        jumpstop = 0;
        vsp = -12 - clamp(movespeed - 14, 0, 1);
        scr_fmod_soundeffect(jumpsnd, x, y);
        longjumptimer = 0;
        event_stop(tornadosnd, 1);
        scr_createparticle(true, x, y, z + 4, cloudspr, image_xscale, 1, 0, cloudspd, 0, 0, platspeedH, platspeedV);
    }
    
    hover();
    
    if (sprite_animation_end())
    {
        if (movespeed > 14 && !momentum)
            movespeed = 14;
        
        image_index = 0;
        
        if (grounded && vsp >= 0)
        {
            state = states.sprint;
            sprite_index = spr_player_mach2;
        }
        else
        {
            state = states.sprintjump;
            sprite_index = spr_player_mach2fall;
        }
    }
    
    if (!grounded && onslipperyplat && lastslipperyplat && sign(lastslipperyplat.image_xscale) == sign(hsp))
    {
        vsp = -movespeed;
        
        if (movespeed != 0)
        {
            image_xscale *= sign(movespeed);
            movespeed = abs(movespeed);
        }
        
        scr_fmod_soundeffect(longjumpsnd, x, y);
        dir = image_xscale;
        sprite_index = spr_player_longjump;
        jumpstop = 1;
        state = states.jump;
        image_index = 0;
    }
    
    downslide();
    tornadodashcloud2particle();
    
    if (speedlinesobj == noone)
        speedlinesobj = instance_create_depth(x, y, z + 1, obj_speedlines);
    
    image_speed = 0.35;
}
