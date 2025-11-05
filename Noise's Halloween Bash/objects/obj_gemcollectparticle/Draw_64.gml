gpu_set_ztestenable(true);
shader_set(shd_gemshading_gui);
shader_set_uniform_f(u_colour, colour_get_red(colour) / 255, colour_get_green(colour) / 255, colour_get_blue(colour) / 255);
shader_set_uniform_f(u_light, -0.1, -0.05, -0.6);
shader_set_uniform_f(u_view, 0, 0, 0);
draw_model(model, x, y, 0, -size, -size, size, 8, 180, 0);
shader_set(shd_premultiply);
gpu_set_ztestenable(false);
