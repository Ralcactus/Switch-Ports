testvariablenothing = false;
finished = false;

if (array_length(pos_move) == 0)
{
    var _inst;
    
    with (obj_map_actor_marker)
    {
        if (ID == other.marker_ID)
            _inst = id;
    }
    
    xto = _inst.x;
    yto = _inst.y;
}
else
{
    xto = pos_move[0];
    yto = pos_move[1];
}

cutscene_move = true;
move_xstart = x;
move_ystart = y;
percent_move = 0;
var _dist = point_distance(move_xstart, move_ystart, xto, yto);

if (shift_override != undefined)
    move_shift = shift_override;
else
    move_shift = movespd / _dist;

if (move_jump)
{
    var _jumptime = 1 / move_shift;
    var _tUp = _jumptime / 2;
    grav = (2 * jump_height) / (_tUp * _tUp);
    var _strength = grav * _tUp;
    zspd = -_strength;
}

if (ID == 0)
{
    print(string("move_shift:{0}", move_shift));
    print(string("grav:{0}", grav));
    print(string("zspd:{0}", zspd));
}
