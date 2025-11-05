function scr_player_groundpound()
{
    hit_vertical = function(_v)
    {
        if (_v >= 0 && sprite_index == spr_player_groundpound)
        {
            sprite_index = spr_player_groundpoundland;
            image_index = 0;
            movespeed = 0;
            hsp = 0;
            shakecam(20, 5);
            gamepadvibrate(0.3, 0, 12);
            scr_fmod_soundeffect(slamsnd, x, y, z);
            scr_createparticle(true, x, y, z - 3, spr_groundpoundeffect, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
        }
    };
    
    collide_destructibles = function(_h, _v)
    {
        scr_destroy_horizontal(_h);
        
        if (sprite_index == spr_player_groundpound)
        {
            scr_destroy_vertical(_v * 2);
            scr_destroybounce(_v * 2, par_bouncysolid);
        }
    };
    
    if (sprite_index == spr_player_groundpoundstart && sprite_animation_end())
    {
        sprite_index = spr_player_groundpound;
        image_index = 0;
        vsp = 23;
    }
    
    if (sprite_index == spr_player_groundpoundland)
    {
        if (jumpbuffer > 0 && coyotetime > 0)
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
        
        if (attackbuffer > 0 && coyotetime > 0)
        {
            attackbuffer = 0;
            slidetime = 18;
            
            if (move != 0)
                image_xscale = move;
            
            if (state == states.punch)
                event_stop(punchsnd, 1);
            
            if (state == states.cartwheel)
                event_stop(cartwheelsnd, 1);
            
            state = states.downslide;
            scr_createparticle(true, x, y, z + 4, spr_jumpdust, image_xscale);
            
            if (grounded)
            {
                sprite_index = spr_player_downslide;
                scr_fmod_soundeffect(slidesnd, x, y);
            }
            else
            {
                sprite_index = spr_player_downslidedive;
                vsp = 10;
            }
            
            image_index = 0;
            holdingdown = true;
            
            if (movespeed < 14)
                movespeed = 14;
        }
        
        if (sprite_animation_end())
            state = states.normal;
    }
    
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    dir = image_xscale;
    momentum = 0;
    
    if (sprite_index == spr_player_groundpound)
    {
        movespeed = 0;
        
        if (!instance_exists(obj_groundpoundlines) && vsp >= 10)
            instance_create_depth(x, y, depth + 1, obj_groundpoundlines);
    }
    else
        movespeed = approach(movespeed, 0, 2);
    
    if (sprite_index == spr_player_groundpound && input_check_pressed("attack"))
        punch();
    
    image_speed = 0.4;
}
