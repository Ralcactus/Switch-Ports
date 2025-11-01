testvariablenothing = false;

with (obj_leaderboard_bg)
    event_user(0);

draw_set_font(fnt_adlib_44);
var _spr;

if (instance_exists(obj_pfp_picker))
{
    with (obj_pfp_picker)
        event_user(0);
    
    if (input_source_using(__input_global().__source_keyboard))
        _spr = spr_glyph_kb_z;
    else
        _spr = spr_glyph_gp_cross;
    
    _x = 65;
    _y = 977;
    draw_sprite_ext(_spr, global.keyboard, _x, _y + 30, 1, 1, 0, c_white, 1);
    draw_text(_x + 62, _y, "Select");
    
    if (input_source_using(__input_global().__source_keyboard))
        _spr = spr_glyph_kb_x;
    else
        _spr = spr_glyph_gp_circle;
    
    _x = 404;
    _y = 977;
    draw_sprite_ext(_spr, global.keyboard, _x, _y + 30, 1, 1, 0, c_white, 1);
    draw_text(_x + 62, _y, "Back");
    exit;
}

draw_set_halign(fa_center);
draw_set_font(global.font_splash);
var _cosX = [0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0];
var _sinY = [0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1];
var _y = 20;
var _num = 0;
var _str;

if (leaderboard_selected == leader_100)
    _str = "THE TOP 100";
else if (leaderboard_selected == leader_global)
    _str = "GLOBAL";
else
    _str = "FRIENDS";

var _spd = 3;
var _strength = 2;
var _scale = 0.58;
var _x = (960 - ((string_width(_str) * _scale) / 2)) + 34;

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
    
    draw_text_transformed(_x + _xoff, _y + _yoff, _chr, _scale, _scale, 0);
    _x += (string_width(_chr) * _scale);
}

draw_set_halign(fa_left);
var _count = 3;
var _sep = 65;
var _radius = 15;
var _radius_selected = 21;
_x = 960 - ((_sep * (_count - 1)) / 2);

for (var i = 0; i < _count; i++)
{
    var _r;
    
    if (leaderboard_selected == i)
    {
        _r = _radius_selected;
    }
    else
    {
        _r = _radius;
        draw_set_alpha(0.7);
    }
    
    draw_circle(_x + (_sep * i), 170, _r, false);
    draw_set_alpha(1);
}

var _xpos_place = 30;
var _xpos_name = 400;
var _xpos_score = 1000;
var _surfY = 300;
var _surfW = _xpos_score + 215;
var _surfH = 1080 - _surfY - 64;
var _surf_xoff = (1920 - _surfW) / 2;
draw_set_font(fnt_adlib_44);

if (input_source_using(__input_global().__source_keyboard))
    _spr = spr_glyph_kb_z;
else
    _spr = spr_glyph_gp_cross;

_x = 65;
_y = 40;
draw_sprite_ext(_spr, global.keyboard, _x, _y + 30, 1, 1, 0, c_white, 1);
draw_text(_x + 62, _y, "Refresh");

if (input_source_using(__input_global().__source_keyboard))
    _spr = spr_glyph_kb_x;
else
    _spr = spr_glyph_gp_circle;

_x = 65;
_y = 977;
draw_sprite_ext(_spr, global.keyboard, _x, _y + 30, 1, 1, 0, c_white, 1);
draw_text(_x + 62, _y, "Back");

if (input_source_using(__input_global().__source_keyboard))
    _spr = spr_glyph_kb_c;
else
    _spr = spr_glyph_gp_triangle;

_x = 1610;
_y = 40;
draw_sprite_ext(_spr, global.keyboard, _x, _y + 30, 1, 1, 0, c_white, 1);
draw_text(_x + 62, _y, "Profile");
_x = _xpos_place + _surf_xoff;
draw_text(_x, _surfY - 75, "Place");
_x = _xpos_name + _surf_xoff;
draw_text(_x, _surfY - 75, "Name");
_x = _xpos_score + _surf_xoff;
draw_text(_x, _surfY - 75, "Score");

if (!surface_exists(surf))
    surf = surface_create(_surfW, _surfH);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
draw_set_alpha(0.8);
draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
_y = scroll_y[leaderboard_selected];
_sep = 140;
draw_set_font(fnt_adlib_44);
var _board = scores[leaderboard_selected];

