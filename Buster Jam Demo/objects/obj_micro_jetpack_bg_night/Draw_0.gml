var _camx = camera_get_view_x(view_camera[view]) + (camera_get_view_width(view_camera[view]) * (controller.zoom - 1));
var _camy = camera_get_view_y(view_camera[view]) + (camera_get_view_height(view_camera[view]) * (controller.zoom - 1));
draw_sprite(spr_micro_jetpack_bg_night, 0, _camx, _camy);
draw_sprite_ext(spr_micro_jetpack_bg_stars, 0, _camx, _camy, 1, 1, 0, c_white, stars_alpha);

with (obj_micro_jetpack_moon)
{
    if (ID == other.ID)
        event_draw();
}
