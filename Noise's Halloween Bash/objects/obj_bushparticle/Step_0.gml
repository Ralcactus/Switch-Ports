if (game_paused())
    exit;

if (!scr_solid(x, y + 1))
{
    leafwave = wave(1, -1, 0.5, global.game_cycleMS);
    hsp = approach(endhsp, 3, 0.5);
    x += hsp;
    y += vsp;
    vsp += grav;
    
    if (vsp > 5)
        vsp = 5;
}
else
{
    image_alpha -= 0.02;
    
    if (image_alpha <= 0)
        instance_destroy();
}
