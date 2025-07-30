var cam_width = camera_get_view_width(view_camera[0])
var cam_height = camera_get_view_height(view_camera[0])
var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
depth = -25
sucrose_lighting = false;
sucrose_color = #264d72
sucrose_color_array = [par_follower, obj_baddiespawner, par_collect, obj_rocketdud, obj_dashpad, obj_gigacherrydead, obj_chocofrog, par_logicobjects]
dance_lighting = false;
dance_palette = 0;
sucrose_surface = surface_create(cam_width, cam_height)
surface_set_target(sucrose_surface)
draw_clear_alpha(c_black, 0)
surface_reset_target()
dance_surface = surface_create(cam_width, cam_height)
surface_set_target(dance_surface)
draw_clear_alpha(c_black, 0)
surface_reset_target()
boss_surface = surface_create(cam_width, cam_height)
surface_set_target(boss_surface)
draw_clear_alpha(c_black, 0)
surface_reset_target()
boss_radius = 120
radius_increase = 0