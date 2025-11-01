function screen_shake(arg0 = -4, arg1 = -4, arg2 = 0.22)
{
    if (arg0 != -4)
        global.screen_shake[0] = arg0;
    
    if (arg1 != -4)
        global.screen_shake[1] = arg1;
    
    global.screen_shake_dec = arg2;
}
