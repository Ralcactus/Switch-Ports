testvariablenothing = false;
draw_set_font(global.font_splash);
var _y = 50;
_y = 70;
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
var _num = 0;
var _str;

if (highscore)
{
    _str = "NEW HIGHSCORE!";
    draw_set_color(c_yellow);
}
else
{
    _str = "GAME OVER";
}

var _scale = 0.55;
_scale = 0.7;
var _xscale = 1;
var _width = string_width(_str);
var _x = 960 - ((_width * (_scale * _xscale)) / 2) - (options_in * options_in_xoff);
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

draw_set_color(c_white);
var _zeros;

if (room == rm_endless)
    _zeros = 3;
else
    _zeros = 2;

_str = string_add_zeros(global.games_beat, _zeros);
_scale = 1.3;
_xscale = 1;
_width = string_width(_str);
_x = 960 - ((_width * (_scale * _xscale)) / 2) - (options_in * options_in_xoff);
_y += 130;
draw_set_font(global.font_splash);

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

draw_set_font(global.font_splash);
var _max = array_length(options[0]);
var _sep;

if (_max == 3)
    _sep = 60;
else
    _sep = 110;

var _sprW = sprite_get_width(spr_frenzy_gameover_buttons);
var _sprH = sprite_get_height(spr_frenzy_gameover_buttons);
var _w = (_sprW * _max) + (_sep * (_max - 1));
_x = (960 - (_w / 2)) + (_sprW / 2);
_y = 910;

for (var i = 0; i < _max; i++)
{
    var _ind;
    
    if (_max == 2 && i == 1)
        _ind = 2;
    else
        _ind = i;
    
    draw_sprite_ext(spr_frenzy_gameover_buttons, _ind, _x + (options_in * options_in_xoff), _y, menu_scale[i], menu_scale[i], 0, c_white, 1);
    _x += (_sprW + _sep);
}

_x = (960 - (_w / 2)) + (_sprW / 2) + ((_sprW + _sep) * select_ease) + (options_in * options_in_xoff);
var _off = 16;
draw_sprite_ext(spr_frenzy_gameover_button_select, 0, (_x - (_sprW / 2) - select_in) + _off, (_y - (_sprH / 2) - select_in) + _off, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_frenzy_gameover_button_select, 1, (_x + (_sprW / 2) + select_in) - _off, (_y - (_sprH / 2) - select_in) + _off, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_frenzy_gameover_button_select, 2, (_x + (_sprW / 2) + select_in) - _off, (_y + (_sprH / 2) + select_in) - _off, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_frenzy_gameover_button_select, 3, (_x - (_sprW / 2) - select_in) + _off, (_y + (_sprH / 2) + select_in) - _off, 1, 1, 0, c_white, 1);
