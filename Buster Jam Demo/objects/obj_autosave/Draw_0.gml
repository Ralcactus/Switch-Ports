loading_angle += ((sprite_get_speed(spr_map_buster_walk) / 60) * global.delta_game_factor);
shader_set(sha_flash);
draw_sprite_ext(spr_map_buster_walk, loading_angle, 1795, 1030, 1, 1, 0, c_white, 1);
shader_reset();
