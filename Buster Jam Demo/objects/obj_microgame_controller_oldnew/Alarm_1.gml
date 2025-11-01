if (fullscreen)
{
    scale = 1920 / game_width;
    x = 960 - (game_width / 2);
    y = 540 - (game_height / 2);
    xstart = x;
    ystart = y;
}

if (bounce)
{
}

timer[6] = jumpcut_delay;

if (global.multiplayer)
{
    if (player == 0)
        outline_col = 16711680;
    else if (player == 1)
        outline_col = 255;
}
else
{
    outline_col = 16777215;
}
