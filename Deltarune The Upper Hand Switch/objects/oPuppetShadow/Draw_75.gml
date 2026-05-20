time++;

if (!surface_exists(surf2))
    surf2 = surface_create(320, 120);

surface_set_target(surf2);
ext(sPixel, 0, 0, 0, 999, 999, 0, rgb(127.5 * alpha, 127.5 * alpha, 127.5 * alpha), 1);
lightTime++;

if (lightMode == 0 || lightMode == 1)
{
    if (lightTime == 1)
        lightA = [0, 160, -100, 160, 300];
    
    if (lightMode == 1)
        lightA[0] += 6;
    
    lightA[1] += ((160 + (dcos(time * 5) * 75)) - lightA[1]) / 5;
    lightA[2] += ((60 + (dsin(time * 5) * 15)) - lightA[2]) / 5;
    lightA[3] += ((160 + (dcos(180 + (time * 5)) * 75)) - lightA[3]) / 5;
    lightA[4] += ((60 + (dsin(180 + (time * 5)) * 15)) - lightA[4]) / 5;
    circ(lightA[1], lightA[2], 40 + lightA[0]);
    circ(lightA[3], lightA[4], 40 + lightA[0]);
}

if (lightMode >= 2 && lightMode <= 10)
{
    if (lightTime == 1)
    {
        lightA[0] = 200;
        lightA[1] = 160;
        lightA[2] = 50;
    }
    
    if (lightMode == 2)
        lightA[0] += (50 - lightA[0]) / 5;
    
    if (lightMode == 3)
        lightA[0] += (200 - lightA[0]) / 5;
    
    if (lightMode == 4)
    {
        lightA[0] += (100 - lightA[0]) / 5;
        lightA[1] += (175 - lightA[1]) / 5;
        lightA[2] += (100 - lightA[2]) / 5;
    }
    
    if (lightMode == 5)
    {
        lightA[0] += (50 - lightA[0]) / 5;
        lightA[1] += (175 - lightA[1]) / 5;
        lightA[2] += (100 - lightA[2]) / 5;
    }
    
    if (lightMode == 6)
    {
        lightA[0] += (140 - lightA[0]) / 10;
        lightA[1] += (160 - lightA[1]) / 10;
        lightA[2] += (100 - lightA[2]) / 10;
    }
    
    if (lightMode == 7)
    {
        lightA[0] += (116 - lightA[0]) / 30;
        lightA[1] += (160 - lightA[1]) / 10;
        lightA[2] += (100 - lightA[2]) / 10;
    }
    
    if (lightMode == 8)
        lightA = [400, 254, 34];
    
    if (lightMode == 9)
        lightA[0] += (25 - lightA[0]) / 5;
    
    if (lightMode == 10)
        lightA[0] += (0 - lightA[0]) / 3;
    
    circ(lightA[1], lightA[2], lightA[0]);
}

surface_reset_target();

if (room != rPuppetshow2)
{
    gpu_set_blendmode(bm_subtract);
    draw_surface_ext(surf2, 0, 0, 2, 2, 0, c_white, 1);
    gpu_set_blendmode(bm_normal);
}

if (time > 10)
{
    if (alpha < targetAlpha)
        alpha += 0.05;
    
    if (alpha > targetAlpha)
        alpha -= 0.05;
}
