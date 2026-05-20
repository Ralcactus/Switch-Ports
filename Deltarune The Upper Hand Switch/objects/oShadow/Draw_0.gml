if (state == 0)
{
    if (image_alpha != 0.5)
        image_alpha += 0.1;
}

if (state == 1)
{
    image_alpha -= 0.1;
    
    if (image_alpha <= 0)
        des(0);
}

ext(sPixel, 0, 0, 0, 640, 480, 0, 0, image_alpha, 0);
