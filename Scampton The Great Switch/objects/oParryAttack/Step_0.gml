PastX = x;
PastY = y;
Tyme++;

if (ParryFrame > 0 && !place_meeting(x, y, oSoul))
    ParryFrame--;

if (Tyme == 1)
    CT_PH_Start = CT_PH;

if (!scrACp("ScamsHeart1") && !scrACp("BlueThrough") && ParryFrame == 0)
{
    if (CT_PH_Start != CT_PH && !place_meeting(x, y, oSoul))
    {
        if (!scrACp("NoDamage") && DamageTime == 0)
        {
            if (oSoul.i_Frames == 0)
            {
                oSoul.i_Frames = oSoul.i_F;
                oAlways.Damage = true;
            }
            
            if (!scrACp("NoDestroy"))
                instance_destroy();
        }
    }
}

if (ParryWait > 0)
    ParryWait -= 1;

if (oSoul.Seed == "EndPattern")
    instance_destroy();

if (x < -1680 || x > 2320 || y < -1760 || y > 2240)
    instance_destroy();

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

if (rTyme(2, Tyme))
    image_angle += (RanSpin * 2);

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

if (Tyme == 1)
    CT_PH_Start = CT_PH;

if (CT_PH_Start != CT_PH && !place_meeting(x, y, oSoul))
    CT_PH = CT_PH_Start;

scrBothBullet();

if (scrACp("Ghi"))
{
    if (Tyme <= 20 && (round(Tyme / 2) * 2) == Tyme)
        image_alpha += 0.1;
}

if (scrACp("PipBob"))
    BobY = -abs(sin(Tyme * 0.1) * 15);

if (scrACp("PipiEdge"))
{
    if (x <= 130)
    {
        with (instance_create_depth(x, y, depth - 1000, oEEF))
        {
            Seed = "BallBye";
            sprite_index = sBallBye;
        }
        
        repeat (9)
        {
            i1 = iRan(-8, 8) * 2;
            i2 = iRan(-8, 8) * 2;
            scrMakeAttack(oWhiteAttack, "Walk10@XSsez@Front2@NoDestroy", x + i1, y + i2, 0, 0, 0, 0, 0, 216, 0, 0, -1, 1, 0, point_direction(x + i1, y + i2, oSoul.x, oSoul.y) + iRan(-30, 30));
        }
        
        sou(49);
        oAlways.ShakePower = 5;
        oAlways.ShakeTyme = 5;
        des(0);
    }
}

if (scrACp("LayerFrontDown"))
{
    if ((x < oSoul.x || i1 == 1) && i2 != 1)
    {
        i1 = 1;
        x += 1;
    }
    
    if ((x > oSoul.x || i2 == 1) && i1 != 1)
    {
        i2 = 1;
        x -= 1;
    }
    
    if (WalkY > 0 && i3 == 0)
    {
        depth = -15000;
        i3 = 1;
    }
}

