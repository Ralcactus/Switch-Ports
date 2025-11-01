if (!instance_exists(id))
    exit;

var _zoom = obj_controller.zoom;
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

if (!surface_exists(surf))
    surf = surface_create(1408, 1080);

surface_set_target(surf);
draw_set_color(c_black);
draw_rectangle(0, 0, 1408, 1080, false);
draw_set_color(c_white);
gpu_set_blendmode(bm_subtract);

if (instance_exists(target))
{
    var _x = (target.x * _zoom) - (_camx * _zoom);
    var _y = (target.y * _zoom) - (_camy * _zoom);
    draw_circle(_x, _y - (40 * _zoom), player_radius, false);
}

gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_set_alpha(darkness * flicker);
draw_surface(surf, -256, 0);
draw_set_alpha(1);
