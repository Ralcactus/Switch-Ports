testvariablenothing = false;
draw_set_font(fnt_adlib);
var _y = 100 + scroll_y;
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(960, 100, "- DEMO CREDITS -");
draw_set_halign(fa_left);

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
_y += 150;
var _sep = 60;

for (var i = 0; i < array_length(credits); i++)
{
    for (var ii = 0; ii < array_length(credits[i]); ii++)
    {
        if (ii == 0)
        {
            draw_set_halign(fa_center);
            draw_set_color(c_yellow);
            _x = 960;
        }
        else
        {
            _x = 300;
        }
        
        _str = credits[i][ii];
        
        if (is_array(_str))
        {
            draw_set_halign(_str[0]);
            
            if (_str[0] == 1)
                _x = 960;
            
            _str = _str[1];
        }
        
        draw_text(_x, _y, _str);
        draw_set_halign(fa_left);
        
        if (ii == 0)
        {
            draw_set_halign(fa_left);
            draw_set_color(c_white);
        }
        
        _y += _sep;
    }
    
    _y += (_sep * 1.5);
}

var _str = "Thank you for playing our demo!\n- Vinny & Miles\n(c) TALLGLASS 2025";
draw_set_halign(fa_center);
draw_text_ext(960, _y + 50, _str, 100, 1152);
draw_set_halign(fa_left);
scroll_max = -(_y + 100 + 400 + 160);
surface_reset_target();
var _clip = 190;
draw_surface_part(surf, 0, _clip, 1920, 1080, 0, _clip);
var _w = 24;
var _h = 780;
var _x = 1920 - _w - 100;
_y = (540 - (_h / 2)) + 50;
draw_set_alpha(0.5);
draw_rectangle(_x, _y, _x + _w, _y + _h, false);
draw_set_alpha(1);
var _percent = abs(scroll_y) / abs(scroll_max);
var __h = _h * 0.35;
var __x = _x;
var __y = _y + (_percent * 0.65 * _h);
draw_rectangle(__x, __y, __x + _w, __y + __h, false);
