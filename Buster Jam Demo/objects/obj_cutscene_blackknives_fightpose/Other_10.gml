draw_set_color(c_white);
var _amnt = 12;
var _xshake = shake * random_range(-_amnt, _amnt);
var _yshake = shake * random_range(-_amnt, _amnt);
draw_sprite_ext(spr_cutscene_duo_fight, 0, 960 + _xshake, 540 + _yshake, 1.01, 1.01, 0, c_white, 1);
