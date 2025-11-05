function scr_player_normal()
{
    hit_horizontal = function(_h)
    {
        movespeed = 0;
        momentum = false;
    };
    
    var _analogue = input_value("left") + input_value("right");
    var _randomidle = sprite_index == spr_player_idle1 || sprite_index == spr_player_idle2;
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    jumpstop = 1;
    momentum = 0;
    
    if (sprite_index == spr_player_mach2land)
        sprite_index = spr_player_idle;
    
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
    
    if (move == 0)
    {
        if (!_randomidle)
            randomidletime--;
        
        if (!on_slippery_slope() || (onslipperyplat && abs(movespeed) < 9))
            movespeed = approach(movespeed, 0, 2 * decel);
        
        if (!landanim && !_randomidle && sprite_index != spr_player_movestop && sprite_index != spr_player_idle && !turning && (!onslipperyplat || (onslipperyplat && abs(movespeed) < 9)))
        {
            if (movestop)
                sprite_index = spr_player_movestop;
            else
                sprite_index = spr_player_idle;
            
            image_index = 0;
            momentum = 0;
        }
        
        if (sprite_index == spr_player_idle && randomidletime <= 0)
        {
            sprite_index = choose(spr_player_idle1, spr_player_idle2);
            image_index = 0;
            randomidletime = 240;
        }
        
        if (sprite_index == spr_player_movestop && sprite_animation_end())
        {
            sprite_index = spr_player_idle;
            image_index = 0;
            movestop = 0;
        }
        
        if (onslipperyplat && abs(movespeed) > 9)
        {
            landanim = false;
            
            if (sprite_index != spr_player_slide && sprite_index != spr_player_slidestart)
            {
                sprite_index = spr_player_slidestart;
                image_index = 0;
            }
            
            momentum = 1;
        }
        
        if (onslipperyplat && movespeed == 0 && (sprite_index == spr_player_slide || sprite_index == spr_player_slidestart))
        {
            sprite_index = spr_player_idle;
            momentum = 0;
        }
        
        image_speed = 0.35;
    }
    else
    {
        movestop = 1;
        
        if (movespeed < 8 || (movespeed > 8 && !momentum))
            movespeed = approach(movespeed, 8 * _analogue, 0.5 * decel);
        
        if (grounded && scr_solid(x + move, y, [obj_solid, obj_oneWayWall]))
        {
            movespeed = 0;
            dontcling = move;
        }
        
        if (grounded && !landanim && !turning && (!onslipperyplat || (onslipperyplat && abs(movespeed) < 9)))
        {
            if (_analogue < 1 && abs(movespeed) <= 4)
                sprite_index = spr_player_tiptoe;
            else
                sprite_index = onslipperyplat ? spr_player_slopmove : spr_player_move;
            
            momentum = 0;
        }
        
        if (onslipperyplat && abs(movespeed) > 9)
        {
            if (sprite_index != spr_player_slide && sprite_index != spr_player_slidestart)
            {
                sprite_index = spr_player_slidestart;
                image_index = 0;
            }
            
            landanim = false;
            momentum = 1;
        }
        
        image_xscale = move;
        
        if (sprite_index != spr_player_slide && sprite_index != spr_player_slidestart && !landanim)
            image_speed = 0.1 + max((abs(movespeed) / 15) - 0.1, 0);
        else
            image_speed = 0.35;
    }
    
    if (dir != image_xscale)
    {
        dir = image_xscale;
        movespeed = 1;
        turning = 1;
        landanim = 0;
        sprite_index = onslipperyplat ? spr_player_slopturn : spr_player_turn;
        image_index = 0;
    }
    
    if (turning && grounded)
        image_speed = 0.35;
    
    if ((sprite_index == spr_player_turn || sprite_index == spr_player_slopturn) && sprite_animation_end())
    {
        sprite_index = onslipperyplat ? spr_player_slopmove : spr_player_move;
        turning = 0;
        image_index = 0;
    }
    
    if ((sprite_index == spr_player_idle1 || sprite_index == spr_player_idle2) && sprite_animation_end())
        sprite_index = spr_player_idle;
    
    if (sprite_index == spr_player_slidestart && sprite_animation_end())
        sprite_index = spr_player_slide;
    
    if (move == 0)
    {
        if (input_check("dash"))
        {
            state = states.standstillrun;
            movestop = 0;
            landanim = 0;
            sprite_index = spr_player_runinplacestart;
            image_index = 0;
        }
        
        if (input_check("slide"))
        {
            slidebuffer = 0;
            state = states.crouch;
            sprite_index = spr_player_crouchstart;
        }
    }
    else
        downslide();
    
    if (grounded)
    {
        if (jumpbuffer > 0)
        {
            jumpbuffer = 0;
            jump();
        }
    }
    else
    {
        if (sprite_index != spr_player_longjump && onslipperyplat && lastslipperyplat && sign(lastslipperyplat.image_xscale) == sign(hsp))
        {
            vsp = -abs(movespeed);
            
            if (movespeed != 0)
            {
                image_xscale *= sign(movespeed);
                movespeed = abs(movespeed);
            }
            
            scr_fmod_soundeffect(longjumpsnd, x, y);
            dir = image_xscale;
            sprite_index = spr_player_longjump;
        }
        else
        {
            sprite_index = spr_player_fall;
            
            if (instance_exists(obj_playercape))
            {
                obj_playercape.sprite_index = spr_player_capeuptodown;
                obj_playercape.image_index = 2;
            }
        }
        
        jumpstop = 1;
        state = states.jump;
        image_index = 0;
    }
    
    attack();
    
    if (input_check("dash") && state == states.normal && move != 0 && !scr_solid(x + move, y, [obj_solid, obj_oneWayWall]))
    {
        state = states.sprint;
        turning = 0;
        
        if (movespeed <= 8)
            sprite_index = spr_player_mach1;
        else
            sprite_index = spr_player_mach2;
        
        image_index = 0;
        
        if (movespeed < 6)
            movespeed = 6;
    }
    
    if ((sprite_index == spr_player_land || sprite_index == spr_player_land2) && sprite_animation_end())
        landanim = 0;
    
    if (((sprite_index == spr_player_move || sprite_index == spr_player_slopmove) && (floor(image_index) == 3 || floor(image_index) == 7)) && move != 0)
    {
        if (!stepped)
        {
            stepped = true;
            scr_createparticle(true, x, bbox_bottom - 7, z + 4, spr_cloudeffect, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
            
            switch (standingsurface)
            {
                case standingsurface.grass:
                    scr_fmod_soundeffect(grassfootstepsnd, x, y);
                    break;
                
                case standingsurface.wood:
                    scr_fmod_soundeffect(woodfootstepsnd, x, y);
                    break;
                
                case standingsurface.metal:
                    scr_fmod_soundeffect(metalfootstepsnd, x, y);
                    break;
                
                case standingsurface.slop:
                    scr_fmod_soundeffect(slopfootstepsnd, x, y);
                    
                    repeat (3)
                        scr_createparticle(false, x + hsp, y + 45, depth - 8, spr_slopparticles, 1.25, 1.25, irandom(4), 0, irandom(360), 0.5, irandom_range(-hsp / 4, -hsp / 2), irandom_range(-5, -4));
                    
                    break;
                
                case standingsurface.generic:
                    scr_fmod_soundeffect(genericfootstep, x, y);
                    break;
            }
        }
    }
    else
        stepped = false;
}
