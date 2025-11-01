if (state == 1 && global.input[0].pressed[4] && room != rm_city_s7a1)
{
    skipped = true;
    spd = 1;
    timer[0] = 1;
    
    with (obj_player)
        anim_index = 49;
}

timer_logic(0);
timer_logic(1);

if (state == 1)
{
    radius = lerp(radius, 125, 0.24);
}
else if (state == 2)
{
    radius += spd;
    
    if (skipped)
        spd += (spd * 0.125);
    else
        spd += (spd * 0.1);
    
    fade_alpha -= (spd * 0.001);
    
    if (fade_alpha <= 0)
        instance_destroy();
}

if (state >= 1)
    radius_add += 0.085;
