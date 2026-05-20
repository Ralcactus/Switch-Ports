draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, RGB, image_alpha);
AllTyme += 1;

if (Bounce > 0)
    Tyme += 1;

if (Tyme >= 75)
{
    if (Tyme == 75 && false)
    {
        oNumber.Tyme = 100;
        oNumber.Bounce = 10;
    }
    
    image_yscale += 0.1;
    y -= 1;
    image_alpha -= 0.05;
}
else if ((round(AllTyme / 2) * 2) == AllTyme)
{
    if (image_yscale != 1)
        image_yscale += 0.1;
    
    x += Xspeed;
    
    if (Xspeed != 0)
        Xspeed -= 1;
    
    if (image_yscale > 0.25)
    {
        y += YSpeed;
        YSpeed += 1.5;
        
        if (y > (StartY + 20))
        {
            if (Bounce > 0)
            {
                y = StartY + 20;
                YSpeed = 0;
            }
            else
            {
                YSpeed *= -0.5;
                y = StartY + 20;
                Bounce += 1;
            }
        }
    }
}

if (image_alpha <= 0)
    instance_destroy();
