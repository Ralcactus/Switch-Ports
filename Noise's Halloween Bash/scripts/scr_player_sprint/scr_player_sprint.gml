function scr_player_sprint()
{
    hit_horizontal = function(_h)
    {
        if (sign(_h) == image_xscale && grounded)
        {
            if (!scr_solid(x, y + 1, [obj_slope, obj_slopePlatform]))
            {
                state = states.bump;
                sprite_index = spr_player_wallsplat;
                movespeed = 0;
                vsp = 0;
                scr_fmod_soundeffect(splatsnd, x, y);
                gamepadvibrate(0.3, 0, 17);
                image_index = 0;
            }
            else
                state = states.wall;
        }
    };
    
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    dir = image_xscale;
    var _mach1sprcond = sprite_index == spr_player_mach1;
    var _mach2sprcond = sprite_index == spr_player_mach2 || sprite_index == spr_player_mach2jump || sprite_index == spr_player_mach2fall || sprite_index == spr_player_mach2land;
    var _mach2fastsprcond = sprite_index == spr_player_mach2fast;
    
    if (sprite_animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_mach1:
            case spr_player_mach2land:
                sprite_index = spr_player_mach2;
                break;
        }
    }
    
    if (sprite_index == spr_player_mach2 && movespeed > 11)
        sprite_index = spr_player_mach2fast;
    
    if (sprite_index == spr_player_mach2fast && movespeed <= 11)
        sprite_index = spr_player_mach2;
    
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
    
    if (move == image_xscale)
    {
        if (movespeed < 11)
        {
            if (movespeed < 8)
                movespeed = approach(movespeed, 8, 0.25);
            else
                movespeed = approach(movespeed, 11, 0.05);
        }
    }
    else if (!mach4mode)
    {
        movespeed = approach(movespeed, 0, 0.5);
        
        if (movespeed <= 0)
            state = states.normal;
    }
    
    if (movespeed > 11 && !onslipperyplat)
        movespeed = approach(movespeed, 11, 0.125);
    
    if (onslipperyplat && movespeed >= 8)
        momentum = 1;
    
    if (jumpbuffer > 0 && coyotetime > 0)
    {
        jumpbuffer = 0;
        jump();
        exit;
    }
    
    if (move == -image_xscale)
    {
        state = states.machslide;
        sprite_index = spr_player_mach2turn;
        movespeed *= image_xscale;
        image_index = 0;
        image_xscale = -image_xscale;
        scr_fmod_soundeffect(skidsnd, x, y);
    }
    
    if (!input_check("dash") && move != image_xscale)
    {
        state = states.machslide;
        sprite_index = spr_player_machslide;
        image_index = 0;
    }
    
    if (!input_check("dash") && move == image_xscale)
    {
        state = states.normal;
        momentum = 0;
    }
    
    if (_mach2sprcond)
    {
        var imgspd = abs(movespeed) / 20;
        
        if (sprite_index != spr_player_mach2land)
            imgspd = abs(movespeed) / 20;
        else
            imgspd = 0.6;
        
        image_speed = imgspd;
    }
    else if (_mach1sprcond)
        image_speed = 0.35;
    else
        image_speed = 0.4;
    
    if (!grounded)
    {
        if (sprite_index != spr_player_longjump && onslipperyplat && lastslipperyplat && sign(lastslipperyplat.image_xscale) == sign(hsp))
        {
            vsp = -movespeed;
            sprite_index = spr_player_longjump;
            jumpstop = 1;
            state = states.jump;
            image_index = 0;
            scr_fmod_soundeffect(longjumpsnd, x, y);
        }
        else
        {
            state = states.sprintjump;
            
            if (sprite_index != spr_player_mach2fast)
                sprite_index = spr_player_mach2fall;
            else
                sprite_index = spr_player_mach2fastjumpend;
        }
    }
    
    downslide();
    
    if (_mach1sprcond)
        dashcloudparticle();
    
    if (_mach2sprcond)
        dashcloud2particle();
    
    if (sprite_index == spr_player_mach2fast)
        dashcloudfastparticle();
    
    if (speedlinesobj == noone && movespeed > 11)
        speedlinesobj = instance_create_depth(x, y, z + 1, obj_speedlines);
    
    if (instance_exists(speedlinesobj) && movespeed <= 11)
    {
        instance_destroy(speedlinesobj);
        speedlinesobj = noone;
    }
    
    if ((sprite_index == spr_player_mach1 || sprite_index == spr_player_mach2) && grounded && (on_slippery_slope() || onslipperyplat) && vsp >= 0)
    {
        slopfootsteptime--;
        
        if (slopfootsteptime <= 0)
        {
            slopfootsteptime = 10 - (abs(hsp) * 0.01);
            scr_fmod_soundeffect(slopfootstepsnd, x, y);
        }
    }
    
    attack();
}
