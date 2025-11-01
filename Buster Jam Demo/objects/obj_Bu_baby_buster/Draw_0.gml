xscale = easy_smooth(xscale, 1, 7);
yscale = easy_smooth(yscale, 1, 7);

if (anim_sprite == spr_Bu_baby_buster_rage)
{
    xscale = 1;
    yscale = 1;
}

draw_sprite_ext(anim_sprite, anim_index, x, y, xscale, yscale, 0, c_white, 1);
