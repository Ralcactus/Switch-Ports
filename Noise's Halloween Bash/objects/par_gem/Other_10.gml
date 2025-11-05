shader_set(shd_gemshading);
shader_set_uniform_f(u_colour, colour_get_red(colour) / 255, colour_get_green(colour) / 255, colour_get_blue(colour) / 255);
shader_set_uniform_f(u_light, global.worldlightpos.x, global.worldlightpos.y, global.worldlightpos.z);
shader_set_uniform_f(u_view, 5024, 7072, 0);
shader_set_uniform_f(u_lightlevel, lightlevel);
shader_set_uniform_i(u_outlining, global.outlineDrawing);
draw_model(model, x, y, z, -34, -34, 17, 0, 180 + obj_drawcontroller.hudcratespin, 0);
shader_reset();
