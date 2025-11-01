var _xAxis = input_check("right", player) - input_check("left", player);
hspd = easy_smooth(hspd, _xAxis * movespd, 5.5);
x += (hspd * global.delta_game_factor);

if (bbox_left < 117)
{
    x += (117 - bbox_left);
    hspd = 0;
}

if (bbox_right > 1445)
{
    x -= (bbox_right - 1445);
    hspd = 0;
}

timer_logic(0);
