function scr_player_wall()
{
    collide_destructibles = function(_h, _v)
    {
        scr_destroy_horizontal(image_xscale, obj_destroyablenitro);
    };
    
    vsp = -movespeed;
    angle = 90 * image_xscale;
    
    if (sprite_index == spr_player_mach1)
    {
        if (sprite_animation_end())
            sprite_index = spr_player_mach2;
        
        image_speed = 0.35;
    }
    
    if (sprite_index == spr_player_mach2jump || sprite_index == spr_player_mach2fall)
        sprite_index = spr_player_mach2;
    
    if (sprite_index == spr_player_mach2)
        image_speed = abs(movespeed) / 15;
    
    if (sprite_index == spr_player_tornado)
        image_speed = 0.35;
    
    if (sprite_index == spr_player_mach2land && sprite_animation_end())
        sprite_index = spr_player_mach2;
    
    if (!scr_solid(x + image_xscale, y) || !input_check("dash") || scr_solid(x, y - 1) || sprite_index == spr_player_machslide || sprite_index == spr_player_mach2turn)
    {
        event_stop(cartwheelsnd, true);
        state = states.jump;
        sprite_index = spr_player_wallrunend;
        image_index = 0;
        jumpstop = 1;
        movespeed = 0;
    }
    else
    {
        if (attackbuffer > 0 && sprite_index != spr_player_tornado)
        {
            attackbuffer = 0;
            sprite_index = spr_player_tornado;
            scr_fmod_soundeffect(tornadosnd, x, y);
            image_index = 0;
            movespeed = 14;
        }
        
        if (sprite_index == spr_player_tornado && sprite_animation_end())
            sprite_index = spr_player_mach2fast;
    }
    
    if (jumpbuffer > 0)
    {
        jumpbuffer = 0;
        event_stop(tornadosnd, true);
        state = states.sprintjump;
        sprite_index = spr_player_longjump;
        scr_fmod_soundeffect(jumpsnd, x, y);
        vsp = -10;
        walljumptimer = 15;
        momentum = 1;
        
        switch (sprite_index)
        {
            case spr_player_mach1:
                movespeed = 4;
                break;
            
            case spr_player_mach2:
                movespeed = 8;
                break;
            
            case spr_player_tornado:
            case spr_player_mach2fast:
        }
        
        jumpstop = 0;
        image_index = 0;
        image_xscale *= -1;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, image_yscale, 0, 0.5, angle);
    }
}
