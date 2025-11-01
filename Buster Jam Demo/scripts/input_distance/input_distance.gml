function input_distance(arg0, arg1, arg2, arg3, arg4 = undefined, arg5 = false)
{
    var _result = input_xy(arg0, arg1, arg2, arg3, arg4, arg5);
    return point_distance(0, 0, _result.x, _result.y);
}
