function screen_shake(arg0, arg1, arg2 = obj_persistent.shake_default)
{
    with (obj_persistent)
    {
        shake_strength[0] = arg0;
        shake_strength[1] = arg1;
        
        if (arg0 > 0)
            shake_speed[0] = arg2;
        
        if (arg1 > 0)
            shake_speed[1] = arg2;
    }
}
