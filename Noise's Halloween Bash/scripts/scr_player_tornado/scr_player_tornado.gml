function scr_player_tornado()
{
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    
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
        if (!on_slippery_slope() || (onslipperyplat && movespeed < 9))
            movespeed = approach(movespeed, 0, 0.5 * decel);
    }
    else
    {
        movestop = 1;
        
        if (movespeed < 8 || (movespeed > 10 && !momentum))
            movespeed = approach(movespeed, 10 * _analogue, 0.5 * decel);
        
        if (scr_solid(x + move, y, [obj_solid, obj_oneWayWall]))
        {
            movespeed = 0;
            dontcling = move;
        }
        
        image_xscale = move;
    }
    
    if (dir != image_xscale)
    {
        dir = image_xscale;
        movespeed = 1;
    }
    
    if (!input_check("attack"))
        tornadoendbuffer--;
    
    if (grounded && jumpbuffer > 0)
    {
        jumpbuffer = 0;
        scr_fmod_soundeffect(jumpsnd, x, y);
        state = states.jump;
        vsp = -12;
        sprite_index = spr_player_jump;
        image_index = 0;
        jumpstop = 0;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
        event_stop(tornadosnd, 1);
    }
    
    if (tornadoendbuffer <= 0)
        state = states.normal;
    
    if (speedlinesobj == noone)
        speedlinesobj = instance_create_depth(x, y, z + 1, obj_speedlines);
    
    image_speed = 0.4;
}
