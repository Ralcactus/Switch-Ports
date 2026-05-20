if (Seed == 2)
{
    if (Tyme == 1)
    {
        image_xscale = 0.25;
        image_yscale = 0.25;
    }
    
    if ((round(oP.Tyme / 2) * 2) == oP.Tyme)
    {
        image_alpha -= 0.2;
        image_xscale -= 0.05;
        image_yscale -= 0.05;
    }
    
    if (image_alpha <= 0 || image_xscale <= 0)
        des(0);
}

if ((round(oP.Tyme / 2) * 2) == oP.Tyme)
{
    ShowX = x;
    ShowY = y;
}

if ((round(oP.Tyme / 2) * 2) == oP.Tyme && Seed == 1)
{
    with (instance_create_depth(x, y, depth - 100, oParryWalk))
    {
        Seed = 2;
        wX = other.wX * -0.1;
        wY = other.wY * -0.1;
    }
}

RGB = make_color_rgb(_R, _G, _B);
drawPulse(ShowX, ShowY);
draw_sprite_ext(sprite_index, image_index, ShowX, ShowY, image_xscale, image_yscale, image_angle, RGB, image_alpha);
