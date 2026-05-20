if (scrACp("WhiteParry"))
{
    _R = 255;
    _G = 255;
    _B = 255;
}

RGB = make_color_rgb(_R, _G, _B);
BobX = round(BobX);
BobY = round(BobY);

if (rTyme(2, Tyme))
{
    ShowX = round(x);
    ShowY = round(y);
}

if (scrACp("ScamsHeart1"))
{
    if (Tyme >= 2)
    {
        i1 = 0;
        
        repeat (15)
        {
            i2[0] = ((x - oPattern.i1[0]) / 15) * i1;
            i2[1] = ((y - oPattern.i1[1]) / 15) * i1;
            i1++;
            draw_sprite_ext(sprite_index, 9, round((oPattern.i1[0] + i2[0]) / 2) * 2, round((oPattern.i1[1] + i2[1]) / 2) * 2, image_xscale, image_yscale, 0, RGB, image_alpha);
        }
    }
}

if (!scrACp("UneAN"))
{
    if (!scrACp("NoGlow"))
        drawPulse(ShowX + BobX, ShowY + BobY);
    
    draw_sprite_ext(sprite_index, image_index, ShowX + BobX, ShowY + BobY, image_xscale, image_yscale, image_angle, RGB, image_alpha);
}
