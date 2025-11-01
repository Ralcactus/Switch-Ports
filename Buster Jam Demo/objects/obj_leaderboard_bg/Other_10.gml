draw_rectangle_color(-1000, -1000, 2920, 2080, c_black, c_black, c_black, c_black, false);

if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

var _val = 280;
var _ind = 0;
surface_set_target(surf);
var _spr = spr_pattern_endless;
_ind = 1;
draw_sprite_tiled_ext(_spr, _ind, time, time * 0.5, 2, 2, c_white, 1);
surface_reset_target();
shader_set(sha_panorama);
shader_set_uniform_f(shader_get_uniform(shader_current(), "zoom"), _val);
shader_set_uniform_f(shader_get_uniform(shader_current(), "zDir"), 1);
draw_surface(surf, 0, 0);
shader_reset();
