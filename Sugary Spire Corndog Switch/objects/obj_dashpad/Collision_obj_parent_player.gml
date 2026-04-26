if (other.state == UnknownEnum.Value_65)
{
    with (other)
    {
        movespeed += 0.25;
        movespeed = clamp(movespeed, 12, 24);
    }
}

if (other.dashpadBuffer <= 0)
{
    with (other)
    {
        if (state != UnknownEnum.Value_59 && state != UnknownEnum.Value_20 && state != UnknownEnum.Value_100 && state != UnknownEnum.Value_60 && state != UnknownEnum.Value_146 && state != UnknownEnum.Value_147 && state != UnknownEnum.Value_148 && state != UnknownEnum.Value_79 && state != UnknownEnum.Value_78 && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
        {
            movespeed += 0.25;
            movespeed = clamp(movespeed, 12, 24);
            event_play_multiple("event:/SFX/general/dashpad", x, y);
            
            if (character == UnknownEnum.Value_0 || character == UnknownEnum.Value_3)
            {
                dashpadBuffer = 25;
                state = UnknownEnum.Value_65;
                
                if (sprite_index != spr_machdashpad)
                {
                    sprite_index = spr_machdashpad;
                    image_index = 0;
                }
                
                xscale = sign(other.image_xscale);
                var try_y = 0;
                
                while (try_y <= 16)
                {
                    if (scr_solid(x, other.y - try_y))
                    {
                        try_y++;
                    }
                    else
                    {
                        y = other.y - try_y;
                        break;
                    }
                }
                
                if (state != UnknownEnum.Value_11 && !scr_solid(other.x, y))
                    x = other.x;
                
                vsp = 3;
                flash = true;
            }
            else if (character == UnknownEnum.Value_1)
            {
                state = UnknownEnum.Value_65;
                dashpadBuffer = 25;
                
                if (sprite_index != spr_machdashpad)
                {
                    sprite_index = spr_machdashpad;
                    image_index = 0;
                }
                
                xscale = sign(other.image_xscale);
                var try_y = 0;
                
                while (try_y <= 16)
                {
                    if (scr_solid(x, other.y - try_y))
                    {
                        try_y++;
                    }
                    else
                    {
                        y = other.y - try_y;
                        break;
                    }
                }
                
                image_index = 0;
                flash = true;
            }
        }
        else if (state == UnknownEnum.Value_100 && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
        {
            xscale = sign(other.image_xscale);
            movespeed += 4;
            movespeed = clamp(movespeed, 14, 24);
            event_play_multiple("event:/SFX/general/dashpad", x, y);
            
            if (!scr_solid(other.x, y))
                x = other.x;
            
            flash = true;
            dashpadBuffer = 50;
            image_index = 0;
            sprite_index = spr_player_PZ_minecart_fast_land;
        }
        else if ((state == UnknownEnum.Value_146 || state == UnknownEnum.Value_147 || state == UnknownEnum.Value_148) && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
        {
            event_play_multiple("event:/SFX/general/dashpad", x, y);
            state = UnknownEnum.Value_146;
            
            if (!scr_solid(other.x, y))
                x = other.x;
            
            flash = true;
            dashpadBuffer = 25;
            xscale = sign(other.image_xscale);
            image_index = 0;
            movespeed = 20 * xscale;
        }
    }
}
