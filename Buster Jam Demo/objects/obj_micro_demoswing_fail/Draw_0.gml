var _x = camera_get_view_x(view_camera[view]);
var _y = camera_get_view_y(view_camera[view]);
draw_set_alpha(alpha);
draw_rectangle(_x, _y, _x + controller.game_width, _y + controller.game_height, false);
draw_set_alpha(1);
