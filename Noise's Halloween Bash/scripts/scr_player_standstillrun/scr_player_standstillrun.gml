function scr_player_standstillrun()
{
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    movespeed = approach(movespeed, 0, 1 * decel);
    standstillrun = approach(standstillrun, 1, 0.03);
    
    if (sprite_index == spr_player_runinplacestart && sprite_animation_end())
        sprite_index = spr_player_runinplace;
    
    if (grounded && vsp >= 0 && move != 0)
    {
        state = states.sprint;
        turning = 0;
        sprite_index = spr_player_mach2;
        image_index = 0;
        movespeed = max(6, movespeed, 10 * standstillrun);
        scr_createparticle(true, x, y, z + 4, spr_jumpdust, image_xscale);
    }
    
    if (jumpbuffer > 0 && coyotetime > 0)
    {
        jumpbuffer = 0;
        jump();
    }
    
    if (!input_check("dash"))
    {
        if (grounded && vsp >= 0)
        {
            state = states.normal;
            sprite_index = spr_player_movestop;
            image_index = 0;
            movestop = 1;
        }
        else
        {
            state = states.jump;
            sprite_index = spr_player_fall;
        }
    }
    
    downslide();
    
    if (standstillrun == 1 && (floor(image_index) % 2) == 1)
    {
        if (!stepped)
            scr_createparticle(true, x - (24 * image_xscale), bbox_bottom - 7, z + 4, spr_cloudeffect, image_xscale, 1, 0, 0.35, 0, 0, platspeedH - (random_range(1, 2) * image_xscale), platspeedV - random(0.5));
        
        stepped = true;
    }
    else
        stepped = false;
}
