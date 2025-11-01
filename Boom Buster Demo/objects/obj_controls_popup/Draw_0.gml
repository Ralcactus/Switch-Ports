draw_sprite_ext(spr_controls_bar, 0, 0, 0, 1, 1, 0, c_white, image_alpha);
draw_sprite_ext(spr_controls_bar, 1, 1920 - sprite_get_width(spr_controls_bar), 1080 - sprite_get_height(spr_controls_bar), 1, 1, 0, c_white, image_alpha);
var _scale = 0.9;
draw_set_font(fnt_splatter_55);
draw_set_valign(fa_middle);
var _strGo = "GO!";
var _strBack;

if (room == rm_results)
    _strBack = "REPLAY";
else
    _strBack = "BACK";

draw_set_color(c_black);
draw_text_transformed(1615, 1007, _strGo, _scale, _scale, 0);
draw_set_color(c_white);
draw_text_transformed(1610, 1002, _strGo, _scale, _scale, 0);
draw_set_halign(fa_right);
draw_set_color(c_black);
draw_text_transformed(407, 83, _strBack, _scale, _scale, 0);
draw_set_color(c_white);
draw_text_transformed(402, 78, _strBack, _scale, _scale, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
