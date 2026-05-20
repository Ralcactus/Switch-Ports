function ma(arg0 = [], arg1 = sAttack1, arg2 = 0, arg3 = 0, arg4 = 0, arg5 = 2, arg6 = 2, arg7 = 0, arg8 = 0, arg9 = 0, arg10 = 0, arg11 = 0, arg12 = 0, arg13 = "0", arg14 = [0.05, 1, 0, 2.2, 5, 5], arg15 = [])
{
    with (instance_create_depth(arg3, arg4, -9999, oAttack))
    {
        seed = 0;
        seed = arg0;
        image_speed = 0;
        sprite_index = arg1;
        image_index = arg2;
        
        if (sprite_index == sHand1)
            image_index = irandom_range(0, 2);
        
        x = arg3;
        y = arg4;
        image_xscale = arg5;
        image_yscale = arg6;
        walkX = arg7;
        walkY = arg8;
        eX = arg9;
        eY = arg10;
        image_angle = arg11;
        startAngle = arg11;
        direction = arg12;
        
        if (string(arg13) != "0")
            speedCap = arg13;
        
        surfIn = arg14;
        star = arg15;
        depth = -1000;
        
        if (as("canRandom") && !op.challengeMode)
        {
            if (irandom_range(1, 2) == 1)
            {
                extraAngle = irandom_range(1, 360);
                specialStar = irandom_range(0, 5);
                
                if (irandom_range(1, 20) == 1)
                    specialStar = irandom_range(6, 9);
                
                if (op.language != 1)
                {
                    if (specialStar == 6)
                        specialStar = 10 + (op.language - 2);
                }
            }
        }
        
        if (as("star2"))
        {
            if (surfIn[3] == 2.2)
                surfIn[3] = 3;
        }
        
        if (as("depth1"))
            depth -= 500;
        
        if (as("depth2"))
            depth -= 9000;
        
        if (as("fadeIn"))
            image_alpha = 0;
        
        if (as("graze2"))
            graze = 2;
        
        if (as("graze3"))
            graze = 3;
        
        if (as("graze4"))
            graze = 4;
        
        if (as("graze10"))
            graze = 10;
    }
}

function as(arg0)
{
    if (arrayContains(seed, arg0))
        return true;
    else
        return false;
}
