if (!surface_exists(surf_splash))
    surf_splash = surface_create(1920, 1080);

surface_set_target(surf_splash);

if (splash_go)
{
    var _width, _height;
    
    if (instance_exists(par_boss))
    {
        _width = 1920;
        _height = 1080;
    }
    else
    {
        _width = game_width;
        _height = game_height;
    }
    
    draw_set_font(global.font_splash);
    draw_set_valign(fa_middle);
    var _scale = 0.94;
    var _str = string_upper(splash_text);
    var _l = string_length(_str);
    var _w = string_width(_str) * _scale;
    var _x = (_width / 2) - (_w / 2);
    var _amntX = choose(1, 2);
    var _amntY = choose(1, 2);
    
    for (var i = 0; i < _l; i++)
    {
        var _chr = string_char_at(_str, i + 1);
        draw_text_transformed(_x + random_range(-_amntX, _amntX), (_height / 2) + random_range(-_amntY, _amntY), _chr, _scale, _scale, 0);
        _x += (string_width(_chr) * _scale);
    }
    
    draw_set_valign(fa_top);
}

surface_reset_target();
