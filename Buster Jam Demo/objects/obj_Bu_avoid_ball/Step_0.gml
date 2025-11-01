if (!controller.win)
    exit;

if (place_meeting_micro(x, y, obj_Bu_avoid_square) && !controller.ended)
{
    audio_play_sound_on(controller.audio, snd_Bu_avoid_fail, 0, 0);
    controller.win = false;
    anim_play(spr_Bu_avoid_ball_fail);
}

if (input_source_using(__input_global().__source_keyboard, player))
{
    xAxis = input_check("right", player) - input_check("left", player);
    yAxis = input_check("down", player) - input_check("up", player);
}
else
{
    xAxis = input_value("right_free", player) - input_value("left_free", player);
    yAxis = input_value("down_free", player) - input_value("up_free", player);
}

hspd = easy_smooth(move[0], movespd * xAxis, 2);
vspd = easy_smooth(move[1], movespd * yAxis, 2);
move[0] = 0;
move[1] = 0;
move[0] += hspd * global.delta_game_factor;
move[1] += vspd * global.delta_game_factor;

for (var c = 0; c < 2; c++)
{
    move_sub[c] += move[c];
    move_calc[c] = round(move_sub[c]);
    move_sub[c] -= move_calc[c];
}

repeat (abs(move[0]))
{
    if (place_meeting_micro(x + sign(move[0]), y, obj_avoid_solid))
        break;
    
    x += sign(move[0]);
}

repeat (abs(move[1]))
{
    if (place_meeting_micro(x, y + sign(move[1]), obj_avoid_solid))
        break;
    
    y += sign(move[1]);
}

anim_logic();
time += (0.0013 * global.delta_game_factor);
