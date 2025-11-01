if (!instance_exists(id))
    exit;

zoom = obj_controller.zoom;
get_cams();

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

surface_set_target(surf);
draw_set_color(c_black);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_color(c_white);
gpu_set_blendmode(bm_subtract);
var _x = ((obj_player.x * zoom) - (camx * zoom)) + irandom_range(-10, 10);
var _y = ((obj_player.y * zoom) - (camy * zoom)) + irandom_range(-10, 10);
draw_circle(_x, _y - (40 * zoom), radius, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_set_alpha(fade_alpha);
draw_surface(surf, -256, 0);
draw_set_alpha(1);
