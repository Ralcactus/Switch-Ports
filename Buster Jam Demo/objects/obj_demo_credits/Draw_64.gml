testvariablenothing = false;
draw_set_font(global.font_splash);
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
var _y = 750;
var _num = 0;
var _str = "THANK YOU FOR PLAYING!";
var _spd = 4.5;
var _strength = 3;
var _scale = 0.55;
var _x = (960 - ((string_width(_str) * _scale) / 2)) + 34;
draw_set_halign(fa_center);

for (var ii = 0; ii < string_length(_str); ii++)
{
    var _chr = string_char_at(_str, ii + 1);
    var _xoff;
    
    if (_cosX[_num])
        _xoff = dcos(time * pi * _spd) * _strength * random_range(0, 1);
    else
        _xoff = dsin(time * pi * _spd) * _strength * random_range(0, 1);
    
    var _yoff;
    
    if (_sinY[_num])
        _yoff = dsin(time * pi * _spd) * _strength * random_range(0, 1);
    else
        _yoff = dcos(time * pi * _spd) * _strength * random_range(0, 1);
    
    _yoff -= (((string_height(_chr) * 0.625) / 2) * (menu_scale - 1));
    _num++;
    
    if (_num > (array_length(_cosX) - 1))
        _num = 0;
    
    draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale, _scale, 0);
    _x += (string_width(_chr) * _scale);
}

draw_set_halign(fa_left);
draw_set_font(fnt_adlib_44);
draw_set_halign(fa_center);
draw_text(960, _y + 150, "- TALLGLASS (Vinny & Miles)");
gpu_set_texfilter(true);
draw_sprite_ext(spr_logo, 0, 960, 386, logo_scale_start * logo_scale, logo_scale_start * logo_scale, 0, c_white, 1);
gpu_set_texfilter(global.texfilter);
draw_set_halign(fa_right);
_x = 1840;
_y = 1020;
draw_set_alpha(glyph_alpha);
draw_text(_x - 50, _y - 30, "Title");
draw_set_alpha(1);
draw_set_halign(fa_right);
draw_sprite_ext(scr_get_glyph(spr_glyph_gp_cross), global.keyboard, _x, _y, 1, 1, 0, c_white, glyph_alpha);
draw_set_halign(fa_left);
