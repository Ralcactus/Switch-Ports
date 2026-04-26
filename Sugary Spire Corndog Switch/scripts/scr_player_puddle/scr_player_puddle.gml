function state_player_puddle()
{
    hsp = xscale * movespeed;
    
    if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
    {
        event_play_oneshot("event:/SFX/player/slipbump", x, y);
        create_particle(x, y, spr_bangEffect);
        xscale *= -1;
        sprite_index = spr_player_PZ_fall_outOfControl;
    }
    
    var _xscale = xscale;
    
    if (scr_slope_ext(x, y + 1) && !scr_solid_slope(x, y + 1) && vsp >= 0)
    {
        show_debug_message("Slopes");
        var slope_objs = [obj_slope, obj_slopePlatform];
        
        for (var i = 0; i < array_length(slope_objs); i++)
        {
            with (instance_place(x, y + 1, slope_objs[i]))
            {
                var slope_acceleration = abs(image_yscale) / abs(image_xscale);
                
                if (_xscale == sign(image_xscale))
                {
                    if (other.movespeed > 0)
                    {
                        other.movespeed -= (slope_acceleration / 2);
                    }
                    else
                    {
                        other.movespeed = 0;
                        show_debug_message("AHH");
                        other.xscale = -sign(image_xscale);
                    }
                }
                else if (_xscale == -sign(image_xscale))
                {
                    if (other.movespeed < 10)
                        other.movespeed += (slope_acceleration / 2);
                }
            }
        }
    }
    
    if (sprite_index == spr_player_PZ_slipSlide_intro || sprite_index == spr_player_PZ_fall_outOfControl)
    {
        if (grounded && vsp > -1 && !place_meeting(x + 1, y, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock))
        {
            if (sprite_index == spr_player_PZ_slipSlide_intro)
            {
                sprite_index = spr_player_PZ_fall_outOfControl;
                vsp = -7;
                movespeed /= 1.2;
                create_particle(x, y, spr_bangEffect);
                event_play_oneshot("event:/SFX/player/slipbump", x, y);
            }
            else
            {
                event_play_oneshot("event:/SFX/player/slipend", x, y);
                sprite_index = spr_player_PZ_slipSlide_end;
            }
            
            image_index = 0;
            image_speed = 0.35;
        }
    }
    else if (sprite_index == spr_player_PZ_slipSlide_end)
    {
        image_speed = 0.35;
        
        if (!scr_slope())
        {
            movespeed -= 0.5;
            
            if (movespeed <= 0)
                state = UnknownEnum.Value_1;
        }
        
        if (!grounded)
        {
            event_play_oneshot("event:/SFX/player/slip", x, y);
            sprite_index = spr_player_PZ_fall_outOfControl;
        }
    }
    
    if (animation_end() && (sprite_index == spr_player_PZ_slipSlide_intro || sprite_index == spr_player_PZ_slipSlide_end))
        image_speed = 0;
    else if (sprite_index == spr_player_PZ_fall_outOfControl)
        image_speed = clamp(movespeed / 15, 0.3, 1) * 0.6;
    else
        image_speed = 0.35;
}
