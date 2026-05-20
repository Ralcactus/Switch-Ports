Tyme += 1;

if (Var1 == 0)
    y += ((75 - y) / 15);

if (Tyme == 100)
    image_speed = 1;

if (image_index == 3)
    image_speed = 0;

if (Var1 > 0)
{
    if (Var1 == 20)
        yGrav = 10;
    
    Var1 += 1;
    
    if (Var1 >= 20)
    {
        x -= 5;
        y += yGrav;
        yGrav -= 0.5;
        
        if (Var1 >= 30 && Var1 <= 65)
        {
            with (instance_create_depth(x, y, -15000, oEEF))
            {
                Seed = "StarDown";
                sprite_index = sStarEEF_2;
                RGB = make_color_rgb(0, 255, 0);
            }
        }
    }
    
    if (y < -100)
        instance_destroy();
}
