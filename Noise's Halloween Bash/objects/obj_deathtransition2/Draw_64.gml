shader_set(shd_holecutout_premultiply);
var _sp = world_to_screen(obj_player.x, obj_player.y, obj_player.z, obj_drawcontroller.viewMat, obj_drawcontroller.projMat, true);

if (_sp == undefined)
    shader_set_uniform_f(u_playerpos, 0, 0);
else
    shader_set_uniform_f(u_playerpos, _sp[0], _sp[1]);

shader_set_uniform_f(u_radius, (_sp == undefined) ? 0 : rad);
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, 1 - (rad / maxrad));
shader_set(shd_premultiply);
