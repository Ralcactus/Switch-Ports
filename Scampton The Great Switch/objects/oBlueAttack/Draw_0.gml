if (sprite_index == sSpamHead)
{
    if ((Loops + 1) > 0)
    {
        image_speed = AnSpeed;
        
        if (image_index == 1)
        {
            if (LAP)
            {
                Loops -= 1;
                LAP = false;
            }
        }
        else
        {
            LAP = true;
        }
    }
    
    if ((Loops + 1) <= 0)
    {
        image_speed = 0;
        image_index = 0;
        Loops = 0;
    }
}

RGB = make_color_rgb(_R, _G, _B);
image_xscale = Scale * Xscale;
image_yscale = Scale;

if ((round(Tyme / 2) * 2) == Tyme)
{
    ShowX = x;
    ShowY = y;
}

draw_sprite_ext(sprite_index, image_index, ShowX, ShowY, image_xscale, image_yscale, image_angle, make_color_rgb(_R + abs(sin(Tyme * 0.075) * 40), _G + abs(sin(Tyme * 0.075) * 40), _B), image_alpha);
