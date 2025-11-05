function scr_player_wallslide()
{
    collide_destructibles = function(_h, _v)
    {
        scr_destroy_horizontal(image_xscale, obj_destroyablenitro);
        scr_destroybounce(_v);
    };
    
    move = input_check_opposing("left", "right");
    hsp = movespeed * image_xscale;
    dir = image_xscale;
    vsp -= 0.2;
    movespeed = 0;
    
    if (move == image_xscale)
        wallslidecanceltimer = 10;
    
    if (sprite_index == spr_player_wallslideup && vsp > 0)
    {
        sprite_index = spr_player_wallslideuptodown;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_wallslideuptodown && sprite_animation_end())
        sprite_index = spr_player_wallslidedown;
    
    if (sprite_index == spr_player_wallslidedown && vsp < 0)
        sprite_index = spr_player_wallslideup;
    
    if ((!scr_solid(x + image_xscale, y) || scr_solid(x + image_xscale, y, obj_nostickwall)) || (move != image_xscale && wallslidecanceltimer == 0))
    {
        state = states.jump;
        jumpstop = 1;
        image_index = 0;
        
        if (vsp < 0)
            sprite_index = spr_player_wallslidecancelup;
        else
        {
            sprite_index = spr_player_wallslidecanceldown;
            
            if (instance_exists(obj_playercape))
                obj_playercape.sprite_index = spr_player_capedown;
        }
    }
    
    if (jumpbuffer > 0)
    {
        jumpbuffer = 0;
        scr_createparticle(true, x, y, z + 4, spr_jumpcloud, image_xscale, image_yscale, 0, 0.5, (image_xscale == 1) ? 90 : -90);
        state = states.jump;
        momentum = 1;
        image_xscale *= -1;
        dir = image_xscale;
        
        switch (walljumpnum)
        {
            case 0:
                sprite_index = spr_player_walljumpstart;
                walljumpnum = 1;
                break;
            
            case 1:
                sprite_index = spr_player_walljump2start;
                walljumpnum = 0;
                break;
        }
        
        vsp = -11;
        movespeed = 9;
        walljumptimer = 15;
        jumpstop = 0;
        jumpnum = 1;
        image_index = 0;
        scr_fmod_soundeffect(jumpsnd, x, y);
    }
    
    if (grounded)
        state = states.normal;
    
    particlewithcooldown(15, true, x, y, z + 4, spr_cloudeffect, 1, 1, 0, 0.5);
    image_speed = 0.35;
}
