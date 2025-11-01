angle_move = point_direction(x, y, obj_map_player.x, obj_map_player.y);

if (abs(point_distance(x, y, obj_map_player.x, obj_map_player.y)) >= 48)
{
    chase_hspd = dsin(angle_move + 90) * chase_spd;
    chase_vspd = dcos(angle_move + 90) * chase_spd;
}

if (!inside_chase)
{
    chase_hspd = 0;
    chase_vspd = 0;
}

var _shift;

if (abs(chase_hspd) < 6)
    _shift = 0.1;
else if (abs(chase_hspd) < 10)
    _shift = 0.4;
else
    _shift = 0.25;

if (sign(chase_hspd) == -sign(hspd))
    _shift *= 2;

hspd = approach(hspd, chase_hspd, _shift);

if (abs(chase_vspd) < 6)
    _shift = 0.1;
else if (abs(chase_vspd) < 10)
    _shift = 0.4;
else
    _shift = 0.25;

if (sign(chase_vspd) == -sign(vspd))
    _shift *= 2.5;

vspd = approach(vspd, chase_vspd, _shift);

if (!inside_chase && hspd == 0 && vspd == 0)
{
    if (timer[1] == -1)
        timer[1] = 60;
}
else
{
    timer[1] = -1;
}
