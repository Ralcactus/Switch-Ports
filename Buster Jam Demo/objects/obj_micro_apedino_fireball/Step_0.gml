x += (hspd * global.delta_game_factor);
hspd = easy_smooth(hspd, -9, 2.5);

if (down)
    y = easy_smooth(y, ystart + 50, 2.5);
