function scr_mach_pizzano()
{
    move = key_left + key_right;
    hsp = xscale * movespeed;
    movespeed = min(movespeed + 0.07, 12);
    
    if (!grounded && move != 0)
    {
        if (move != xscale && movespeed > 1)
            movespeed -= 0.05;
        else if (move == xscale && movespeed < 12)
            movespeed += 0.05;
    }
}
