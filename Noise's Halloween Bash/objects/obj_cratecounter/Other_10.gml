var _pdist = clamp(distance_to_object(obj_player) / 150, 0, 1);
shader_set(shd_cratecounter);
shader_set_uniform_f(u_alpha, _pdist);
shader_set_uniform_i(u_outlining, global.outlineDrawing);
draw_model("CrateCOUNTER", x, y, z, -34, -34, 17, 0, 180 + spin, 0);
shader_reset();
