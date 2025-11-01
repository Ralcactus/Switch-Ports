function approach(arg0, arg1, arg2, arg3 = 1)
{
    if (arg0 < arg1)
        return min(arg0 + (arg2 * (arg3 * global.delta_game_factor)), arg1);
    else
        return max(arg0 - (arg2 * (arg3 * global.delta_game_factor)), arg1);
}
