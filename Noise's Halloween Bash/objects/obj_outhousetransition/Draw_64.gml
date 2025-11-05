var _gw = get_game_width();
var _gh = get_game_height();
shader_set(shd_outhousetransition);
shader_set_uniform_f(scrsize, _gw, _gh);
shader_set_uniform_f(uanim, anim);
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, _gw, _gh, c_black, 1);
shader_set(shd_premultiply);
