testvariablenothing = false;
draw_set_font(global.font_splash);
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
var _num = 0;
var _yoff = 0;

if (menu == 1)
    _yoff = 120;

var _sep = 130;
var _y = (540 - ((array_length(options[menu]) * _sep) / 2)) + _yoff;

for (var i = 0; i < array_length(options[menu]); i++)
{
    var _str = string_upper(options[menu][i]);
    var _xscale;
    
    if (string_length(_str) > 16)
        _xscale = 0.95;
    else
        _xscale = 1;
    
    var _scale = 0.55 * menu_scale[i];
    var _width = string_width(_str);
    var _x = 960 - ((_width * (_scale * _xscale)) / 2);
    var _spd = 4.5;
    var _strength = 3;
    
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

if (menu == 1)
{
    draw_set_font(global.font_dialogue_outline);
    var _str = [];
    
    if (global.keyboard == 0)
        _str[0] = "Move: Arrows";
    else
        _str[0] = "Move: WASD";
    
    _str[1] = "Jump/Confirm: (Z";
    
    if (input_source_using(__input_global().__source_keyboard))
        _str[2] = "Action/Cancel: (X";
    else
        _str[2] = "Action: (X    Back: (B";
    
    _sep = 100;
    
    for (var j = 0; j < 3; j++)
    {
        var _x = 960 - (string_width(_str[j]) / 2);
        _y = 35 + (_sep * j);
        
        if (j == 2 && input_source_using(__input_global().__source_gamepad))
            _x += 30;
        
        for (var i = 0; i < string_length(_str[j]); i++)
        {
            var _moveX = choose(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
            var _moveY = choose(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
            _moveX *= choose(-1, 1);
            _moveY *= choose(-1, 1);
            var _chr = string_char_at(_str[j], i + 1);
            
            if (_chr == ":")
                _x += 6;
            
            var _glyph = -4;
            
            if (_chr == "(")
            {
                if (string_char_at(_str[j], i + 2) == "Z")
                {
                    if (input_source_using(__input_global().__source_keyboard))
                        _glyph = spr_glyph_kb_z;
                    else
                        _glyph = spr_glyph_gp_cross;
                }
                else if (string_char_at(_str[j], i + 2) == "X")
                {
                    if (input_source_using(__input_global().__source_keyboard))
                        _glyph = spr_glyph_kb_x;
                    else
                        _glyph = spr_glyph_gp_square;
                }
                else if (string_char_at(_str[j], i + 2) == "B")
                {
                    if (input_source_using(__input_global().__source_keyboard))
                        _glyph = spr_glyph_kb_x;
                    else
                        _glyph = spr_glyph_gp_circle;
                }
            }
            
            if (_glyph != -4)
            {
                draw_sprite_ext(_glyph, global.keyboard, _x + _moveX + 48, _y + _moveY + 36, 1, 1, 0, c_white, 1);
                i++;
            }
            else
            {
                draw_set_color(c_black);
                draw_text(_x + _moveX + 3, _y + _moveY + 3, _chr);
                draw_set_color(c_white);
                draw_text(_x + _moveX, _y + _moveY, _chr);
                _x += string_width(_chr);
            }
        }
    }
}
