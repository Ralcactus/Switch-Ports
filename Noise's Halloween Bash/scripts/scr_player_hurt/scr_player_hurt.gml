function scr_player_hurt()
{
    collide_destructibles = function(_h, _v)
    {
        scr_destroybounce(_v);
    };
    
    hsp = movespeed * image_xscale;
    
    if (grounded && vsp >= 0)
    {
        state = states.normal;
        scr_createparticle(true, x, y, z - 1, spr_landcloud, image_xscale, 1, 0, 0.5, 0, 0, platspeedH, platspeedV);
    }
    
    if (mach3crashtimer > 0)
    {
        mach3crashtimer = approach(mach3crashtimer, 0, 1);
        
        if (mach3crashtimer <= 0 && !grounded)
        {
            state = states.jump;
            sprite_index = spr_player_jumpend;
            image_index = 0;
        }
    }
    
    if (hurt)
    {
        alarm[0] = 60;
        alarm[1] = 3;
    }
    
    image_speed = 0.35;
}
