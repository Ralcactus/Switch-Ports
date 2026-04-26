var shake_x = 0;

if (rising && risingBuffer > 0)
    shake_x = random_range(-3, 3);

draw_sprite_ext(sprite_index, -1, x + shake_x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_movingplatformmiddle, -1, x + shake_x, y, 1, 1, image_angle, image_blend, image_alpha);
