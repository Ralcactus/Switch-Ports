if (!surface_exists(surf))
    surf = surface_create(640, 480);

ext(sBBG1, 0, undefined, 0 + op.camY);
ext(sBBG1, 5, undefined, 0 + op.camY);
i = 0;

repeat (3)
{
    ext(sLighthoosPillar, 1, 320, 360 + (672 * i), 2, 2, 0, 16777215, 1, 0);
    i++;
}

i = 0;
i1 = 2;

repeat (3)
{
    if (op.camY < ((446 + (336 * (i + 1))) - 200))
        i2[i] -= i1 * 2;
    
    i2[i] = clamp(i2[i], -70, 70);
    ext(sSock_Left, op.ty / 5, 320 + i2[i], 446 + (336 * (i + 1)), i1, 2, 0, 16777215, 1, 0);
    i1 *= -1;
    i++;
}

i = 0;

repeat (3)
{
    ext(sLighthoosPillar, 0, 320, 360 + (672 * i), 2, 2, 0, 16777215, 1, 0);
    i++;
}

ext(sLighthoos, 1, 320, 460, 2, 2, 0, 16777215, 1, 0);
surface_set_target(surf);
draw_clear_alpha(c_white, 0);
ext(sHoosLight, 0, 320, 280, 0.6 + abs(dsin(op.ty * 1) * 1.4), 2, 90 + (dsin(op.ty * 1) * 90), 16777215, 1, 0);
gpu_set_colorwriteenable(1, 1, 1, 0);
ext(sLighthoos, 3, 320, 460, 2, 2, 0, 16777215, 1, 0);
ext(sBBG1, 5, undefined, 0 + op.camY, undefined, undefined, undefined, 0);
gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
draw_surface(surf, 0, 0);
ext(sLighthoos, 2, 320, 460, 2, 2, 0, 16777215, 1, 0);
surface_set_target(surf);
draw_clear_alpha(c_white, 0);
ext(sLighthoos, 4, 320, 460, 2, 2, 0, 16777215, 1, 0);
gpu_set_colorwriteenable(1, 1, 1, 0);
ext(sHoosLight, 0, 320, 280, 0.6 + abs(dsin(op.ty * 1) * 1.4), 4, 90 + (dsin(op.ty * 1) * 90), 16777215, 1, 0);
gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
draw_surface(surf, 0, 0);
