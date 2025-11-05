if (!surface_exists(guisurf))
    guisurf = surface_create(get_game_width(), get_game_height());

surface_set_target(guisurf);
draw_clear_alpha(c_black, 0);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
shader_set(shd_premultiply);
