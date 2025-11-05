draw_set_colour(splasharr[currsplash][1]);
draw_rectangle(0, 0, get_game_width(), get_game_height(), false);
draw_set_colour(c_white);
draw_sprite(splasharr[currsplash][0], 0, get_game_width() / 2, get_game_height() / 2);
draw_set_alpha(fade);
draw_set_colour(c_black);
draw_rectangle(0, 0, get_game_width(), get_game_height(), false);
draw_set_colour(c_white);
draw_set_alpha(1);
