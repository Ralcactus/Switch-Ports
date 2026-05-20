function scrEEF(arg0, arg1, arg2)
{
    i = 0;
    
    if (arg0 == "Item")
    {
        while (i != 7)
        {
            i += 1;
            
            with (instance_create_depth(arg1, arg2, -9999, oEEF))
            {
                sprite_index = sStarEEF;
                Seed = "Star";
                RGB = make_color_rgb(0, 225, 0);
            }
        }
    }
    
    if (arg0 == "TP")
    {
        while (i != 7)
        {
            i += 1;
            
            with (instance_create_depth(arg1, arg2, -9999, oEEF))
            {
                sprite_index = sStarEEF;
                Seed = "Star";
                RGB = make_color_rgb(255, 160, 64);
            }
        }
    }
}
