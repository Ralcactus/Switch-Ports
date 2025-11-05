function scr_player_machslide()
{
    hit_horizontal = function(_h)
    {
        movespeed = 0;
    };
    
    collide_destructibles = function(_h, _v)
    {
        if (!grounded)
            scr_destroybounce(_v);
    };
    
    var machturn = sprite_index == spr_player_mach2turn;
    move = input_check_opposing("left", "right");
    
    if (!machturn)
        hsp = movespeed * image_xscale;
    else
        hsp = movespeed;
    
    if (!on_slippery_slope())
    {
        if (!machturn)
            movespeed = approach(movespeed, 0, 0.4);
        else
            movespeed = approach(movespeed, 0, 1);
    }
    
    if (grounded && on_slippery_slope() && vsp >= 0)
    {
        lastslipperyplat = instance_place(x, y + 1, obj_slipperyplatformslope);
        
        with (lastslipperyplat)
        {
            var slope_acceleration = (abs(image_yscale) / -image_xscale) * sign(other.image_xscale);
            slope_acceleration *= 0.25;
            
            if ((sign(slope_acceleration) > 0 && other.movespeed < 17) || (sign(slope_acceleration) < 0 && other.movespeed > -17))
                other.movespeed += slope_acceleration;
        }
    }
    
    if (onslipperyplat && move != 0 && sprite_index != spr_player_mach2turn)
        state = states.normal;
    
    if (jumpbuffer > 0)
    {
        jumpbuffer = 0;
        state = states.jump;
        
        if (sprite_index != spr_player_machslide)
            image_xscale = -image_xscale;
        
        sprite_index = spr_player_sidesomersault;
        image_index = 0;
        dir = image_xscale;
        canchangedir = 0;
        jumpstop = 0;
        movespeed = abs(movespeed) * move;
        vsp = -13;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
        scr_fmod_soundeffect(jumpsnd, x, y);
    }
    
    if (sprite_index == spr_player_mach2turn)
    {
        if (move == -image_xscale)
        {
            image_index = 1;
            image_xscale = move;
        }
        
        if (sprite_animation_end())
        {
            if (move == image_xscale)
            {
                state = states.sprint;
                sprite_index = spr_player_mach2;
                movespeed = 8;
            }
            else
                state = states.normal;
        }
    }
    
    if (sprite_index == spr_player_machslide && movespeed <= 0)
    {
        sprite_index = spr_player_movestop;
        image_index = 0;
        state = states.normal;
        movestop = 1;
    }
    
    if (grounded)
    {
        if (sprite_index == spr_player_mach2turn)
            dashcloudparticle();
    }
    
    image_speed = 0.35;
}