for (var i = 0; i < array_length(_board); i++)
{
    var _me;
    
    if (_board[i].userID == global.steam_userID)
        _me = true;
    else
        _me = false;
    
    if (loaded)
    {
        if (board_ready[leaderboard_selected])
        {
            if (_me)
                draw_set_color(c_yellow);
            
            _x = _xpos_place + 60;
            var _rank;
            
            if (leaderboard_selected == leader_friends)
                _rank = i + 1;
            else
                _rank = _board[i].rank;
            
            if (_rank == 1 || _rank == 2 || _rank == 3)
            {
                var __yoff;
                
                if (i == 1)
                    __yoff = 4;
                else
                    __yoff = 0;
                
                draw_sprite_ext(spr_leaderboard_medals, _rank - 1, _x + 23, _y + 78 + __yoff, 1, 1, 0, c_white, 1);
            }
            else
            {
                _str = string("{0}.", _rank);
                draw_text(_x, _y + scroll_yoff, _str);
            }
            
            _x = _xpos_name;
            _str = _board[i].name;
            var _more = false;
            
            while (string_width(_str) > 465)
            {
                _str = string_delete(_str, string_length(_str), 1);
                _more = true;
            }
            
            if (_more)
                _str = string_insert("...", _str, string_length(_str) + 1);
            
            draw_text(_x, _y + scroll_yoff, _str);
            _x = _xpos_score;
            _str = struct_get(_board[i], "score");
            draw_text(_x, _y + scroll_yoff, _str);
            draw_set_color(c_white);
            var _ypos = (_y + scroll_yoff) - 25;
            var _ind;
            
            if (_me)
                _ind = global.stats_pfp;
            else
                _ind = _board[i].pfp;
            
            if (_ind != -1)
            {
                var _w = sprite_get_width(spr_pfp);
                var _h = sprite_get_height(spr_pfp);
                _scale = 110 / _w;
                _w *= _scale;
                _h *= _scale;
                draw_sprite_ext(spr_pfp, _ind, _xpos_name - 20 - _w, _ypos, _scale, _scale, 0, c_white, 1);
            }
            else if (is_struct(pfp[leaderboard_selected][i]))
            {
                _spr = pfp[leaderboard_selected][i].spr;
                
                if (sprite_exists(_spr))
                {
                    var _w = sprite_get_width(_spr);
                    var _h = sprite_get_height(_spr);
                    _scale = 110 / _w;
                    _w *= _scale;
                    _h *= _scale;
                    draw_sprite_ext(_spr, 0, _xpos_name - 20 - _w, _ypos, _scale, _scale, 0, c_white, 1);
                }
            }
        }
        
        if (scroll_jump[leaderboard_selected] && _me && scroll_max_defined[leaderboard_selected])
        {
            scroll_y[leaderboard_selected] = -_y + (_sep * 3);
            
            if (scroll_y[leaderboard_selected] > 0)
                scroll_y[leaderboard_selected] = 0;
            
            if (scroll_y[leaderboard_selected] < (-scroll_max[leaderboard_selected] - scroll_yoff))
                scroll_y[leaderboard_selected] = -scroll_max[leaderboard_selected] - scroll_yoff;
            
            scroll_yto[leaderboard_selected] = scroll_y[leaderboard_selected];
            scroll_jump[leaderboard_selected] = false;
            loaded = false;
            timer[1] = 2;
        }
        
        _y += _sep;
    }
}

if (loaded && scroll_jump[leaderboard_selected] && scroll_max_defined[leaderboard_selected])
{
    scroll_jump[leaderboard_selected] = false;
    board_ready[leaderboard_selected] = true;
    deac = false;
}

if (loaded)
{
    if (array_length(_board) <= board_scroll_min)
        scroll_max[leaderboard_selected] = 0;
    else
        scroll_max[leaderboard_selected] = max((_sep * (array_length(_board) - board_scroll_min)) - 52, 0);
    
    scroll_max_defined[leaderboard_selected] = true;
}

surface_reset_target();
draw_surface(surf, _surf_xoff, _surfY);

if (!board_ready[leaderboard_selected])
{
    if (board_failed[leaderboard_selected])
    {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(_surf_xoff + (_surfW / 2), _surfY + (_surfH / 2), "Unable to Load Leaderboard...");
        draw_set_valign(fa_top);
        draw_set_halign(fa_left);
    }
    else
    {
        draw_sprite_ext(spr_loading, 0, _surf_xoff + (_surfW / 2), _surfY + (_surfH / 2), 1, 1, loading_angle, c_white, 1);
    }
}

if (board_ready[leaderboard_selected])
{
    var _w = 24;
    var _h = _surfH;
    _x = 1920 - _w - 100;
    _y = _surfY;
    draw_set_alpha(0.5);
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);
    draw_set_alpha(1);
    var _percent = abs(scroll_y[leaderboard_selected]) / abs(scroll_max[leaderboard_selected] + scroll_yoff);
    var __h;
    
    if (array_length(scores[leaderboard_selected]) <= board_scroll_min)
        __h = _h;
    else
        __h = _h * 0.2;
    
    var __x = _x;
    var __y = _y + (_percent * 0.8 * _h);
    draw_rectangle(__x, __y, __x + _w, __y + __h, false);
}

if (room == rm_title || room == rm_leaderboards)
{
    with (obj_network_getstats)
        event_user(0);
}
