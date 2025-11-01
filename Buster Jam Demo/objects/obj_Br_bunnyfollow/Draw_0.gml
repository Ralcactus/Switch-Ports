if (!surface_exists(surf))
    surf = surface_create(controller.game_width, controller.game_height);

surface_set_target(surf);
draw_set_color(c_black);
draw_rectangle(0, 0, controller.game_width, controller.game_height, false);
draw_set_color(c_white);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_Br_bunnyfollow_mask, 0, x, y, scale, scale, 0, c_white, 1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf, 0, 0);
