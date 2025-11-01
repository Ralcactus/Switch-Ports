var _width, _height;

if (has_splash)
{
    _width = game_width * scale_res;
    _height = game_height * scale_res;
}
else
{
    _width = 1920;
    _height = 1080;
}

if (!surface_exists(surf_splash))
    surf_splash = surface_create(_width, _height);

surface_set_target(surf_splash);
draw_clear_alpha(c_white, 0);
draw_set_font(global.font_splash);
draw_set_valign(fa_middle);
var _scale = 0.94;
var _str = string_upper(splash_text);
var _l = string_length(_str);
var _w = string_width(_str) * _scale;
var _x = (_width / 2) - (_w / 2);
var _amntX = choose(1, 2);
var _amntY = choose(1, 2);
var _ypos = _height * 0.43;

for (var i = 0; i < _l; i++)
{
    var _chr = string_char_at(_str, i + 1);
    draw_text_transformed(_x + random_range(-_amntX, _amntX), _ypos + random_range(-_amntY, _amntY), _chr, _scale, _scale, 0);
    _x += (string_width(_chr) * _scale);
}

draw_set_valign(fa_top);
surface_reset_target();
splash_percent = approach(splash_percent, 1, 0.05);
splash_scale = use_curve(acurv_splash, splash_percent, "out", 9, 0.85);
splash_yoff = use_curve(acurv_splash, splash_percent, "out", 453.6, 0);

if (splash_out)
    splash_alpha = approach(splash_alpha, 0, 0.15);
else
    splash_alpha = approach(splash_alpha, 1, 0.1);
