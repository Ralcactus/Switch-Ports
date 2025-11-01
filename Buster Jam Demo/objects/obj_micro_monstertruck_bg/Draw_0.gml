var _camx = camera_get_view_x(view_camera[view]) + (camera_get_view_width(view_camera[view]) * (controller.zoom - 1));
var _camy = camera_get_view_y(view_camera[view]) + (camera_get_view_height(view_camera[view]) * (controller.zoom - 1));
draw_sprite(spr_micro_monstertruck_bg, 0, _camx, _camy);
draw_sprite_ext(spr_micro_monstertruck_clouds, 0, _camx + clouds_x, _camy, 1, 1, 0, c_white, 1);
