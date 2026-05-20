function scrBoxStats(arg0, arg1, arg2, arg3, arg4, arg5)
{
    if (arg0 == "#")
        oMakeUI.Box_X = 320;
    else
        oMakeUI.Box_X = arg0;
    
    if (arg1 == "#")
        oMakeUI.Box_Y = 171;
    else
        oMakeUI.Box_Y = arg1;
    
    if (arg2 == "#")
        oMakeUI.Box_Xscale = 12.5;
    else
        oMakeUI.Box_Xscale = arg2;
    
    if (arg3 == "#")
        oMakeUI.Box_Yscale = 12.5;
    else
        oMakeUI.Box_Yscale = arg3;
    
    if (arg4 == "#")
        oMakeUI.Box_Depth = -3000;
    else
        oMakeUI.Box_Depth = arg4;
    
    oMakeUI.ExtraParry = arg5;
}
