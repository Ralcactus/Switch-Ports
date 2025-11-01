if (state == 1)
{
    fade = approach(fade, 1.1, 0.08);
    
    if (fade == 1.1)
    {
        state = 2;
        draw = true;
    }
}
else if (state == 2)
{
    fade = approach(fade, 0, 0.08);
}
