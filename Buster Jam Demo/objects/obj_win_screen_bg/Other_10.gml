if (!surface_exists(surf))
    surf = surface_create(1920, 1080);

var _val = 280;
var _ind = 0;
surface_set_target(surf);
var _spr;

if (room == rm_endless)
{
    _spr = spr_pattern_endless;
    _val = 400;
}
else
{
    _spr = spr_results_pattern;
}

if (room == rm_leaderboards)
    _ind = 1;

draw_sprite_tiled_ext(_spr, _ind, time, time * 0.5, 2, 2, c_white, 1);
surface_reset_target();
shader_set(sha_panorama);
shader_set_uniform_f(shader_get_uniform(shader_current(), "zoom"), _val);
shader_set_uniform_f(shader_get_uniform(shader_current(), "zDir"), 1);
draw_surface(surf, 0, 0);
shader_reset();

if (!surface_exists(surf_fg))
    surf_fg = surface_create(1920, 1080);

surface_set_target(surf_fg);
draw_clear_alpha(c_white, 0);
draw_sprite(spr_results_ring, 0, 0, 0);
surface_reset_target();

if (room == rm_win_screen)
    draw_surface(surf_fg, 0, 0);
