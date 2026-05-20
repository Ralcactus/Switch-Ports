function scrTextSpez()
{
    if (Seed == "GO")
    {
        if (Spez == 1)
        {
            if (oAlways.MM_Cursor == "GO_1")
                RGB = make_color_rgb(255, 255, 255);
            else
                RGB = make_color_rgb(63.75, 63.75, 63.75);
        }
        
        if (Spez == 2)
        {
            if (oAlways.MM_Cursor == "GO_2")
                RGB = make_color_rgb(255, 255, 255);
            else
                RGB = make_color_rgb(63.75, 63.75, 63.75);
        }
        
        if ((Spez == 1 && oAlways.MM_Cursor == "GO_1") || (Spez == 2 && oAlways.MM_Cursor == "GO_2"))
            draw_sprite_ext(sEH_hand, 0, StartX - 24, StartY + 14, 2, 2, 0, c_white, 1);
    }
    
    if (Spez == "AYS")
    {
        if (Tyme == 1)
            AlphaT = 0;
        
        if (Tyme >= 1 && Tyme <= 20)
        {
            AlphaT += 0.05;
            StartX -= 3;
        }
        
        draw_sprite_ext(sBoxFace, 3, ((StartX - BBxWithScale) + BumpX) - 40, (StartY - BByWithScale) + BumpY, 1, 1, 0, c_white, AlphaT);
    }
}
