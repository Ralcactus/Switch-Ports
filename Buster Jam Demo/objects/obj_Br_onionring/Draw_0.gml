if (!draw)
    exit;

draw_sprite(anim_sprite, anim_index, x, y + yoff);
yoff = easy_smooth(yoff, 0, 3);
