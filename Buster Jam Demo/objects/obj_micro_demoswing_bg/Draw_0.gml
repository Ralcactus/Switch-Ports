shader_set(sha_heatwave);
shader_set_uniform_f(uTime, time);
shader_set_uniform_f(uFreq, 40);
shader_set_uniform_f(uSize, 4);
var tex = sprite_get_texture(spr_micro_demoswing_bg, 1);
shader_set_uniform_f(uTexel, texture_get_texel_width(tex), texture_get_texel_height(tex));
draw_sprite(spr_micro_demoswing_bg, 1, 0, 0);
shader_reset();
draw_sprite(spr_micro_demoswing_building, 0, 823, 528 + building_y);

if (crumbling)
{
    building_y += (1 * global.delta_game_factor);
    draw_sprite_ext(spr_micro_demoswing_crumblefx, crumble_ind, 0, 0, 1, 1, 0, c_white, crumble_alpha);
    crumble_ind += ((sprite_get_speed(spr_micro_demoswing_crumblefx) / 60) * global.delta_game_factor);
    crumble_alpha = approach(crumble_alpha, 1, 0.08);
}

draw_sprite(spr_micro_demoswing_bg, 0, 0, 0);
draw_sprite(spr_micro_demoswing_misses, misses, camera_get_view_x(view), camera_get_view_y(view));
