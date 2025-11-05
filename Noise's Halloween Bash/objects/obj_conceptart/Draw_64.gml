draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 1);
var _imgpos = 275;
var _listpos = get_game_width() - 260;
var _maxsize = 410;

if (global.resmode != aspectratio.res4_3)
{
    _maxsize = 480;
    _imgpos = 335;
}

draw_sprite_stretched(spr_conceptartline, 0, lerp(_imgpos + (_maxsize / 2), _listpos, 0.5), 0, 2, get_game_height());
draw_set_colour(c_white);
draw_set_font(global.font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0; i < array_length(concepts); i++)
{
    var _scroll = clamp(selected - 7, 0, array_length(concepts) - 15);
    __draw_text_colour_hook(_listpos, (30 + (i * 32)) - (_scroll * 32), string_get(string("menu/concepts/{0}", concepts[i])), c_white, c_white, c_white, c_white, (selected == i) ? 1 : 0.5);
}

draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, zoomtrans);
var _asset = asset_get_index(concepts[selected]);
var _scale = 1;
var _size = max(sprite_get_width(_asset), sprite_get_height(_asset));
_scale = _maxsize / _size;
gpu_set_tex_filter(true);
draw_sprite_ext(_asset, -1, lerp(_imgpos, (get_game_width() / 2) + zoomxpan, zoomtrans), lerp(get_game_height() / 2, (get_game_height() / 2) + zoomypan, zoomtrans), lerp(_scale, 1, zoomtrans), lerp(_scale, 1, zoomtrans), 0, c_white, 1);
gpu_set_tex_filter(false);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_text_fancy(20, get_game_height() - 20, zoomedin ? string_get("menu/concepts/zoomedin") : string_get("menu/concepts/zoomedout"));
