if (obj_parent_player.state == UnknownEnum.Value_110 && obj_parent_player.sprite_index == obj_parent_player.spr_gotTreasure)
{
    draw_sprite(spr_treasureeffect, image_index, playerID.x, playerID.y - 40);
    draw_self();
}
else
{
    draw_sprite_ext(sprite_index, image_index, x, y + bobsin, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
