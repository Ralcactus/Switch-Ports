function scr_player_grimace()
{
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    
    if (grounded)
        movespeed = approach(movespeed, 0, 0.5);
    
    if (grounded && jumpbuffer > 0 && image_index > 19)
    {
        jumpbuffer = 0;
        scr_fmod_soundeffect(jumpsnd, x, y);
        state = states.jump;
        vsp = -12;
        sprite_index = spr_player_jump;
        image_index = 0;
        jumpstop = 0;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
        event_stop(grimacesnd, 1);
    }
    
    if (sprite_animation_end())
        state = states.normal;
    
    if (floor(image_index) == 4 && !event_isplaying(grimacesnd))
        scr_fmod_soundeffect(grimacesnd, x, y);
    
    image_speed = 0.4;
}
