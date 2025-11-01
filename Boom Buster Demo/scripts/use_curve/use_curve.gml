function use_curve(arg0, arg1, arg2 = "curve1", arg3, arg4)
{
    var _curve = animcurve_get_channel(arg0, arg2);
    var _pos = animcurve_channel_evaluate(_curve, arg1);
    var _distance = arg4 - arg3;
    return arg3 + (_distance * _pos);
}
