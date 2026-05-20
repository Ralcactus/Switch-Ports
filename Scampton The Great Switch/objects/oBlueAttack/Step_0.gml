if (oSoul.Seed == "EndPattern")
    instance_destroy();

if (x < -1680 || x > 2320 || y < -1760 || y > 2240)
{
    oSoul.SmallHead += 1;
    instance_destroy();
}

Tyme += 1;

if (DamageTime != 0)
    DamageTime -= 1;

if (scrACp("Wob"))
{
    if (WalkX != 0)
        x += (WalkX - (sin((Tyme + OffsetExy) * 0.05) * 2 * sign(eX)));
    
    if (WalkY != 0)
        y += (WalkY - (sin((Tyme + OffsetExy) * 0.05) * 2 * sign(eY)));
}
else
{
    x += WalkX;
    y += WalkY;
}

image_angle += RanSpin;
WalkX += eX;
WalkY += eY;

if (WalkX > SpeedCap)
    WalkX = SpeedCap;

if (WalkX < -SpeedCap)
    WalkX = -SpeedCap;

if (WalkY > SpeedCap)
    WalkY = SpeedCap;

if (WalkY < -SpeedCap)
    WalkY = -SpeedCap;

if (Seed == "Intro_R" || Seed == "Intro_L" || Seed == "Intro_D" || Seed == "Intro_U")
{
    if (Tyme < 20)
    {
        Var1 = 10;
    }
    else
    {
        if (Tyme < 90)
            Var1 = 1;
        
        if (Tyme > 90)
            Var1 = 0;
    }
    
    if (Seed == "Intro_R")
        x -= Var1;
    
    if (Seed == "Intro_L")
        x += Var1;
    
    if (Seed == "Intro_D")
        y -= Var1;
    
    if (Seed == "Intro_U")
        y += Var1;
}

if (scrACp("Ghi"))
{
    if (Tyme <= 20)
        image_alpha += 0.05;
}

if (scrACp("BounceBox"))
{
    if (place_meeting(x, y, oBox) && Var1 == 0)
    {
        Var1 += 1;
        WalkX *= -1;
        WalkY *= -1;
    }
}

if (scrACp("WaitFront1") && Tyme == 10)
    depth -= 1000;

if (scrACp("Front2") && Tyme == 1)
    depth -= 3000;

if (scrACp("GP_") && (place_meeting(x, y, oGoldenPipis) && oGoldenPipis.y == oMakeUI.Box_Y))
{
    oGoldenPipis.image_index += 1;
    
    if (oP.NoHit == "Enabled")
        oGoldenPipis.image_index += 1;
    
    oGoldenPipis.White = 1;
    sou(88);
    
    if (Scale > 1.9)
        oSoul.BigHead += 1;
    else
        oSoul.SmallHead += 1;
    
    if (oGoldenPipis.image_index > 1)
    {
        oGoldenPipis.Die = true;
    }
    else
    {
        with (instance_create_depth(oGoldenPipis.x, oGoldenPipis.y, depth, oEEF))
        {
            Seed = "Pipis_B";
            sprite_index = sGoldenPipis_B;
            image_xscale = 1;
            image_yscale = 1;
        }
        
        with (instance_create_depth(oGoldenPipis.x, oGoldenPipis.y, depth, oEEF))
        {
            Seed = "Pipis_B";
            sprite_index = sGoldenPipis_B;
            image_xscale = 1;
            image_yscale = 1;
        }
        
        with (instance_create_depth(oGoldenPipis.x, oGoldenPipis.y, depth, oEEF))
        {
            Seed = "Pipis_B";
            sprite_index = sGoldenPipis_B;
            image_xscale = 1;
            image_yscale = 1;
        }
    }
    
    instance_destroy();
}

if (scrACp("GP_"))
{
    if (Var1 == "Target")
    {
        direction = point_direction(x, y, oMakeUI.Box_X, oMakeUI.Box_Y);
        speed = Var2;
        Var2 += 0.01;
    }
}

if (scrACp("GP1"))
{
    if (Tyme <= 60)
        y += ((oMakeUI.Box_Y - y) / 10);
    
    if (Tyme == 60)
    {
        y = oMakeUI.Box_Y;
        eX = -0.01;
    }
}

if (scrACp("GP2"))
{
    if (Tyme <= 60)
    {
        if (x > oMakeUI.Box_X)
            x += ((StartX - 270 - x) / 20);
        else
            x += (((StartX + 270) - x) / 20);
    }
    
    if (Tyme == 61)
        Var1 = "Target";
}

if (scrACp("GP3"))
{
    if (Tyme <= 80)
    {
        if (y > oMakeUI.Box_Y)
            y += ((oMakeUI.Box_Y - y) / 17.5);
        else
            y += ((oMakeUI.Box_Y - y) / 17.5);
    }
    
    if (Tyme == 100)
    {
        Var1 = "Target";
        y = oMakeUI.Box_Y;
    }
}

if (scrACp("SpezMouth1"))
{
    if (StartY < 0)
    {
        if (Tyme == 120)
            Loops = 1;
        
        if (Tyme == 130)
            scrMakeAttack(oWhiteAttack, "RanSpin@3speed@Front2", x, y, 0, 0, 0, 0, 0, sOrb, 0, 0, 1, 1, 0, point_direction(x, y, oSoul.x, oSoul.y));
    }
    else
    {
        if (Tyme == 150)
            Loops = 1;
        
        if (Tyme == 160)
            scrMakeAttack(oWhiteAttack, "RanSpin@3speed@Front2", x, y, 0, 0, 0, 0, 0, sOrb, 0, 0, 1, 1, 0, point_direction(x, y, oSoul.x, oSoul.y));
    }
}

if (scrACp("GPk1"))
{
    if (Tyme == 60)
    {
        Var1 = "Target";
        Var2 = 0.5;
    }
    
    if (Tyme <= 60)
    {
        if (x < 320)
            x += ((120 - x) / 15);
        else
            x += ((520 - x) / 15);
    }
}

if (scrACp("GPk2"))
{
    if (Tyme == 60)
    {
        Var1 = "Target";
        Var2 = 0.5;
    }
    
    if (Tyme <= 60)
    {
        if (x < 320)
            x += ((220 - x) / 15);
        else
            x += ((420 - x) / 15);
    }
}

if (scrACp("GPk3"))
{
    if (Tyme == 90)
        Var1 = "Target";
    
    if (Tyme <= 90)
    {
        if (y < oMakeUI.Box_Y)
            y += ((oMakeUI.Box_Y - 40 - y) / 15);
        else
            y += (((oMakeUI.Box_Y + 40) - y) / 15);
    }
}

if (scrACp("GPk4"))
{
    if (Tyme == 60)
    {
        Var1 = "Target";
        Var2 = 0.25;
    }
    
    if (Tyme <= 60)
    {
        if (x < 320)
            x += ((220 - x) / 15);
        else
            x += ((420 - x) / 15);
    }
}

if (scrACp("GPk5"))
{
    if (Tyme == 60)
    {
        Var1 = "Target";
        Var2 = 0.25;
    }
    
    if (Tyme <= 60)
    {
        if (x < 320)
            x += ((180 - x) / 15);
        else
            x += ((460 - x) / 15);
    }
}
