function input_radial_sector(arg0, arg1, arg2, arg3, arg4 = 0, arg5 = 360, arg6 = 0, arg7 = 1, arg8 = undefined)
{
    var _result = input_xy(arg0, arg1, arg2, arg3, arg8, false);
    var _distance = point_distance(0, 0, _result.x, _result.y);
    
    if (_distance <= max(0, arg6) || _distance > arg7)
        return false;
    
    if (angle_difference(arg4, arg5) == 0)
        return true;
    
    arg4 %= 360;
    
    if (arg4 < 0)
        arg4 += 360;
    
    arg5 = (arg5 % 360) - arg4;
    
    if (arg5 < 0)
        arg5 += 360;
    
    var _direction = point_direction(0, 0, _result.x, _result.y) - arg4;
    
    if (_direction < 0)
        _direction += 360;
    
    return _direction < arg5;
}
