testvariablenothing = false;
gpu_set_texfilter(true);
draw_sprite_ext(spr_logo, 0, logo_x, logo_y + yoff, logo_scale_start * logo_scale, logo_scale_start * logo_scale, 0, c_white, 1);
gpu_set_texfilter(global.texfilter);
var _y = 821 + yoff;
var _col = 16777215;
draw_set_alpha(0.6);

if (press_any_alpha)
    draw_rectangle_color(0, _y, 1920, _y + 134, _col, _col, _col, _col, false);

draw_set_alpha(1);
draw_set_font(global.font_splash);
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
_y = 830;
var _num = 0;
var _str = "PRESS ANY KEY";
var _spd = 4.5;
var _strength = 3;
var _scale = 0.625;
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
    
    if (press_any_alpha)
        draw_text_transformed(_x + _xoff, _y + _yoff + yoff, _chr, _scale, _scale, 0);
    
    _x += (string_width(_chr) * _scale);
}

draw_set_halign(fa_left);
draw_sprite_ext(spr_version, 0, 40, 1028 + yoff, 1, 1, 0, c_white, copyright_alpha);
draw_sprite_ext(spr_copyright, 0, 960, 1028 + yoff, 1, 1, 0, c_white, copyright_alpha);
