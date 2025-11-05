function scr_player_crouch()
{
    var ceilingcheck = check_ceiling();
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    jumpstop = 1;
    movestop = 0;
    landanim = 0;
    
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
    
    if (!grounded && sprite_index != spr_player_crouchfallbunny && sprite_index != spr_player_crouchfallbunnyturn)
        sprite_index = spr_player_crouchfallbunny;
    
    if (sprite_animation_end())
    {
        if (sprite_index == spr_player_crawlturn)
            sprite_index = spr_player_crawl;
        
        if (sprite_index == spr_player_crouchfallbunnyturn)
            sprite_index = spr_player_crouchfallbunny;
    }
    
    var turnspr = sprite_index == spr_player_crawlturn || (sprite_index == spr_player_crouchfallbunnyturn && !grounded);
    
    if (move == 0)
    {
        if (!on_slippery_slope() || (onslipperyplat && abs(movespeed) < 9))
            movespeed = approach(movespeed, 0, 1 * decel);
        
        if (grounded && !turnspr && (sprite_index != spr_player_crouchstart || (sprite_index == spr_player_crouchstart && sprite_animation_end())))
            sprite_index = spr_player_crouch;
        
        image_speed = 0.35;
    }
    else
    {
        movespeed = approach(movespeed, 4, 0.5 * decel);
        image_xscale = move;
        
        if (grounded && !turnspr)
            sprite_index = spr_player_crawl;
        
        image_speed = abs(movespeed) / 15;
        
        if (scr_solid(x + move, y, [obj_solid, obj_oneWayWall]))
            dontcling = move;
    }
    
    if (dir != image_xscale)
    {
        dir = image_xscale;
        movespeed = 2;
        
        if (!turnspr)
        {
            if (grounded)
                sprite_index = spr_player_crawlturn;
            else
                sprite_index = spr_player_crouchfallbunnyturn;
            
            image_index = 0;
        }
    }
    
    if (!input_check("slide") && grounded && !ceilingcheck)
    {
        state = states.normal;
        landanim = sprite_index == spr_player_crouchfallbunnyturn || sprite_index == spr_player_crouchfallbunny;
        
        if (landanim)
        {
            if (move != 0)
                sprite_index = spr_player_land2;
            else
                sprite_index = spr_player_land;
        }
        else
            sprite_index = spr_player_idle;
        
        image_index = 0;
    }
    
    if (input_check_pressed("attack") && grounded && !ceilingcheck)
    {
        state = states.grimace;
        sprite_index = spr_player_grimace;
        image_index = 0;
    }
    
    if (jumpbuffer > 0 && coyotetime > 0 && !ceilingcheck)
    {
        jumpbuffer = 0;
        scr_fmod_soundeffect(jumpsnd, x, y);
        state = states.jump;
        vsp = -15;
        sprite_index = spr_player_jump;
        image_index = 0;
        crouchjump = 1;
        jumpstop = 0;
        jumpnum = 0;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
    }
}
