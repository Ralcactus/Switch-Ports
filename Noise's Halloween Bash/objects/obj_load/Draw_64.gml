///@description Draw Loading Border
draw_rectangle_colour(0, 0, get_game_width(), get_game_height(), c_black, c_black, c_black, c_black, false);
var _perc = loadedassets / loadedassetsmax;
var _w = get_game_width();
var _h = get_game_height();
draw_sprite_stretched(spr_1x1, 0, 0, _h - 5, _w * _perc, 5);
draw_sprite_stretched(spr_1x1, 0, 0, 0, 5, _h * _perc);
draw_sprite_stretched(spr_1x1, 0, _w * (1 - _perc), 0, _w * _perc, 5);
draw_sprite_stretched(spr_1x1, 0, _w - 5, _h * (1 - _perc), 5, _h * _perc);
