function scr_player_sprintjump()
{
    hit_horizontal = function(_h)
    {
        momentum = 0;
        
        if (!scr_solid(x + _h, y, obj_nostickwall))
            wallslide(_h);
    };
    
    hit_vertical = function(_v)
    {
        if (_v >= 0)
        {
            sprite_index = spr_player_mach2land;
            image_index = 0;
            scr_fmod_soundeffect(landsnd, x, y);
            state = states.sprint;
            scr_createparticle(true, x, y, z - 1, spr_landcloud, image_xscale, 1, 0, 0.5, 0, 0, platspeedH, platspeedV);
        }
    };
    
    collide_destructibles = function(_h, _v)
    {
        scr_destroybounce(_v);
    };
    
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    dir = image_xscale;
    var _mach2sprcond = sprite_index == spr_player_mach2jump || sprite_index == spr_player_mach2fall || sprite_index == spr_player_mach2fallturn;
    var _mach2fastsprcond = sprite_index == spr_player_mach2fastjumpstart || sprite_index == spr_player_mach2fastjumpend;
    
    if (sprite_index == spr_player_mach2jump && vsp < -10)
        image_index = 0;
    
    if (sprite_index != spr_player_mach2jump && sprite_index != spr_player_mach2fallturn && sprite_index != spr_player_mach2fastjumpstart && sprite_index != spr_player_mach2fastjumpend && sprite_index != spr_player_longjump && sprite_index != spr_player_longjumpend && sprite_index != spr_player_longjumpturn && sprite_index != spr_player_cratebounce && sprite_index != spr_player_fall && sprite_index != spr_player_secondjump && sprite_index != spr_player_secondjumpend && sprite_index != spr_player_secondjumpendturn && sprite_index != spr_player_cartwheel)
        sprite_index = spr_player_mach2fall;
    
    if (sprite_animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_mach2fallturn:
                sprite_index = spr_player_mach2fall;
                break;
            
            case spr_player_secondjump:
            case spr_player_secondjumpendturn:
                sprite_index = spr_player_secondjumpend;
                break;
            
            case spr_player_mach2jump:
                sprite_index = spr_player_mach2fall;
                break;
            
            case spr_player_longjump:
            case spr_player_longjumpturn:
                sprite_index = spr_player_longjumpend;
                break;
            
            case spr_player_cratebounce:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_mach2fastjumpstart:
            case spr_player_mach2fastjumpturn:
                sprite_index = spr_player_mach2fastjumpend;
                break;
        }
    }
    
    if (vsp < 0.5 && !input_check("jump") && !jumpstop)
        vsp = grav;
    
    if (jumpbuffer > 0 && coyotetime > 0 && hovertime >= hovermaxtime)
    {
        jumpbuffer = 0;
        jump();
        exit;
    }
    
    if (move != 0)
    {
        if (walljumptimer == 0)
        {
            momentum = 0;
            
            if (movespeed == 0 && move == -image_xscale)
                image_xscale = move;
            
            if (movespeed > 0 && move == -image_xscale)
                movespeed = approach(movespeed, 0, 1);
        }
        
        if (movespeed < 8 && move == image_xscale)
            movespeed = approach(movespeed, 8, 0.5);
    }
    else if (!momentum)
        movespeed = approach(movespeed, 0, 2);
    
    if (dir != image_xscale)
    {
        dir = image_xscale;
        
        if (sprite_index == spr_player_longjumpend)
        {
            sprite_index = spr_player_longjumpturn;
            image_index = 0;
        }
        
        if (sprite_index == spr_player_mach2fall)
        {
            sprite_index = spr_player_mach2fallturn;
            image_index = 0;
        }
        
        if (sprite_index == spr_player_secondjumpend)
        {
            sprite_index = spr_player_secondjumpendturn;
            image_index = 0;
        }
        
        if (sprite_index == spr_player_mach2fastjumpend)
        {
            sprite_index = spr_player_mach2fastjumpturn;
            image_index = 0;
        }
        
        if (sprite_index == spr_player_longjumpturn || sprite_index == spr_player_mach2fallturn || sprite_index == spr_player_secondjumpendturn || sprite_index == spr_player_mach2fastjumpturn)
            image_index = 0;
    }
    
    hover();
    
    if (move != 0)
        downslide();
    else if (slidebuffer > 0)
        groundpoundstart();
    
    if (speedlinesobj == noone && movespeed > 11)
        speedlinesobj = instance_create_depth(x, y, z + 1, obj_speedlines);
    
    if (instance_exists(speedlinesobj) && movespeed <= 11)
    {
        instance_destroy(speedlinesobj);
        speedlinesobj = noone;
    }
    
    attack();
}
