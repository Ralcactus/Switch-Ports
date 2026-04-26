draw_set_color(c_white);
draw_self();
draw_sprite(sprite_index, 2, x, y);
var w = sprite_get_width(sprite_index);
var h = sprite_get_height(sprite_index);
var x1 = sprite_get_xoffset(sprite_index);
var y1 = sprite_get_yoffset(sprite_index);

if (fade < 1)
{
    if (!surface_exists(surf))
        surf = surface_create(w, h);
    
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    draw_set_color(c_white);
    var i = array_length(details) - 1;
    
    while (i >= 0)
    {
        var _layer = details[i];
        
        with (_layer)
        {
            var my_height = sprite_get_height(sprite_index);
            
            if (dbg)
                trace(i, ", SPR: ", sprite_get_name(sprite_index), ", IDX: ", image_index);
            
            x += hspeed;
            y += vspeed;
            image_index += image_speed;
            
            if (func != -4)
                func();
            
            draw_sprite_tiled_ext(sprite_index, image_index, xstart + x, ystart + y + (h - my_height), image_xscale, image_yscale, image_blend, image_alpha);
        }
        
        i--;
    }
    
    gpu_set_blendmode(bm_subtract);
    draw_sprite(sprite_index, 1, sprite_xoffset, sprite_yoffset);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    draw_surface(surf, x - x1, y - y1);
}

if (fade > 0)
    draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, image_blend, fade);

if (showtext)
{
    draw_set_font(global.smallfont);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    ini_open("saveData.ini");
    draw_text(x, y - 252, string(ini_read_string("Highscore", string(level), 0)) + " POINTS - " + string(ini_read_string("Laps", string(level), 0)) + " LAPS");
    draw_text(x, y - 278, ini_read_string("Secret", string(level), 0) + " OF 3 SECRETS");
    
    for (var i = 0; i < 5; i++)
    {
        var x_pos = -100 + (50 * i);
        var collected = ini_read_string("Confecti", string(level) + string(i + 1), 0);
        
        if (!collected)
            draw_sprite_ext_flash(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 328, 1, 1, 0, 0, 1);
        else
            draw_sprite_ext(confecti_sprs[i].sprite, confecti_sprs[i].image, x + x_pos, y - 328, 1, 1, 0, c_white, 1);
    }
    
    var _rank = ini_read_string("Ranks", string(level), 0);
    var _rankspr = spr_null;
    
    switch (_rank)
    {
        case "p":
            _rankspr = spr_rankbubble_pfilled;
            break;
        
        case "s":
            _rankspr = spr_rankbubble_sfilled;
            break;
        
        case "a":
            _rankspr = spr_rankbubble_a;
            break;
        
        case "b":
            _rankspr = spr_rankbubble_b;
            break;
        
        case "c":
            _rankspr = spr_rankbubble_c;
            break;
        
        case "d":
            _rankspr = spr_rankbubble_d;
            break;
        
        default:
            _rankspr = spr_null;
            break;
    }
    
    draw_sprite_ext(_rankspr, 0, x - 32, y - 218, 1, 1, 0, c_white, 1);
    ini_close();
}
