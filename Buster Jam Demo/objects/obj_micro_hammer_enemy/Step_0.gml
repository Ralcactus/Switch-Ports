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
    if (place_meeting_micro(x + sign(move[0]), y, obj_micro_hammer_slopemask))
    {
        hspd = slopespd * facing;
        
        while (place_meeting_micro(x + sign(move[0]), y, obj_micro_hammer_slopemask))
            y--;
    }
    else
    {
        hspd = walkspd * facing;
    }
    
    x += sign(move[0]);
}

repeat (abs(move[1]))
    y += sign(move[1]);

var _x;

if (facing == 1)
    _x = 770;
else
    _x = controller.game_width - 770;

if ((facing == 1 && x >= _x) || (facing == -1 && x <= _x))
{
    x = _x;
    hspd = 0;
}

if (place_meeting_micro(x, y, obj_micro_hammer_buster))
{
    if (instance_find_micro(obj_micro_hammer_buster).swing_frames)
        event_user(0);
}
