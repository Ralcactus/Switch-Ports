Tyme += 1;

if (Tyme == 40)
{
    with (oPep)
    {
        if (Pep == other.Seed || other.Seed == 4)
            Wg = 20;
    }
    
    sou(105);
    
    if (Seed == 1 || Seed == 4)
    {
        oMakeUI.HP[0] += HP;
        
        if (oMakeUI.HP[0] >= oMakeUI.MaxHP[0])
        {
            MAX = true;
            MAX1 = true;
            oMakeUI.HP[0] = oMakeUI.MaxHP[0];
        }
    }
    
    if (Seed == 2 || Seed == 4)
    {
        oMakeUI.HP[1] += HP;
        
        if (oMakeUI.HP[1] >= oMakeUI.MaxHP[1])
        {
            MAX = true;
            MAX2 = true;
            oMakeUI.HP[1] = oMakeUI.MaxHP[1];
        }
    }
    
    if (Seed == 3 || Seed == 4)
    {
        oMakeUI.HP[2] += HP;
        
        if (oMakeUI.HP[2] >= oMakeUI.MaxHP[2])
        {
            MAX = true;
            MAX3 = true;
            oMakeUI.HP[2] = oMakeUI.MaxHP[2];
        }
    }
    
    y = 285;
    
    if (Seed != 4)
    {
        if (Seed == 1)
        {
            x = 45;
            y = 285;
            oKris.Glow = true;
            scrEEF("Item", x + 25, y);
        }
        
        if (Seed == 2)
        {
            x = 260;
            y = 285;
            oSusie.Glow = true;
            scrEEF("Item", x + 25, y);
        }
        
        if (Seed == 3)
        {
            x = 475;
            y = 285;
            oRalsei.Glow = true;
            scrEEF("Item", x + 25, y);
        }
        
        if (MAX)
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), "MAX", "#", 0);
        else
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), 0, HP, 0);
    }
    else
    {
        oKris.Glow = true;
        oSusie.Glow = true;
        oRalsei.Glow = true;
        oAlways.StackNumber = 0;
        x = 45;
        scrEEF("Item", x + 25, y);
        
        if (MAX1)
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), "MAX", "#", 0);
        else
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), 0, HP, 0);
        
        oAlways.StackNumber = 0;
        x = 260;
        scrEEF("Item", x + 25, y);
        
        if (MAX2)
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), "MAX", "#", 0);
        else
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), 0, HP, 0);
        
        oAlways.StackNumber = 0;
        x = 475;
        scrEEF("Item", x + 25, y);
        
        if (MAX3)
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), "MAX", "#", 0);
        else
            scrNumber(x, y, 288, make_color_rgb(0, 255, 0), 0, HP, 0);
    }
    
    oAlways.StackNumber = 0;
    instance_destroy();
}
