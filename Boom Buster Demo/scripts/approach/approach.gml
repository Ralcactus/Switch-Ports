function approach(arg0, arg1, arg2)
{
    if (arg0 < arg1)
        return min(arg0 + arg2, arg1);
    else
        return max(arg0 - arg2, arg1);
}
