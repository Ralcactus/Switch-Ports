testvariablenothing = false;

if (instance_exists(obj_options) || instance_exists(obj_credits) || instance_exists(obj_leaderboard) || instance_exists(obj_title_menu_newgame) || instance_exists(obj_title_menu_quit))
{
    if (instance_exists(obj_options))
    {
        draw_set_font(global.font_dialogue);
        _col = 3801123;
        
        if (selected == 1)
            _w = 940;
        else
            _w = 425;
        
        _yoff = 0;
        draw_set_alpha(0.5);
        draw_rectangle_color(0, 979 + _yoff, _w, 1080 + _yoff, _col, _col, _col, _col, false);
        draw_set_alpha(1);
        scr_draw_dialogue(20, 995 + _yoff, 99999, text_confirm, undefined, undefined, undefined, false);
    }
    
    exit;
}

if (draw_me)
{
    draw_set_font(global.font_splash);
    draw_set_halign(fa_left);
    var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
    var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
    var _num = 0;
    var _sep = 130;
    var _y = 158 + yoff;
    bar_y = easy_smooth(bar_y, _sep * selected, 2.5);
    draw_sprite_ext(spr_title_bar, 0, 0, (_y + bar_y) - 9, 1, 1, 0, c_white, 0.7);
    
    for (var i = 0; i < array_length(menu); i++)
    {
        var _scale = 0.625 * menu_scale[i];
        _str = menu[i];
        var _width = string_width(_str) * _scale;
        var _x = 60;
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
            {
                _xoff += (70 * selected_xoff);
                pal_swap(pal_font_title, 0, selected + 1);
            }
            
            if (menu_alpha[i])
                draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale, _scale, 0);
            
            if (selected != i && menu_alpha[i])
            {
                draw_set_color(c_black);
                draw_set_alpha(0);
                draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale, _scale, 0);
                draw_set_alpha(1);
                draw_set_color(c_white);
            }
            
            pal_swap_reset();
            _x += (string_width(_chr) * _scale);
        }
        
        if (i != (array_length(menu) - 1))
            _y += _sep;
    }
    
    draw_set_halign(fa_left);
    _yoff = dsin(time * pi) * 5;
    draw_sprite_ext(spr_title_graphic, selected, 1470, 540 + _yoff + yoff, graphic_scale, graphic_scale, 0, c_white, 1);
}

pattern_bar_x += 1;
var _w = sprite_get_width(spr_title_bar_pattern);
var _h = sprite_get_height(spr_title_bar_pattern);

if (pattern_bar_x >= _w)
    pattern_bar_x -= pattern_bar_x;

pattern_bar_x_behind += 0.75;

if (pattern_bar_x_behind >= _w)
    pattern_bar_x_behind -= pattern_bar_x_behind;

pattern_bar_x_behind = pattern_bar_x;
var _col_over = 3801123;
var _alpha = 1;

for (var i = 0; i < 14; i++)
{
    draw_sprite_ext(spr_title_bar_pattern, 0, (pattern_bar_x + (_w * i)) - _w, 0 - (bars_out * _h), 1, 1, 0, _col_over, _alpha);
    draw_sprite_ext(spr_title_bar_pattern, 1, -pattern_bar_x + (_w * i), (1080 - _h) + (bars_out * _h), 1, 1, 0, _col_over, _alpha);
}

draw_set_font(global.font_dialogue);
draw_set_halign(fa_center);
var _str = ["Story Mode", "Endless Mode (Demo)", "Options", "Support TALLGLASS and Buster Jam!", "Credits", "Quit Game"];
draw_text(960, 16 - (bars_out * _h), _str[selected]);
draw_set_halign(fa_left);
_w = string_width(desc[selected]) * desc_xscale;
draw_text_transformed(desc_x, 1004 + (bars_out * _h), desc[selected], desc_xscale, 0.8, 0);
draw_text_transformed(desc_x - 1, 1004 + (bars_out * _h), desc[selected], desc_xscale, 0.8, 0);
draw_text_transformed(desc_x + _w + desc_sep, 1004 + (bars_out * _h), desc[selected], desc_xscale, 0.79, 0);
draw_text_transformed((desc_x - 1) + _w + desc_sep, 1004 + (bars_out * _h), desc[selected], desc_xscale, 0.79, 0);
var _col = 3801123;

if (selected == 1)
    _w = 940;
else
    _w = 425;

var _yoff = bars_out * _h;
draw_rectangle_color(0, 979 + _yoff, _w, 1080 + _yoff, _col, _col, _col, _col, false);
draw_set_font(global.font_dialogue);
scr_draw_dialogue(20, 995 + _yoff, 99999, text_confirm, undefined, undefined, undefined, false);

if (!instance_exists(obj_leaderboard))
{
    with (obj_network_getstats)
        event_user(0);
}
