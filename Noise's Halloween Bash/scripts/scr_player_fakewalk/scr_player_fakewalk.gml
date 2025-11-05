function scr_player_fakewalk()
{
    if (instance_exists(obj_roomtransition) || instance_exists(obj_outhousetransition))
    {
        hsp = 0;
        vsp = 0;
        exit;
    }
    
    hsp = movespeed * image_xscale;
    move = image_xscale;
    dir = image_xscale;
    movestop = 1;
    
    if (movespeed < 8 || (movespeed > 8 && !momentum))
        movespeed = approach(movespeed, 8, 0.5 * decel);
    
    if (scr_solid(x + move, y, [obj_solid, obj_oneWayWall]))
        movespeed = 0;
    
    momentum = 0;
    
    if (sprite_index == spr_player_move)
        image_speed = 0.1 + max((abs(movespeed) / 15) - 0.1, 0);
    else
        image_speed = 0.175;
    
    fakewalktime--;
    
    if (fakewalktime <= 0)
    {
        fakewalktime = 0;
        state = states.normal;
    }
    
    if ((sprite_index == spr_player_move && (floor(image_index) == 3 || floor(image_index) == 7)) || (sprite_index == spr_player_tiptoe && (floor(image_index) == 2 || floor(image_index) == 6)))
    {
        if (!stepped)
        {
            stepped = true;
            scr_createparticle(true, x, bbox_bottom - 7, z + 4, spr_cloudeffect, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
            
            switch (standingsurface)
            {
                case standingsurface.grass:
                    scr_fmod_soundeffect(grassfootstepsnd, x, y);
                    break;
                
                case standingsurface.wood:
                    scr_fmod_soundeffect(woodfootstepsnd, x, y);
                    break;
                
                case standingsurface.slop:
                    scr_fmod_soundeffect(slopfootstepsnd, x, y);
                    
                    repeat (3)
                        scr_createparticle(false, x + hsp, y + 45, depth - 8, spr_slopparticles, 1.25, 1.25, irandom(4), 0, irandom(360), 0.5, irandom_range(-hsp / 4, -hsp / 2), irandom_range(-5, -4));
                    
                    break;
                
                case standingsurface.generic:
                    scr_fmod_soundeffect(genericfootstep, x, y);
                    break;
            }
        }
    }
    else
        stepped = false;
}
