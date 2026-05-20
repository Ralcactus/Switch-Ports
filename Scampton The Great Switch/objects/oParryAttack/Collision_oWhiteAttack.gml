if (scrACp("CartPip") && SedCol == 0)
{
    with (other)
    {
        if (scrACp("TrainFront"))
            other.SedCol = 1;
    }
    
    if (SedCol == 1)
    {
        depth -= 2000;
        ID[array_length(ID)] = "NoDamage";
        
        if (iRan(0, 1) == 0)
            WalkX = 4;
        else
            WalkX = -4;
        
        WalkY = -10;
        
        if (iRan(0, 1) == 0)
            RanSpin = 10;
        else
            RanSpin = -10;
        
        if (y < -50 || y > 530)
            des(0);
        else
            sou(96);
    }
}
