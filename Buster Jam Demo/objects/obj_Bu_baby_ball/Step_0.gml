if (!place_meeting_micro(x, y + 1, obj_baby_solid))
    vspd += grav;

move[0] = 0;
move[1] = 0;
move[0] += hspd;
move[1] += vspd;

for (var c = 0; c < 2; c++)
{
    move_sub[c] += move[c];
    move_calc[c] = round(move_sub[c]);
    move_sub[c] -= move_calc[c];
}

repeat (abs(move[0]))
{
    if (place_meeting_micro(x + sign(move[0]), y, obj_baby_solid))
    {
        hspd = -hspd * 0.6;
        break;
    }
    
    x += sign(move[0]);
}

repeat (abs(move[1]))
{
    if (place_meeting_micro(x, y + sign(move[1]), obj_baby_solid))
    {
        vspd = -vspd * 0.6;
        break;
    }
    
    y += sign(move[1]);
}
