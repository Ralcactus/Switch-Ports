draw_sprite(spr_micro_jetpack_bg, 0, 0, 0);
draw_sprite(anim_sprite, anim_index, 0, 0);

with (obj_micro_jetpack_buster)
{
    if (ID == other.ID)
        draw_sprite_ext(anim_sprite, anim_index, x + 12, y + 12, facing, 1, 0, c_black, 0.3);
}

with (obj_micro_jetpack_block)
{
    if (ID == other.ID)
        draw_sprite_ext(anim_sprite, anim_index, x + 12, y + 12, 1, 1, 0, c_black, 0.3);
}

with (obj_micro_jetpack_shard)
{
    if (ID == other.ID)
        draw_sprite_ext(sprite_index, image_index, x + 12, y + 12, 1, 1, image_angle, c_black, 0.3);
}
