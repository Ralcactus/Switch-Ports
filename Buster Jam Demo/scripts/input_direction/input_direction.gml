function input_direction(arg0, arg1, arg2, arg3, arg4, arg5 = undefined, arg6 = false)
{
    if (is_string(arg0))
        __input_error("Usage of input_direction() has changed. Please refer to documentation for details");
    
    var _result = input_xy(arg1, arg2, arg3, arg4, arg5, arg6);
    
    if (_result.x == 0 && _result.y == 0)
        return arg0;
    
    return point_direction(0, 0, _result.x, _result.y);
}
