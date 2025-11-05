scr_collide();

if (instance_exists(pumpkin))
{
    nohit = true;
    nobounce = true;
    hurtplayer = false;
    sprite_index = spr_pumpkinjoe_idle;
}
else
{
    nohit = false;
    nobounce = false;
    hurtplayer = true;
    
    if (!chasing)
    {
        if (!spotted)
            sprite_index = spr_pumpkinjoe_outranidle;
        
        image_speed = 0.35;
        hsp = approach(hsp, 0, 0.25);
        
        if (check_in_rect(obj_player, x - 300, x + 300, y - 300, y + 300) && !spotted && player_collideable())
        {
            spotted = true;
            sprite_index = spr_pumpkinjoe_chasestart;
            image_index = 0;
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/pumpkinjoenotice", x, y);
        }
        
        if (sprite_index == spr_pumpkinjoe_chasestart)
        {
            if (obj_player.x != x)
                image_xscale = -sign(x - obj_player.x);
            
            if (sprite_animation_end())
            {
                chasing = true;
                sprite_index = spr_pumpkinjoe_chase;
                image_index = 0;
            }
        }
    }
    else
    {
        hit_horizontal = function(_h)
        {
            if (scr_destroy_horizontal(_h, obj_destroyablenitro))
                exit;
            
            vsp = -6;
            hsp = -3 * _h;
        };
        
        depth = approach(depth, 0, 1);
        
        if (sprite_index == spr_pumpkinjoe_chase)
        {
            if (obj_player.x != x)
                image_xscale = -sign(x - obj_player.x);
            
            hsp = approach(hsp, image_xscale * 4, 0.1);
            image_speed = 0.1 + max((abs(hsp) / 10) - 0.1, 0);
            
            if (floor(image_index) == 3 || floor(image_index) == 8)
            {
                if (!stepped)
                {
                    stepped = true;
                    scr_createparticle(true, x, bbox_bottom - 7, z + 4, spr_cloudeffect, image_xscale, 1, 0, 0.35, 0, 0, platspeedH, platspeedV);
                    
                    if (grounded && vsp >= 0)
                        scr_fmod_soundeffect(footstepsnd, x, y);
                }
            }
            else
                stepped = false;
        }
        
        if ((!check_in_rect(obj_player, x - 800, x + 800, y - 600, y + 600) && grounded && vsp >= 0) || !player_collideable())
        {
            chasing = false;
            spotted = false;
        }
    }
}

blendvalue = approach(blendvalue, 127 + (128 * !instance_exists(pumpkin)), 4.25);
image_blend = make_color_hsv(0, 0, blendvalue);
