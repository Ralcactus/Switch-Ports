Tyme += 1;
GlassesTime += 1;

if (GlassesTime > GTt)
    GTt = GlassesTime;

if (image_index > 0)
{
    GlassesTime = 0;
    GlassesX += 2;
    GlassesY += GlassesGrav;
    GlassesGrav += 0.25;
    GlassesROT += 30;
    
    if (GTt < 475)
        GlassesY = 999;
}

if (Die)
    scrGoldenPipisDie();

if (y < oMakeUI.Box_Y)
{
    y += 5;
    
    if (y > oMakeUI.Box_Y)
        y = oMakeUI.Box_Y;
    
    if (place_meeting(x, y, oSoul))
    {
        with (oSoul)
            y += 5;
    }
}

if (FallY == 0)
{
    if (oSoul.Seed == "EndPattern")
    {
        FallY = 0.25;
        
        if (GTt < 475)
            GlassesY = 999;
    }
}

if (FallY != 0)
{
    y += FallY;
    FallY += 0.25;
    
    if (y > 520)
        instance_destroy();
}

if (GlassesTime >= 475 && GlassesY < 800)
    GlassesY *= 0.95;

if (image_index == 0 && (round(Tyme / 20) * 20) == Tyme)
{
    with (instance_create_depth(x + (round(irandom_range(-16, 16) / 2) * 2), y + (round(irandom_range(-12, 12) / 2) * 2), -20000, oEEF))
    {
        Seed = "4sDel";
        sprite_index = sSpark;
    }
}

if (image_index > 0 && oAlways.GoldenPipisPoints == 0)
    oAlways.GoldenPipisPoints = 1;
