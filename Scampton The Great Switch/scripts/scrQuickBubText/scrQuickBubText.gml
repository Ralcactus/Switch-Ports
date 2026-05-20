function scrQuickBubText(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    with (instance_create_depth(arg1, arg2, -9999, oTextEngine))
    {
        Seed = "FixCCtyme";
        Font = sFont_Sma;
        RGB = make_color_rgb(0, 0, 0);
        BC = false;
        image_xscale = 1;
        image_yscale = 1;
        Bubble_Xscale[0] = arg3;
        Bubble_Yscale[0] = arg4;
        Bubble_Arrow[0] = arg5;
        
        if (arg6 != 0)
            Voice = arg6;
        
        Text[0] = arg0;
    }
}
