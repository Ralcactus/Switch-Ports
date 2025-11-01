if (draw)
    draw_self();

draw_set_alpha(fade);
draw_rectangle(x, y, x + sprite_width, y + sprite_height, false);
draw_set_alpha(1);
