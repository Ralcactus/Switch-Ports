var _yoff = sin(time * pi * 0.015) * 4;
yoff_draw = y + z + _yoff + z_hit;
draw_sprite_ext(anim_sprite, anim_index, x, yoff_draw, 1, 1, 0, c_white, 1);
