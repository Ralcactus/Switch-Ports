if (!ready)
    exit;

var _y = 720;
var _x = 960;
var _alpha;

if (sprite_index == spr_textbox_transparent)
    _alpha = 0.6;
else
    _alpha = 1;

draw_sprite_ext(sprite_index, 0, _x, (_y + (sprite_get_height(spr_textbox) / 2)) - 0.5, scale, scale, 0, c_white, alpha * _alpha);
name_alpha = approach(name_alpha, 1, 0.2);
draw_set_font(global.font_dialogue);
var _portrait;

if (!draw_portrait)
    _portrait = false;
else{
	if is_string(portrait){
		portrait = string_replace(portrait,"@ref sprite(","")
		portrait = string_replace(portrait,")","")
		portrait = asset_get_index(portrait)	
	}
	
    _portrait = sprite_exists(portrait);
}
_x = 198 + (295 * _portrait);

if (_portrait)
    text_linemaxW = 1200;
else
    text_linemaxW = 1480;

if (!text_center_set)
{
    scr_dialogue_reset(text);
    text_center_set = true;
}

draw_set_alpha(alpha);
scr_draw_dialogue(_x, _y + 79, undefined, text, true);
draw_set_alpha(1);

if (_portrait && percent == 1)
    draw_sprite_ext(portrait, portrait_ind, 170, 741, 1, 1, 0, c_white, alpha);

if (type_index == string_length(text) && !auto)
{
    draw_sprite_ext(spr_textbox_arrow, arrow_ind, 1729, 977, 1, 1, 0, c_white, alpha);
    arrow_ind += ((sprite_get_speed(spr_textbox_arrow) / 60) * global.delta_game_factor);
}
