if (scrACp("DrawLate"))
    draw_sprite_ext(sprite_index, image_index, ShowX + BobX, ShowY + BobY, image_xscale, image_yscale, image_angle, RGB, image_alpha);

if (scrACp("CupATK"))
{
    if (k2 != 0)
    {
        if (k2 == 1)
        {
            draw_sprite_ext(sprite_index, 10, x, y - 48, 2, 2, 0, RGB, 1);
            Var1 = 0;
        }
        
        if (k2 == 2)
        {
            draw_sprite_ext(sprite_index, 10, x, y - 30, 2, 2, 0, RGB, 1);
            
            if (Var1 == 0)
                sou(34);
            
            Var1 = 1;
        }
        
        if (k2 == 3)
            draw_sprite_ext(sprite_index, 10, x, y - 32, 2, 2, 0, RGB, 1);
    }
    
    if ((oPattern.ParryEvent == 1 && k4 > 0 && k3 != 10) || (k3 == 10 && oPattern.i3 != i1))
        draw_sprite_ext(sprite_index, 11, x, y, 3 + sin(Tyme * 0.1), 3 + sin(Tyme * 0.1), 0, RGB, 0.75);
}
