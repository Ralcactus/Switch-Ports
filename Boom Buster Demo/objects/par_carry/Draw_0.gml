if (wings)
{
    draw_sprite(spr_wing, wing_ind, x - 38, (y - 29) + wings_sin);
    draw_sprite_ext(spr_wing, wing_ind, x + 38, (y - 29) + wings_sin, -1, 1, 0, c_white, 1);
}

draw_sprite_ext(anim_sprite, anim_index, x, y + carry_yoff + wings_sin, facing * xscale_squish, yscale_squish, 0, c_white, 1);
