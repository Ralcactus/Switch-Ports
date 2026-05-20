function scrTPmakeRGB(arg0, arg1, arg2)
{
    RGB = make_color_rgb(127.5, 127.5, 127.5);
    
    if (other.Party[other.PartyTurn] == 2)
    {
        if (oTP.TP >= arg0)
        {
            RGB = make_color_rgb(255, 128, 255);
            
            if (arg2 != 0)
                RGB = make_color_rgb(255, 255, 255);
        }
    }
    else if (oTP.TP >= arg1)
    {
        RGB = make_color_rgb(128, 255, 128);
        
        if (arg2 != 0)
            RGB = make_color_rgb(255, 255, 255);
    }
}
