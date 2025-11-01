var _shakeX = irandom_range(-3, 3) * shake_strength;
var _shakeY = irandom_range(-3, 3) * shake_strength;
pal_swap(pal_buster, 0, global.powerup + 1);
draw_sprite_ext(anim_sprite, anim_index, x + _shakeX, y + _shakeY, facing, 1, 0, c_white, 1);
shader_reset();
