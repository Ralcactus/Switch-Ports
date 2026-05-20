function scrTurnSoul(arg0)
{
    if (arg0 == 1)
    {
        if (image_angle == -90)
            TargetROT += 180;
        
        if (image_angle == 180)
            TargetROT += -90;
        
        if (image_angle == 0)
            TargetROT += 90;
        
        image_angle = 90;
    }
    
    if (arg0 == 2)
    {
        if (image_angle == 90)
            TargetROT += 180;
        
        if (image_angle == 180)
            TargetROT += 90;
        
        if (image_angle == 0)
            TargetROT += -90;
        
        image_angle = -90;
    }
    
    if (arg0 == 3)
    {
        if (image_angle == 90)
            TargetROT += 90;
        
        if (image_angle == -90)
            TargetROT += -90;
        
        if (image_angle == 0)
            TargetROT += 180;
        
        image_angle = 180;
    }
    
    if (arg0 == 4)
    {
        if (image_angle == 90)
            TargetROT += -90;
        
        if (image_angle == -90)
            TargetROT += 90;
        
        if (image_angle == 180)
            TargetROT += 180;
        
        image_angle = 0;
    }
}
