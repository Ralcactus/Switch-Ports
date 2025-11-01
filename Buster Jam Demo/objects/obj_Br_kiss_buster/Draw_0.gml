draw_sprite_ext(anim_sprite, anim_index, x, y, effect_scale * 0.7, effect_scale * 0.7, 0, c_white, effect_alpha - 0.4);
draw_sprite_ext(anim_sprite, anim_index, x, y, effect_scale * 0.8, effect_scale * 0.8, 0, c_white, effect_alpha - 0.2);
draw_sprite_ext(anim_sprite, anim_index, x, y, effect_scale, effect_scale, 0, c_white, effect_alpha);
draw_sprite(anim_sprite, anim_index, x + irandom_range(-shake, shake), y + irandom_range(-shake, shake));
