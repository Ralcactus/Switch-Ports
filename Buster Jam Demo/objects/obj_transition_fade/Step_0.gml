if (state == 0)
{
    alpha = approach(alpha, 1, global.fadein_spd);
    
    if (alpha == 1)
    {
        room_goto(rm_nothing);
        state = -1;
        timer[0] = 40 + delay;
    }
}
else if (state == 1)
{
    alpha = approach(alpha, 0, global.fadeout_spd);
    
    if (alpha == 0)
    {
        global.fadein_spd = 0.05;
        global.fadeout_spd = 0.05;
        instance_destroy();
    }
}

timer_logic(0);
timer_logic(1);