if (scrACp("ScamsHeart1"))
{
    if (Tyme == 1)
    {
        i3[0] = 0;
        i3[1] = 1;
        i4[0] = 1;
        i4[1] = 0;
        k1 = 100;
        k2 = oPattern.i2;
        
        if (scrACp("Heart2"))
        {
            Var2 = 8;
            i4[1] = 90;
        }
        
        if (scrACp("Heart3"))
            i4[1] = 135;
    }
    
    if (scrACp("Heart1"))
    {
        x = oPattern.BoxX + (i3[1] * 235) + (sin(Tyme * 0.025) * 100 * i3[0]);
        y = oPattern.BoxY + (sin(i4[1] * 0.05) * 100 * i3[0]);
    }
    
    if (scrACp("Heart2"))
    {
        if (k1 <= 0)
        {
            x += 13.3;
            Var1 = 0;
        }
        else
        {
            if (x > oSoul.x)
                Var1 += ((-2 - Var1) / 48);
            
            if (x < oSoul.x)
                Var1 += ((2 - Var1) / 48);
            
            x -= Var2;
            Var2 += ((0 - Var2) / 12);
        }
        
        x += Var1;
        y = oPattern.BoxY + (sin(i4[1] * 0.0375) * 125 * i3[0]);
    }
    
    if (scrACp("Heart3"))
    {
        x = oPattern.BoxX + (i3[1] * 235) + (sin(Tyme * 0.0375) * 100 * i3[0]);
        y = oPattern.BoxY + (cos(i4[1] * 0.05) * 150 * i3[0]);
    }
    
    if (PPP == 1)
    {
        PPP = 0;
        k1 -= k2;
        k2 = 0;
        i4[0] *= -1;
    }
    
    if (k1 <= 0)
    {
        o1++;
        
        if (o1 == 1 && !oMakeUI.LoopGoop && oPattern.Var1 == 2 && oMakeUI.Spare >= 76)
            oTP.TP = 100;
        
        if (i3[0] != 0)
        {
            i3[0] -= 0.075;
            
            if (i3[0] < 0)
                i3[0] = 0;
        }
        else if (k3 == 0)
        {
            with (oWhiteAttack)
            {
                if (scrACp("Scams"))
                    k1 = 1;
            }
            
            oPattern.Var1--;
            oPattern.Var2--;
            sou(96);
            oAlways.ShakePower = 5;
            oAlways.ShakeTyme = 5;
            des(0);
            k3 = 1;
        }
        
        if (i3[1] != 1)
        {
            i3[1] += 0.075;
            
            if (i3[1] > 1)
                i3[1] = 1;
        }
    }
    else
    {
        if (k2 < oPattern.i2)
        {
            k2 += 0.25;
        }
        else
        {
            k2 = oPattern.i2;
            
            if (k1 > 20)
            {
                if (oPattern.Pattern == "B3")
                    k1 -= 0.01;
                else
                    k1 -= 0.05;
            }
        }
        
        i4[1] += i4[0];
        
        if (rTyme(2, Tyme))
            image_angle = sin(Tyme * 0.1) * 30;
        
        if (i3[0] != 1)
            i3[0] += 0.01;
        
        i3[1] += (0 - i3[1]) / 12;
    }
    
    if (scrACp("Heart4"))
    {
        image_angle = 0;
        
        if (Tyme == 1)
            Var1 = 5;
        
        if (Tyme == 110)
            sou(63);
        
        if (Tyme >= 100 && rTyme(2, Tyme))
            Var2 += 1;
        
        x -= Var1;
        y += Var2;
        
        if (y > 700)
            y = 700;
        
        if (rTyme(4, Tyme) && Var1 != 0)
            Var1--;
        
        if (Tyme >= 122)
        {
            with (oWhiteAttack)
            {
                if (scrACp("Scams"))
                {
                    if (other.Tyme > 130 && other.Tyme < 160)
                    {
                        x += ((405 - x) / 6);
                        image_angle += ((90 - image_angle) / 6);
                    }
                    
                    if (other.Tyme == 160)
                    {
                        oPattern.Var1--;
                        oPattern.Var2--;
                        k1 = 1;
                        oPattern.i3 = 1;
                        sou(65);
                    }
                    
                    if (other.Tyme > 160)
                    {
                        x += ((405 - x) / 6);
                        image_angle += ((90 - image_angle) / 6);
                        y += 30;
                    }
                }
            }
        }
    }
}

if (scrACp("BOMB"))
{
    image_xscale += (((2 + (sin(Tyme * 0.25) * 0.5)) - image_xscale) / 12);
    image_yscale += (((2 + (sin(Tyme * 0.25) * 0.5)) - image_yscale) / 12);
    
    if (x > 320)
        image_angle += 5;
    else
        image_angle -= 5;
    
    if (i1 == 1 && y < 180)
    {
        oPattern.k1--;
        oPattern.Var3 += 0.1;
        audio_sound_pitch(snd_HeavyThunder, oPattern.Var3);
        sou(72);
        
        if (oPattern.k1 == 0)
        {
            oSoul.TakeDamage = false;
            
            with (instance_create_depth(x, y, -32000, oEEF))
                Seed = "WhiteFlash";
        }
        
        with (oWhiteAttack)
        {
            if (scrACp("LastP"))
            {
                a1 = 15;
                a2 = 0;
            }
        }
        
        oAlways.ShakePower = 7;
        oAlways.ShakeTyme = 14;
        
        with (instance_create_depth(x, y, -30000, oEEF))
            Seed = "BombCloud";
        
        des(0);
    }
}
