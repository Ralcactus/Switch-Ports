function scr_player_punch()
{
    collide_destructibles = function(_h, _v)
    {
        scr_destroybounce(_v);
    };
    
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    
    if (grounded && sprite_index != spr_player_walkpunch)
        movespeed = approach(movespeed, 0, 0.25);
    
    if (sprite_index == spr_player_walkpunch && move == 0)
        movespeed = approach(movespeed, 0, 0.25);
    
    if (punchair == 1)
        vsp = approach(vsp, 0, 1);
    
    if (grounded && jumpbuffer > 0 && image_index > 3)
    {
        jumpbuffer = 0;
        scr_fmod_soundeffect(jumpsnd, x, y);
        state = states.jump;
        vsp = -12;
        sprite_index = spr_player_jump;
        image_index = 0;
        jumpstop = 0;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
        event_stop(punchsnd, 1);
    }
    
    if (image_index > 3)
        hover();
    
    if (sprite_animation_end())
    {
        state = states.normal;
        lastpunch++;
        
        if (lastpunch > 2)
            lastpunch = 0;
        
        punchair = 0;
    }
    
    if (floor(image_index) == 2 && sprite_index == spr_player_punch3 && !event_isplaying(bitesnd))
        scr_fmod_soundeffect(bitesnd, x, y);
    
    if (!instance_exists(obj_player_punchhitbox) && image_index > 3)
    {
        with (instance_create_depth(x, y, depth, obj_player_punchhitbox))
            event_perform(ev_step, ev_step_end);
    }
    
    downslide();
    
    if (sprite_index != spr_player_punch3 && sprite_index != spr_player_walkpunch)
        image_speed = 0.7;
    else
        image_speed = 0.35;
}
