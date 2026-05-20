if (Seed == "ParrySmoke")
{
    if (rTyme(2, Tyme))
        Var1 += 1;
    
    draw_circle(x + (Var1 * 2), y + (Var1 * 2), 10 - Var1, false);
    draw_circle(x - (Var1 * 2), y + (Var1 * 2), 10 - Var1, false);
    draw_circle(x + (Var1 * 2), y - (Var1 * 2), 10 - Var1, false);
    draw_circle(x - (Var1 * 2), y - (Var1 * 2), 10 - Var1, false);
    
    if (Var1 >= 10)
        des(0);
}

if (Seed == "WhiteFlash")
{
    draw_sprite_ext(sWhite, 0, 0, 0, 50, 50, 0, c_white, image_alpha);
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        des(0);
}

if (Seed == "WhiteFlash2")
{
    if (Tyme == 0)
    {
        Var2 = 2;
        Var3 = 1;
    }
    
    if (Tyme > 50)
    {
        draw_sprite_ext(sSplode, 0, 320, 240, Var2, Var2, 0, c_white, Var3);
        draw_sprite_ext(sWhite, 0, 0, 0, 50, 50, 0, c_white, image_alpha);
        image_alpha -= 0.025;
        Var2 += 0.001;
        
        if (Tyme > 125)
            Var3 -= 0.01;
        
        if (Var3 <= 0)
            des(0);
    }
    else
    {
        Var1 += 20;
        draw_circle(320, 240, Var1, false);
    }
}

if (Seed == "BattleToFade")
{
    if (Tyme > 25)
    {
        if (i2 == 0)
        {
            persistent = true;
            image_alpha += 0.0075;
            draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_white, image_alpha);
        }
        else
        {
            i3 += 2;
            i4 += i3;
            draw_sprite_ext(sWhite4, 0, -i4, 0, 11, 100, 0, c_white, image_alpha);
            draw_sprite_ext(sWhite4, 0, i4 + 640, 0, -11, 100, 0, c_white, image_alpha);
            
            if (i4 > 300)
            {
                persistent = false;
                des(0);
            }
        }
        
        if (Tyme == 250)
        {
            i2 = 1;
            instance_create_depth(0, 0, 0, oStartBattle1);
        }
    }
}
