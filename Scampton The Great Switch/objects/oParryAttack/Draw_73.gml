if (scrACp("DrawLate"))
{
    if (scrACp("Heart1") || scrACp("Heart2") || scrACp("Heart3") || scrACp("Heart4"))
    {
        if (!scrACp("NoGlow"))
            drawPulse(ShowX + BobX, ShowY + BobY);
        
        draw_sprite_ext(sprite_index, image_index + 5, ShowX + BobX, ShowY + BobY, image_xscale, image_yscale, image_angle, RGB, image_alpha);
    }
    else
    {
        if (!scrACp("NoGlow"))
            drawPulse(ShowX + BobX, ShowY + BobY);
        
        draw_sprite_ext(sprite_index, image_index, ShowX + BobX, ShowY + BobY, image_xscale, image_yscale, image_angle, RGB, image_alpha);
    }
}

if (scrACp("Heart4"))
{
    if (other.Tyme > 58)
    {
        draw_sprite_ext(sScams, 14, ShowX + BobX, ((ShowY + BobY) - 16) + (a1 * 16), 2, 2, 0, RGB, a1 * 2);
        
        if (rTyme(3, Tyme) && a1 != 1)
            a1 += 0.25;
    }
}
