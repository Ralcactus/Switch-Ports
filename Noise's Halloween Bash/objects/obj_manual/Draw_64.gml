var _halfw = get_game_width() / 2;
var _halfh = get_game_height() / 2;
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 0.4);
draw_sprite(spr_manual, page, _halfw, _halfh);
draw_set_colour(c_white);
draw_set_font(global.font);
draw_set_valign(fa_top);
draw_set_halign(fa_right);

if (page > 0)
    draw_text_fancy(240, get_game_height() - 108, string_get("menu/manual/previous"));

draw_set_halign(fa_left);

if (page < maxpage)
    draw_text_fancy(get_game_width() - 220, get_game_height() - 108, string_get("menu/manual/next"));

draw_set_colour(c_white);
draw_set_font(global.manualfont);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var _arr = string_get("menu/manual/text");

for (var i = 0; i < array_length(_arr[page]); i++)
{
    var _el = _arr[page][i];
    __draw_text_hook(_halfw + _el[0], _halfh + _el[1], _el[2]);
}
