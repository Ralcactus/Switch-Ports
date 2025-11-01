testvariablenothing = false;
draw_set_font(global.font_splash);
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
var _num = 0;
var _str = "ARE YOU SURE?";
var _scale = 0.55;
var _xscale = 1;
var _width = string_width(_str);
var _x = 960 - ((_width * (_scale * _xscale)) / 2);
var _y = 140;
var _spd = 3;
var _strength = 2;

for (var ii = 0; ii < string_length(_str); ii++)
{
    var _chr = string_char_at(_str, ii + 1);
    var _xoff;
    
    if (_cosX[_num])
        _xoff = dcos(time * pi * _spd) * _strength * random_range(0, 1);
    else
        _xoff = dsin(time * pi * _spd) * _strength * random_range(0, 1);
    
    if (_sinY[_num])
        _yoff = dsin(time * pi * _spd) * _strength * random_range(0, 1);
    else
        _yoff = dcos(time * pi * _spd) * _strength * random_range(0, 1);
    
    _num++;
    
    if (_num > (array_length(_cosX) - 1))
        _num = 0;
    
    draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale * _xscale, _scale, 0);
    _x += (string_width(_chr) * _scale * _xscale);
}

var _yoff = 90;
var _sep = 130;
_y = (540 - ((array_length(options[menu]) * _sep) / 2)) + _yoff;

for (var i = 0; i < array_length(options[menu]); i++)
{
    _str = string_upper(options[menu][i]);
    
    if (string_length(_str) > 16)
        _xscale = 0.95;
    else
        _xscale = 1;
    
    _scale = 0.55 * menu_scale[i];
    _width = string_width(_str);
    _x = 960 - ((_width * (_scale * _xscale)) / 2);
    _spd = 4.5;
    _strength = 3;
    
    for (var ii = 0; ii < string_length(_str); ii++)
    {
        var _chr = string_char_at(_str, ii + 1);
        var _xoff;
        
        if (_cosX[_num])
            _xoff = dcos(time * pi * _spd) * _strength * random_range(0, 1);
        else
            _xoff = dsin(time * pi * _spd) * _strength * random_range(0, 1);
        
        if (_sinY[_num])
            _yoff = dsin(time * pi * _spd) * _strength * random_range(0, 1);
        else
            _yoff = dcos(time * pi * _spd) * _strength * random_range(0, 1);
        
        _yoff -= (((string_height(_chr) * 0.625) / 2) * (menu_scale[i] - 1));
        _num++;
        
        if (_num > (array_length(_cosX) - 1))
            _num = 0;
        
        if (selected == i)
            draw_set_color(c_yellow);
        
        if (menu_alpha[i])
            draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale * _xscale, _scale, 0);
        
        draw_set_color(c_white);
        
        if (selected != i && menu_alpha[i])
        {
            draw_set_color(c_black);
            draw_set_alpha(0);
            draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale * _xscale, _scale, 0);
            draw_set_alpha(1);
            draw_set_color(c_white);
        }
        
        _x += (string_width(_chr) * _scale * _xscale);
    }
    
    if (i != (array_length(options[menu]) - 1))
        _y += _sep;
}
