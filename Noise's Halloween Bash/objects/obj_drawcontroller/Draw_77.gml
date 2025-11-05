gpu_set_ztestenable(false);
gpu_set_blendenable(false);

if (!surface_exists(finalsurf))
    finalsurf = surface_create(global.currentres[0], global.currentres[1]);

if (surface_get_width(finalsurf) != global.currentres[0] || surface_get_height(finalsurf) != global.currentres[1])
    surface_resize(finalsurf, global.currentres[0], global.currentres[1]);

surface_set_target(finalsurf);
draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, global.currentres[0], global.currentres[1], c_black, 1);
shader_set(shd_noalpha);

if (outlineDebug && surface_exists(outlineSurf))
    draw_surface_stretched(outlineSurf, 0, 0, global.currentres[0], global.currentres[1]);
else
    draw_surface_stretched(application_surface, 0, 0, global.currentres[0], global.currentres[1]);

shader_reset();
surface_reset_target();
gpu_set_blendenable(true);
