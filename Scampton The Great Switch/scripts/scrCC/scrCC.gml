function tymeEQ(arg0, arg1, arg2, arg3)
{
    if (arg0 > ((arg3 * arg1) + arg2) && arg0 <= ((arg3 * arg1) + arg2 + arg1))
        return true;
    else
        return false;
}
