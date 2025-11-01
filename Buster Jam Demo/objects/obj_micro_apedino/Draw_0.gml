get_cams(1);
draw_sprite(spr_micro_apedino_bg, 0, camx - 60, camy - 60);
draw_sprite(spr_micro_apedino_clouds_bottom, 0, ((camx * 0.9) + clouds_x) - 60, ((camy * 0.9) - 60) + 45);
draw_sprite(spr_micro_apedino_clouds_top, 0, ((camx * 0.8) + (clouds_x * 2)) - 60, ((camy * 0.8) - 60) + 45);
draw_sprite(spr_micro_apedino_buildings, 0, (camx * 0.8) - 60, (((camy * 0.9) + 150) - 50) + 35);
draw_sprite(spr_micro_apedino_floor, 0, -60, 347);
draw_sprite(spr_micro_apedino_floor, 0, -60 - sprite_get_width(spr_micro_apedino_floor), 347);
