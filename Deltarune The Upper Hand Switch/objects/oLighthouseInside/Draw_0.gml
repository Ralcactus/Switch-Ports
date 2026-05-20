time++;

if (removePedestal)
{
    if (pedestalAlpha < 1)
        pedestalAlpha += (1/30);
}

ext(sLighthouseInside, 0, 0, 0, 2, 2);
ext(char("s").sprite_index, char("s").image_index, char("s").x + (char("s").shakeX / 2), char("s").y + char("s").ey, 2, 2, 0, 0, 1, 0);

if (!surface_exists(surf))
    surf = surface_create(320, 240);

surface_set_target(surf);
draw_clear_alpha(c_white, 0);
ballSize += ((targetSize - ballSize) / targetDelay);
draw_circle(160 + (x / 2), 140 + (y / 2), ballSize + (dsin(time * 3) * 1), false);
i = 0;

repeat (array_length(waves))
{
    draw_circle(160 + (x / 2), 140 + (y / 2), waves[i][0], true);
    waves[i][0] += waves[i][1];
    i++;
}

gpu_set_colorwriteenable(1, 1, 1, 0);
ext(sLighthouseInside, 1, 0, 0, 1, 1);
ext(sPixel, 0, 150, 135, 20, 20, 0, 0, pedestalAlpha);
ext(char("s").sprite_index, char("s").image_index, (char("s").x / 2) + (char("s").shakeX / 4), (char("s").y / 2) + (char("s").ey / 2), 1, 1, 0, 16777215, 1, 1);
gpu_set_colorwriteenable(1, 1, 1, 1);
surface_reset_target();
draw_surface_ext(surf, 0, 0, 2, 2, 0, c_white, 1);

if (drawCrystal)
    ext(sShadowCrystal, 0, 320 + x + (irandom_range(-1, 1) * shake), 280 + y + (dcos(time * 3) * 2) + (irandom_range(-1, 1) * shake), 2, 2);

if (distanceModifier != -2)
{
    if (distanceModifier == -1)
    {
        i1 = (280 + y) / (char("s").y - 20);
        distanceIs = i1 * i1 * i1 * i1;
        audio_sound_gain(mus_crystal, distanceIs, 0);
    }
    else
    {
        distanceIs += ((distanceModifier - distanceIs) / 5);
        audio_sound_gain(mus_crystal, distanceIs, 0);
    }
}
