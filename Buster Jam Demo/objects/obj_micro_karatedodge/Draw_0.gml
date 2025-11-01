if (!surface_exists(surf))
    surf = surface_create(1590, 876);

surface_set_target(surf);
draw_sprite(spr_micro_karatedodge_bg, 0, 0, 0);
var _w = sprite_get_width(spr_micro_karatedodge_bg_hills);
draw_sprite(spr_micro_karatedodge_bg_hills, 0, bg_x, controller.game_height);
draw_sprite(spr_micro_karatedodge_bg_hills, 0, bg_x - _w, controller.game_height);
surface_reset_target();
shader_set(sha_heatwave);
shader_set_uniform_f(uTime, time);
shader_set_uniform_f(uFreq, 40);
shader_set_uniform_f(uSize, 4);
var tex = surface_get_texture(surf);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_surface(surf, 0, 0);
shader_reset();
