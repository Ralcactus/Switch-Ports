if (move_clouds)
    clouds_x += (controller.microgame_hspd * global.delta_game_factor);

draw_sprite(spr_dinorun_clouds, 0, clouds_x, 0);
draw_sprite(spr_dinorun_clouds, 0, clouds_x + sprite_get_width(spr_dinorun_clouds), 0);
draw_sprite(spr_dinorun_clouds, 0, clouds_x + (sprite_get_width(spr_dinorun_clouds) * 2), 0);
draw_sprite(spr_dinorun_clouds, 0, clouds_x + (sprite_get_width(spr_dinorun_clouds) * 3), 0);
draw_sprite(anim_sprite, anim_index, x, y);
