var _sep = 22;
var _h = sprite_get_height(spr_option);
var _y;

if (nodes == 2)
    _y = 268;
else
    _y = 149;

_y += (_h / 2);
draw_set_font(global.font_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < nodes; i++)
{
    var _ypos = _y + ((_h + _sep) * i);
    
    if (selected == i)
    {
        var __x = 960 - (sprite_get_width(spr_option) / 2) - 30;
        draw_sprite_ext(spr_option_select, 0, __x + select_xoff, _ypos + select_yoff, 1, 1, 0, c_white, alpha_arrow);
    }
    
    var _invert;
    
    if ((i % 2) == 0)
        _invert = -1;
    else
        _invert = 1;
    
    draw_sprite_ext(spr_option, 0, 960, _ypos, xscale[i] * _invert, yscale[i], 0, c_white, alpha[i]);
    
    if (selected == i)
        draw_sprite_ext(spr_option, 1, 960, _ypos, xscale[i] * _invert, yscale[i], 0, c_white, alpha_arrow);
    
    draw_set_color(c_black);
    draw_set_alpha(alpha[i]);
    _ypos += 3;
    draw_text_transformed(964, _ypos + 2 + 4, choice[i].text, xscale[i], yscale[i], 0);
    draw_set_color(c_white);
    draw_text_transformed(960, _ypos + 2, choice[i].text, xscale[i], yscale[i], 0);
    draw_set_alpha(1);
    
    if (done && selected != i)
        alpha[i] = approach(alpha[i], 0, 0.12);
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
