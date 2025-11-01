testvariablenothing = false;
draw_set_font(global.font_splash);
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
var _num = 0;
var _str = "WORLD 1";
var _scale = 0.465;
var _xscale = 1;
var _width = string_width(_str);
var _x = 960 - ((_width * (_scale * _xscale)) / 2);
var _y = 440;
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
    
    var _yoff;
    
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

_str = "BOOMTOWN, NEW YORK";
_scale = 0.55;
_xscale = 1;
_width = string_width(_str);
_x = 960 - ((_width * (_scale * _xscale)) / 2);
_y = 540;
_spd = 3;
_strength = 2;

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
    
    _num++;
    
    if (_num > (array_length(_cosX) - 1))
        _num = 0;
    
    draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale * _xscale, _scale, 0);
    _x += (string_width(_chr) * _scale * _xscale);
}
