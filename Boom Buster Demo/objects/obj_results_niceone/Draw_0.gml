draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, image_alpha);
draw_sprite_tiled_ext(spr_charpattern, 0, pattern_x, pattern_y, 2, 2, c_white, pattern_alpha * 0.35);

if (pattern_alpha > 0)
{
    pattern_x -= 0.5;
    pattern_y += 0.2;
}
