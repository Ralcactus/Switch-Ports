var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _col = 4329006;
draw_rectangle_color(_camx, _camy, _camx + 1920, _camy + 1080, _col, _col, _col, _col, false);
draw_sprite_tiled_ext(spr_charpattern, 0, (_camx * 0.8) + (time * 10), (_camy * 0.8) + (time * 5), 1, 1, c_white, alpha * 0.8);
