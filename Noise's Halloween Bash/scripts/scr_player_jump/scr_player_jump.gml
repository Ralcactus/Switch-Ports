function scr_player_jump()
{
    var _analogue = input_value("left") + input_value("right");
    
    hit_horizontal = function(_h)
    {
        momentum = 0;
        wallslide(_h);
    };
    
    hit_vertical = function(_v)
    {
        if (_v >= 0)
        {
            if (!canchangedir)
                movespeed = abs(movespeed);
            
            if (!input_check("dash"))
            {
                if (sign(hsp) != image_xscale && sign(hsp) != 0 && (sprite_index == spr_player_sidesomersault || sprite_index == spr_player_sidesomersaultend))
                {
                    state = states.normal;
                    image_xscale = sign(hsp);
                    dir = image_xscale;
                    turning = 1;
                    landanim = 0;
                    image_index = 0;
                    sprite_index = spr_player_turn;
                }
                else
                {
                    landanim = 1;
                    state = states.normal;
                    
                    if (move != 0)
                        sprite_index = spr_player_land2;
                    else
                        sprite_index = spr_player_land;
                }
            }
            else
            {
                if (sign(hsp) != image_xscale && sign(hsp) != 0 && (sprite_index == spr_player_sidesomersault || sprite_index == spr_player_sidesomersaultend))
                    image_xscale = sign(hsp);
                
                landanim = 1;
                state = states.sprint;
                sprite_index = spr_player_mach2land;
            }
            
            image_index = 0;
            jumpstop = 1;
            scr_fmod_soundeffect(landsnd, x, y);
            scr_createparticle(true, x, y, z - 1, spr_landcloud, image_xscale, 1, 0, 0.5, 0, 0, platspeedH, platspeedV);
        }
    };
    
    collide_destructibles = function(_h, _v)
    {
        scr_destroybounce(_v);
    };
    
    move = input_check_opposing("left", "right");
    
    if (canchangedir)
        hsp = movespeed * image_xscale;
    else if (move != 0)
        hsp = movespeed;
    else if (!momentum)
        hsp = approach(hsp, 0, 2);
    
    if (vsp < 0.5 && !input_check("jump") && !jumpstop)
        vsp = grav;
    
    if (move == 0)
    {
        if (!momentum)
            movespeed = approach(movespeed, 0, 2);
    }
    else
    {
        if (walljumptimer == 0)
            momentum = 0;
        
        if (canchangedir)
        {
            if (move == image_xscale && movespeed < 8)
                movespeed = approach(movespeed, 8 * _analogue, 0.5);
            
            if (hovering && movespeed > 8)
                movespeed = approach(movespeed, 8 * _analogue, 0.25);
            
            if (walljumptimer == 0)
                image_xscale = move;
        }
        else
        {
            if ((move == 1 && movespeed < 8) || (move == -1 && movespeed > -8))
                movespeed = approach(movespeed, 8 * move * _analogue, 0.5);
            
            if (hovering && ((move == 1 && movespeed > 8) || (move == -1 && movespeed < -8)))
                movespeed = approach(movespeed, 8 * move * _analogue, 0.25);
        }
    }
    
    if (dir != image_xscale)
    {
        dir = image_xscale;
        movespeed = 1;
        
        if (sprite_index == spr_player_fall || sprite_index == spr_player_crouchfall || sprite_index == spr_player_hover || sprite_index == spr_player_longjumpend || sprite_index == spr_player_walljump || sprite_index == spr_player_secondjumpend)
        {
            if (sprite_index == spr_player_fall)
                sprite_index = spr_player_fallturn;
            
            if (sprite_index == spr_player_crouchfall)
                sprite_index = spr_player_crouchfallturn;
            
            if (sprite_index == spr_player_hover)
                sprite_index = spr_player_hoverturn;
            
            if (sprite_index == spr_player_longjumpend)
                sprite_index = spr_player_longjumpturn;
            
            if (sprite_index == spr_player_walljump)
                sprite_index = spr_player_walljumpturn;
            
            if (sprite_index == spr_player_secondjumpend)
                sprite_index = spr_player_secondjumpendturn;
            
            image_index = 0;
        }
        
        if (sprite_index == spr_player_fallturn || sprite_index == spr_player_crouchfallturn || sprite_index == spr_player_hoverturn || sprite_index == spr_player_longjumpturn || sprite_index == spr_player_walljump || sprite_index == spr_player_secondjumpend)
            image_index = 0;
    }
    
    if (sprite_index == spr_player_jumppeak && vsp > 0)
        sprite_index = crouchjump ? spr_player_crouchjumpend : spr_player_jumpend;
    
    if (sprite_animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_jump:
                sprite_index = spr_player_jumppeak;
                break;
            
            case spr_player_jumpend:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_secondjump:
            case spr_player_secondjumpendturn:
                sprite_index = spr_player_secondjumpend;
                break;
            
            case spr_player_sidesomersault:
                sprite_index = spr_player_sidesomersaultend;
                break;
            
            case spr_player_crouchjumpend:
                sprite_index = spr_player_crouchfall;
                break;
            
            case spr_player_hoverstart:
                sprite_index = spr_player_hover;
                break;
            
            case spr_player_walljumpstart:
            case spr_player_walljump2start:
            case spr_player_walljumpturn:
                sprite_index = spr_player_walljump;
                break;
            
            case spr_player_wallslidecancelup:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_wallslidecanceldown:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_wallrunend:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_cratebounce:
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_fallturn:
                image_index = 0;
                sprite_index = spr_player_fall;
                break;
            
            case spr_player_crouchfallturn:
                image_index = 0;
                sprite_index = spr_player_crouchfall;
                break;
            
            case spr_player_hoverturn:
                image_index = 0;
                sprite_index = spr_player_hover;
                break;
            
            case spr_player_longjump:
            case spr_player_longjumpturn:
            case spr_player_downslidejump:
                image_index = 0;
                sprite_index = spr_player_longjumpend;
                break;
            
            case spr_player_hovercancel:
                image_index = 0;
                sprite_index = spr_player_fall;
                
                with (obj_playercape)
                    sprite_index = spr_player_capedown;
                
                break;
        }
    }
    
    hover();
    
    if (hovering)
    {
        canchangedir = 1;
        vsp = approach(vsp, 2, 0.48);
        hovertime = approach(hovertime, hovermaxtime, 1);
        
        if (vsp > 2)
            vsp = approach(vsp, 2, 0.5);
        
        if (!input_check("jump") || hovertime >= hovermaxtime)
        {
            hovering = 0;
            sprite_index = spr_player_hovercancel;
        }
    }
    
    if (jumpbuffer > 0 && coyotetime > 0 && hovertime >= hovermaxtime)
    {
        jumpbuffer = 0;
        jump();
    }
    
    attack();
    
    if (slidebuffer > 0)
    {
        if (input_check("dash") || ((sprite_index == spr_player_longjump || sprite_index == spr_player_longjumpend) && move != 0))
            dive();
        else
            groundpoundstart();
    }
    
    image_speed = 0.35;
}
