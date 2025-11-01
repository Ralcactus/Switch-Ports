timer_logic(0);
anim_logic();

if (!controller.win)
{
    anim_play(spr_Bu_avoid_square_win);
    hspd = 0;
    vspd = 0;
}

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
    {
        hspd = -hspd;
        break;
    }
    
    x += sign(move[0]);
}

repeat (abs(move[1]))
{
    if (place_meeting_micro(x, y + sign(move[1]), obj_avoid_solid))
    {
        vspd = -vspd;
        break;
    }
    
    y += sign(move[1]);
}
