if (controller.ended)
{
    if (place_meeting_micro(x, y, obj_Br_bunnyfollow_bunny))
        scr_micro_win();
    
    if (controller.win)
        scale = easy_smooth(scale, 1.5, 2);
    
    exit;
}

xAxis = input_check("right", player) - input_check("left", player);
yAxis = input_check("down", player) - input_check("up", player);
x += (xAxis * spd * global.delta_game_factor);
y += (yAxis * spd * global.delta_game_factor);
