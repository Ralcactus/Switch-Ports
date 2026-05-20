if (Seed == 0)
    image_speed = Speed + 0.5;

Tyme += 1;

if (Tyme == 1)
{
    x += MoveX;
    y += MoveY;
    
    if (Seed != 0)
    {
        while (Spin == 0)
            Spin = irandom_range(-10, 10);
    }
}

if ((round(Tyme / 2) * 2) == Tyme && Speed != 0)
{
    x += (MoveX * Speed);
    y += (MoveY * Speed);
    image_angle += (Spin * Speed);
    MoveY += 1;
}

if (Tyme > 10 && Speed > 0.01 && oP.NoHit == "Disabled" && Seed == 0)
    Speed -= 0.015;

if (Speed <= 0.01)
{
    Speed = 0;
    StayX = x;
    StayY = y;
    Offset1 = irandom_range(0, 1000) / 10;
    Offset2 = irandom_range(0, 20) / 100;
}

if (Speed == 0)
{
    x = StayX;
    y = StayY + (sin((Tyme + Offset1) * 0.01) * (0.1 + Offset2));
}
