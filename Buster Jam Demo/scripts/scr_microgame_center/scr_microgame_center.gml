function scr_microgame_center(arg0)
{
    arg0.x = 960 - (arg0.game_width / 2);
    arg0.y = 540 - (arg0.game_height / 2) - (30 * arg0.scale);
    arg0.xstart = arg0.x;
    arg0.ystart = arg0.y;
}
