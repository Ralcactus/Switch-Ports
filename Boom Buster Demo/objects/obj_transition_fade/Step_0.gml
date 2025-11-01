timer_logic(0);

if (state == 0)
{
    fade_alpha = approach(fade_alpha, 1, 0.08);
    
    if (fade_alpha >= 1 && !set)
    {
        set = true;
        timer[0] = 60;
    }
}
else if (state == 1)
{
    fade_alpha = approach(fade_alpha, 0, 0.08);
    
    if (fade_alpha <= 0)
        instance_destroy();
}
