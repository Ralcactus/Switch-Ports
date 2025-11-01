if (!surface_exists(surf))
    surf = surface_create(1590, 876);

surface_set_target(surf);
shader_set(sha_heatwave);
shader_set_uniform_f(uTime, time);
shader_set_uniform_f(uFreq, 75);
shader_set_uniform_f(uSize, 1.5);
var tex = sprite_get_texture(sprite_index, 0);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_sprite_ext(sprite_index, 0, camera_get_view_x(view_camera[controller.view]), camera_get_view_y(view_camera[controller.view]), 1, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, 0, 0, 0, 1, 1, 0, c_white, 1);
shader_reset();
surface_reset_target();
shader_set(sha_hueshift);
shader_set_uniform_f(u_theta, hue);
draw_surface(surf, 0, 0);
shader_reset();
