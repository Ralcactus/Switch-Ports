if (!started)
{
    var _logox = get_game_width() - 16;
    var _konami = konamistep == konamilen;
    draw_sprite(spr_logo, _konami, _logox, 0);
    
    if (_konami && konamiexplosion <= sprite_get_number(spr_explosion))
    {
        draw_sprite(spr_explosion, konamiexplosion, _logox - (sprite_get_width(spr_logo) / 2), sprite_get_height(spr_logo) / 2);
        konamiexplosion += 0.5;
    }
    
    for (var _i = 0; _i < array_length(stars); _i++)
    {
        if (!stars[_i].active)
            continue;
        
        pal_swap_set(spr_titlestarpal, stars[_i].index, false);
        draw_sprite_ext(spr_titlestar, 0, 60 * _i, 0, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_titlestar, 1, 60 * _i, 0, 1, 1, 0, (hoveredstar == _i) ? c_white : c_black, 1);
        pal_swap_reset();
    }
    
    draw_set_font(global.font);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    if (hoveredstar != -1)
    {
        var _stardescx = 0;
        var _stardescy = 64;
        var _str = stars[hoveredstar].description;
        draw_set_alpha(0.5);
        draw_roundrect_colour(_stardescx, _stardescy, _stardescx + string_width_fancy(_str), _stardescy + string_height_fancy(_str), c_black, c_black, false);
        draw_set_alpha(1);
        draw_text_fancy(_stardescx, _stardescy, _str);
    }
    
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    var _x = (get_game_width() - optionswidth) / 2;
    var _y = get_game_height() - 48;
    
    for (var _i = 0; _i < array_length(options); _i++)
    {
        __draw_text_colour_hook(_x, _y, options[_i][0], c_white, c_white, c_white, c_white, (selected == _i) ? 1 : 0.5);
        _x += options[_i][2];
    }
    
    draw_set_font(global.speedruntimerfont);
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_right);
    __draw_text_hook(get_game_width() - 20, get_game_height() - 20, "V" + global.gamever);
    
    if (!is_latest())
    {
        draw_set_font(font_warning);
        var _warningposx = get_game_width() - 30;
        var _warningposy = get_game_height() - 60;
        var _str = string_get("menu/title/outdated", string("https://{0}.itch.io/noises-halloween-bash", global.itchname));
        draw_set_alpha(0.5);
        draw_roundrect_colour(_warningposx - string_width_fancy(_str) - 10, _warningposy - string_height_fancy(_str) - 10, _warningposx + 10, _warningposy + 10, c_black, c_black, false);
        draw_set_alpha(1);
        draw_text_fancy(_warningposx, _warningposy, _str);
    }
    
    pal_swap_set(obj_player.palettespr, obj_player.curpalette, false);
    draw_sprite_ext(spr_noisecolour, 0, get_game_width(), floor((get_game_height() - 34) + palindicatoryoff), 1, 1, 0, c_white, palindicatoralpha);
    pal_swap_reset();
}
