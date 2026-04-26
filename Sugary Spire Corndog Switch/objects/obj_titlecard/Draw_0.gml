if (!shown)
    exit;

draw_set_color(c_black);
draw_set_alpha(fadealpha);
draw_rectangle(-32, -32, room_width + 32, room_height + 32, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite(info.bginfo[0], 0, bgX, bgY);
draw_sprite(info.titleinfo[0], 0, titleX, titleY);
