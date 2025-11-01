var _x = ((x - instance_find_micro(obj_micro_apedino_dino).x) / 2) - 170;
var _y = ((y - instance_find_micro(obj_micro_apedino_dino).y) / 2) - 173;
camera_set_view_pos(view_camera[view], _x + (controller.game_width / 2) + cam_xoff, ((_y + (controller.game_height / 2)) - 35) + cam_yoff);
