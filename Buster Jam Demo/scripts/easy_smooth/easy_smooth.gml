function easy_smooth(arg0, arg1, arg2, arg3 = true)
{
    var _delta;
    
    if (arg3)
        _delta = global.delta_game_factor;
    else
        _delta = 1;
    
    return arg0 + (_delta * ((arg1 - arg0) / arg2));
}
