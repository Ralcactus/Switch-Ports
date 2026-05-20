if (oSoul.Seed == "EndPattern")
    instance_destroy();

if (x < -1680 || x > 2320 || y < -1760 || y > 2240)
    instance_destroy();

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

if (scrACp("FadeFbox"))
{
    if (Tyme == 1)
    {
        if (StartX < 320)
            Var1 = 1;
        
        if (StartX > 320)
            Var1 = 2;
    }
    
    if ((Var1 == 1 && x > 420) || (Var1 == 2 && x < 220))
    {
        image_xscale += ((0 - image_xscale) / 3);
        image_yscale += ((0 - image_yscale) / 3);
        WalkX += ((0 - WalkX) / 3);
        WalkY += ((0 - WalkY) / 3);
    }
    
    if (image_xscale <= 0)
        des(0);
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

if (scrACp("1scale"))
{
    image_xscale += ((1 - image_xscale) / 5);
    image_yscale += ((1 - image_yscale) / 5);
}

if (scrACp("GlideBox"))
{
    StartX += ((oMakeUI.Box_X - StartX) / 30);
    StartY += ((oMakeUI.Box_Y - StartY) / 30);
}

if (scrACp("Move1"))
{
    speed += 0.1;
    
    if (speed > 3)
        speed = 3;
}

if (scrACp("Fall_Intro1"))
{
    Var4 += 1;
    Var2 += 1;
    y += Var1;
    
    if (Var2 <= 25)
        Var1 += 0.5;
    
    if (Var2 > 25 && Var2 <= 67)
        Var1 -= 0.5;
    
    if (Var2 == 67)
    {
        Tyme = 0;
        Var3 = Var2 * 2;
    }
    
    if (Var2 > 67)
    {
        Var1 = 0;
        y = oMakeUI.Box_Y + (sin(Tyme * -0.05) * Var3);
        
        if (Var3 > 13)
            Var3 -= 2.5;
        else
            Var3 = 13;
    }
    
    if (scrACp("Spez1"))
    {
        x -= Var5;
        
        if (x < 120)
            Var5 -= 0.25;
        else
            x = 120;
    }
    
    if (scrACp("Spez2"))
    {
        x += Var5;
        
        if (x > 520)
            Var5 -= 0.25;
        else
            x = 520;
    }
    
    if (Var6 != 0)
        Var6 -= 1;
    
    if (Var6 == 1)
        image_index = 4;
}

if (scrACp("Down200"))
{
    if (Tyme <= 20)
        y += 10;
}

if (scrACp("UpToSxy"))
{
    if (Tyme <= 20)
        y += ((StartY - 550) / 20);
}

if (scrACp("Front1") && Tyme == 1)
    depth -= 1000;

if (scrACp("Front2") && Tyme == 1)
    depth -= 3000;

if (scrACp("InstaDie"))
{
    if (Tyme == 1)
        instance_destroy();
}

if (scrACp("PopScale"))
{
    image_xscale += ((1 - image_xscale) / 10);
    image_yscale = image_xscale;
}

if (scrACp("Var1Gone"))
{
    if (Var1 != 0)
    {
        image_alpha -= 0.1;
        
        if (image_alpha <= 0)
            instance_destroy();
    }
}

scrBothBullet();

if (scrACp("PipisGun"))
{
    if (Tyme == 1)
    {
        j1 = -22;
        
        if (scrACp("TextPopper"))
        {
            i1 = 125;
            i4 = 0;
            i5 = -90;
            i6 = 0;
        }
        else
        {
            i1 = 0;
            i4 = 0;
        }
    }
    
    if (j1 != "#")
    {
        y += j1;
        j1 += 0.5;
    }
    
    if (j1 == 10)
    {
        j1 = "#";
        Tyme = 200;
    }
    
    if (Tyme == 200)
    {
        image_xscale = 2.25 * sign(image_xscale);
        image_yscale = 1;
        
        if (!scrACp("TextPopper"))
            image_index = 3;
    }
    
    if (Tyme == 202)
    {
        image_xscale = 3 * sign(image_xscale);
        image_yscale = 0.5;
    }
    
    if (Tyme == 204)
    {
        image_xscale = 2.25 * sign(image_xscale);
        image_yscale = 1.75;
    }
    
    if (Tyme == 206)
    {
        image_xscale = 2 * sign(image_xscale);
        image_yscale = 2;
        
        if (scrACp("TextPopper"))
        {
            with (instance_create_depth(420, 120, -9999, oTextEngine))
            {
                Seed = "TBub";
                Font = sFont_Sma;
                image_xscale = 1;
                image_yscale = 1;
                RGB = make_color_rgb(0, 0, 0);
                BC = false;
                Text[0] = "[Prepare] FOR MY [patented]@PIPIS POPPER!!";
                Bubble_Xscale[0] = 13;
                Bubble_Yscale[0] = 2;
                Bubble_Arrow[0] = 1;
                Voice = 34;
                Spez = "Jöjöjaja";
                Spez3 = "NUHKEY";
                AllowKeys = false;
            }
        }
    }
    
    if (Tyme == (206 + i1))
    {
        image_index = 2;
        sou(97);
        
        if (scrACp("TextPopper"))
        {
            oPattern.Tyme = 1;
            oPattern.i2 = 49;
            
            with (oTextEngine)
            {
                if (Spez == "Jöjöjaja")
                    des(0);
            }
        }
        
        i2 = 1;
        i3[0] = iRan(-3, -1) * 3;
        
        if (!scrACp("TextPopper"))
        {
            k1 = iRan(0, array_length(oPattern.k1) - 1);
            k3 = oPattern.k1[k1];
            array_delete(oPattern.k1, k1, 1);
            
            if (array_length(oPattern.k1) == 0)
            {
                oPattern.k1 = 0;
                oPattern.k1[0] = 0;
                oPattern.k1[1] = 1;
                oPattern.k1[2] = 2;
                oPattern.k1[3] = 3;
                array_delete(oPattern.k1, k1, 1);
            }
        }
        else
        {
            k3 = 1;
        }
        
        k2 = 0;
        
        if (k3 == 0)
        {
            k2[0] = 1;
            k2[1] = 0;
            k2[2] = 0;
        }
        
        if (k3 == 1)
        {
            k2[0] = 0;
            k2[1] = 1;
            k2[2] = 0;
        }
        
        if (k3 == 2)
        {
            k2[0] = 0;
            k2[1] = 0;
            k2[2] = 1;
        }
        
        if (k3 == 3)
        {
            k2[0] = 1;
            k2[1] = 0;
            k2[2] = 1;
        }
        
        if (k2[0] == 1)
            k2[0] = oParryAttack;
        else
            k2[0] = 38;
        
        if (k2[1] == 1)
            k2[1] = oParryAttack;
        else
            k2[1] = oWhiteAttack;
        
        if (k2[2] == 1)
            k2[2] = oParryAttack;
        else
            k2[2] = oWhiteAttack;
        
        k4[0] = iRan(-2, 2) * 2;
        SedCol[0] = -80 * sign(image_xscale);
        SedCol[1] = -40;
        scrMakeAttack(k2[0], "Si10@Walk4@GS 1/2@FolSoul@Front2@p4", x + SedCol[0], y + SedCol[1], 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, (point_direction(x + SedCol[0], y + SedCol[1], oBox.x, oBox.y) - 15) + k4[0]);
        scrMakeAttack(k2[1], "Si10@Walk4@GS 1/2@FolSoul@Front2@p4", x + SedCol[0], y + SedCol[1], 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, point_direction(x + SedCol[0], y + SedCol[1], oBox.x, oBox.y) + k4[0]);
        scrMakeAttack(k2[2], "Si10@Walk4@GS 1/2@FolSoul@Front2@p4", x + SedCol[0], y + SedCol[1], 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, point_direction(x + SedCol[0], y + SedCol[1], oBox.x, oBox.y) + 15 + k4[0]);
    }
    
    if (i2 == 1)
    {
        if (x > 320)
        {
            x += 10;
            RanSpin = -12;
        }
        else
        {
            x -= 10;
            RanSpin = 12;
        }
        
        y += i3[0];
    }
}

if (scrACp("PopperBig"))
{
    i2++;
    
    if (Tyme == 1)
    {
        j1 = 0;
        j1[0] = 0;
        k2 = 190;
        i2 += 50;
        j3[0] = 1;
        j3[1] = 1;
    }
    
    if (array_length(j1) < 5)
    {
        j1 = 0;
        j1[0] = -2;
        j1[1] = -1;
        j1[2] = 0;
        j1[3] = 1;
        j1[4] = 2;
        j1[5] = 3;
        j1[6] = 4;
        j1[7] = 6;
        j1[8] = 7;
        j1[9] = 8;
        j1[10] = 9;
        j1[11] = 10;
    }
    
    if (i3 != 0)
    {
        if (rTyme(27, i3 + 10))
        {
            j2 = iRan(0, array_length(j1) - 1);
            k2 = j1[j2] + 180;
            array_delete(j1, j2, 1);
        }
    }
    
    if (rTyme(2, Tyme))
    {
        k1 += ((k2 - k1) / 3);
        image_xscale = j3[0];
        image_yscale = j3[1];
        j3[0] += (1 - j3[0]) / 6;
        j3[1] += (1 - j3[1]) / 6;
        i9 = sin(Tyme * 0.05) * 2;
    }
    
    image_angle = k1 + i9;
    
    if (rTyme(100, i2))
    {
        i3 = 1;
        k2 = k1;
        i4 = 0;
        
        if (i5 == 3)
        {
            i5 = 2;
        }
        else
        {
            while (i5 == i6)
                i5 = iRan(1, 3);
        }
        
        i6 = i5;
        
        while (i7 == i8)
            i7 = iRan(3, 4);
        
        i8 = i7;
    }
    
    if (i3 != 0)
    {
        i3++;
        
        if (rTyme(27, i3))
        {
            j3[0] = 0.8;
            j3[1] = 1.25;
            i4++;
            oAlways.ShakePower = 2;
            oAlways.ShakeTyme = 2;
            
            if (oMakeUI.Hatk && i4 == i5)
            {
                sou(78);
                
                if (i7 == 1)
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                
                if (i7 == 2)
                {
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@t15@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@t-15@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                }
                
                if (i7 == 3)
                {
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@t20@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@t-20@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                }
                
                if (i7 == 4)
                {
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@t6@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                    scrMakeAttack(oWhiteAttack, "moveRot1@Walk4@Si10@t-6@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
                }
            }
            else if (oMakeUI.Hatk)
            {
                sou(97);
                scrMakeAttack(oParryAttack, "moveRot1@Walk4@Si10@GS 1/2@p4@PipiEdge@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
            }
            else
            {
                scrMakeAttack(oParryAttack, "moveRot1@Walk4@Si10@GS 1/2@p3@PipiEdge@Front1@SmoB", x, y - 60, 0, 0, 0, 0, 0, 124, 0, 0, 0, 0, 0, k2);
            }
        }
        
        if (i3 == round(81))
            i3 = 0;
    }
}

if (scrACp("CartON"))
{
    if (Tyme == 1)
        Var6 = WalkX;
    
    BobY = sin(Tyme * 0.1) * 3;
    
    if (Tyme >= (700 / abs(Var6)))
        des(0);
}

if (scrACp("TrainSpawn"))
{
    if (iRan(1, 100) == 1)
        sou(17);
    else
        sou(6);
    
    if (scrACp("TrainSps2"))
    {
        if (rTyme(2, oPattern.i8))
            i1 = 1;
        else
            i1 = -1;
        
        scrMakeAttack(oWhiteAttack, "TrainFront@NoDestroy@Train2Smoke", 320 + (i1 * 1000), oPattern.BoxY + (oPattern.i6 * 75), -i1 * 10, 0, 0, 0, 0, 204, 0, 0, -2 * i1, 2, 0, 0);
        scrMakeAttack(oWhiteAttack, "NoDamage@FadeTrain@AlphaZero@Front1", 320 + (i1 * 1000), oPattern.BoxY + (oPattern.i6 * 75), -i1 * 10, 0, 0, 0, 0, 174, 0, 0, 2, -5 * i1, 90, 0);
    }
    else
    {
        if (rTyme(2, oPattern.i5))
            i1 = 1;
        else
            i1 = -1;
        
        scrMakeAttack(oWhiteAttack, "TrainFront@NoDestroy", oPattern.BoxX + (oPattern.i3 * 75), 240 + (i1 * 1000), 0, 0, -i1 * 10, 0, 0, 212, 0, 0, 2, -2 * i1, 0, 0);
        scrMakeAttack(oWhiteAttack, "NoDamage@FadeTrain@AlphaZero@Front1", oPattern.BoxX + (oPattern.i3 * 75), 240 + (i1 * 956), 0, 0, -i1 * 10, 0, 0, 174, 0, 0, 2, -6 * i1, 0, 0);
        scrMakeAttack(oWhiteAttack, "NoDestroy", oPattern.BoxX + (oPattern.i3 * 75), 240 + (i1 * 1100), 0, 0, -i1 * 10, 0, 0, 260, 0, 0, 2, -2 * i1, 0, 0);
        scrMakeAttack(oWhiteAttack, "NoDamage", oPattern.BoxX + (oPattern.i3 * 75), 240 + (i1 * 1175), 0, 0, -i1 * 10, 0, 0, 260, 0, 0, 2, -2 * i1, 0, 0);
    }
    
    des(0);
}

if (scrACp("FadeTrain"))
    image_alpha += 0.0075;

if (scrACp("TrainFront") && rTyme(5, Tyme))
{
    if (scrACp("Train2Smoke"))
        scrMakeAttack(oWhiteAttack, "NoDamage@TrainSmoke@UneAN@OutLine@Front1@Train2Smoke", x, y - 10, iRan(-2, 2) / 5, 0, 0, 0, 0, 127, 0, 0, 2, 2, 0, 0);
    else
        scrMakeAttack(oWhiteAttack, "NoDamage@TrainSmoke@UneAN@OutLine@Front1", x, y, iRan(-2, 2) / 5, 0, 0, 0, 0, 127, 0, 0, 2, 2, 0, 0);
}

if (scrACp("TrainSmoke"))
{
    if (Tyme == 1)
        i2 = 1;
    
    i1 += (0.3 / (Tyme / 10));
    
    if (rTyme(16, Tyme))
    {
        if (i2 == 0)
            i2 = 1.5;
        else
            i2 = 1;
    }
    
    image_xscale = i1 * i2;
    image_yscale = i1 * i2;
    image_alpha -= 0.02;
    
    if (StartX == oPattern.BoxX && !scrACp("Train2Smoke"))
        image_alpha -= 0.02;
    
    if (image_alpha <= 0)
        des(0);
    
    if (scrACp("Train2Smoke"))
    {
        if (Tyme == 1)
        {
            Var1 = -10;
            WalkY = iRan(-2, 2) / 5;
        }
        
        y += Var1;
        
        if (rTyme(2, Tyme) && Var1 != 0)
            Var1 += ((0 - Var1) / 6);
    }
}

if (scrACp("XSsez"))
{
    if (Tyme == 1)
        i1 = iRan(4, 16);
    
    if (rTyme(i1, Tyme))
        image_angle += 90;
}

if (scrACp("DumHeadMake"))
{
    if (Tyme == 1)
    {
        i2 = 0;
        
        if (oPattern.i3 == 0)
        {
            i1 = 2 * oPattern.j2;
            k1[0] = 0;
            k1[1] = 0;
            k1[2] = 0;
            k1[3] = 0;
            k1[4] = 0;
            k1[5] = 0;
        }
        
        if (oPattern.i3 == 1)
        {
            i1 = 2 * oPattern.j2;
            k1[0] = 0;
            k1[1] = 0;
            k1[2] = 0;
            k1[3] = 0;
            k1[4] = 0;
            k1[5] = 0;
        }
        
        if (oPattern.i3 == 2)
        {
            i1 = 2 * oPattern.j2;
            k1[0] = 0;
            k1[1] = 0;
            k1[2] = 0;
            k1[3] = 0;
            k1[4] = 0;
        }
        
        if (oPattern.i3 == 3)
        {
            i1 = 2 * oPattern.j2;
            k1[0] = 0;
            k1[1] = 0;
            k1[2] = 0;
            k1[3] = 0;
            k1[4] = 0;
        }
        
        if (!oMakeUI.Hatk)
            k1[iRan(0, array_length(k1) - 1)] = 1;
        else
            k1[iRan(1, array_length(k1) - 2)] = 1;
        
        k2 = iRan(0, array_length(k1) - 1);
        
        while (k1[k2] == 1)
            k2 = iRan(0, array_length(k1) - 1);
        
        if ((k2 - 1) == -1)
        {
            if (k1[1] == 1)
                k2 += 3;
        }
        else if (k2 != (array_length(k1) - 1))
        {
            if (k1[k2 + 1] == 1)
                k2--;
        }
        
        if ((k2 + 1) == array_length(k1))
        {
            if (k1[array_length(k1) - 2] == 1)
                k2 -= 3;
        }
        else if (k2 != 0)
        {
            if (k1[k2 - 1] == 1)
                k2++;
        }
        
        k1[k2] = 2;
        k4 = array_length(k1);
    }
    
    if (Tyme == 60 || (oMakeUI.Hatk && Tyme == 55))
    {
        oPattern.j3 = 5;
        sou(12);
        des(0);
    }
    
    if (rTyme(5, Tyme) && i2 < k4)
    {
        if (i2 == 0 && false)
        {
            a1 = 0;
            
            if (oPattern.i3 == 0)
            {
                a1[0] = 0;
                a1[1] = 1;
                a1[2] = 2;
                a1[3] = 3;
                a1[4] = 4;
                a1[5] = 5;
                
                repeat (6)
                {
                    a2 = irandom_range(0, array_length(a1) - 1);
                    a3 = a1[a2];
                    array_delete(a1, a2, 1);
                    scrMakeAttack(oWhiteAttack, "DumHead@DamageTime3@DPE2", oPattern.BoxX + (a3 * 40), oPattern.BoxY - 96, 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 180, 0);
                }
            }
        }
        
        if (i2 == 0)
        {
            if (oPattern.i3 == 0 || oPattern.i3 == 1)
                a1 = irandom_range(1, 4);
            
            if (oPattern.i3 == 2 || oPattern.i3 == 3)
                a1 = irandom_range(1, 3);
        }
        
        if (k1[i2] == 1)
            k3 = oParryAttack;
        else
            k3 = oWhiteAttack;
        
        if (k1[i2] != 2 || (rTyme(2, oPattern.j4) && oMakeUI.Hatk && false))
        {
            if (oPattern.i3 == 0)
            {
                scrMakeAttack(k3, "DumHead@DamageTime4@GS 1/2@p6@DPE2", oPattern.BoxX + (oPattern.j2 * 20) + (i1 * 40), oPattern.BoxY + 96, 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 0, 0);
                
                if (a1 == i2)
                    scrMakeAttack(oWhiteAttack, "DumHead@DamageTime4@DPE2", oPattern.BoxX + (oPattern.j2 * 20) + (i1 * 40), oPattern.BoxY - 96, 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 180, 0);
            }
            
            if (oPattern.i3 == 1)
            {
                scrMakeAttack(k3, "DumHead@DamageTime4@GS 1/2@p6@DPE2", oPattern.BoxX + (oPattern.j2 * 20) + (i1 * 40), oPattern.BoxY - 96, 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 180, 0);
                
                if (a1 == i2)
                    scrMakeAttack(oWhiteAttack, "DumHead@DamageTime4@DPE2", oPattern.BoxX + (oPattern.j2 * 20) + (i1 * 40), oPattern.BoxY + 96, 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 0, 0);
            }
            
            if (oPattern.i3 == 2)
            {
                scrMakeAttack(k3, "DumHead@DamageTime4@GS 1/2@p6@DPE2", oPattern.BoxX + 114, oPattern.BoxY + (i1 * 40), 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 90, 0);
                
                if (a1 == i2)
                    scrMakeAttack(oWhiteAttack, "DumHead@DamageTime4@DPE2", oPattern.BoxX - 114, oPattern.BoxY + (i1 * 40), 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, -90, 0);
            }
            
            if (oPattern.i3 == 3)
            {
                scrMakeAttack(k3, "DumHead@DamageTime4@GS 1/2@p6@DPE2", oPattern.BoxX - 114, oPattern.BoxY + (i1 * 40), 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, -90, 0);
                
                if (a1 == i2)
                    scrMakeAttack(oWhiteAttack, "DumHead@DamageTime4@DPE2", oPattern.BoxX + 114, oPattern.BoxY + (i1 * 40), 0, 0, 0, 0, 0, 146, iRan(1, 2), 0, 3, 0.01, 90, 0);
            }
        }
        
        i1 -= oPattern.j2;
        i2++;
    }
}

if (scrACp("CupATK"))
{
    if (Tyme == 1)
    {
        k1 = 40;
        Var1 = 1;
    }
    
    if (k3 != 10)
    {
        x = oPattern.j1;
        y = oPattern.j2;
        RotSka(oPattern.j3 + ((360 / oPattern.i1) * i1), oPattern.k1, oPattern.k2);
    }
    
    if (Tyme == k1)
    {
        image_index = 0;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 4))
    {
        image_index = 1;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 8))
    {
        image_index = 2;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 12))
    {
        image_index = 3;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 16))
    {
        image_index = 4;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (oPattern.i3 == i1)
    {
        if (Tyme == (k1 + 32))
            k2 = 1;
        
        if (Tyme == (k1 + 36))
            k2 = 2;
        
        if (Tyme == (k1 + 40))
            k2 = 3;
        
        if (Tyme == (k1 + 52))
            k2 = 1;
        
        if (Tyme == (k1 + 56))
            k2 = 2;
        
        if (Tyme == (k1 + 60))
            k2 = 3;
        
        if (Tyme == (k1 + 72))
            k2 = 1;
        
        if (Tyme == (k1 + 76))
            k2 = 2;
        
        if (Tyme == (k1 + 80))
            k2 = 3;
        
        if (Tyme == (k1 + 100))
            k2 = 0;
    }
    
    if (Tyme == (k1 + 100))
    {
        image_index = 3;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 104))
    {
        image_index = 2;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 108))
    {
        image_index = 1;
        
        if (oPattern.i3 == i1)
            image_index += 5;
    }
    
    if (Tyme == (k1 + 112))
    {
        image_index = 0;
        
        if (oPattern.i3 == i1)
        {
            image_index += 5;
            oPattern.L1 = true;
            oPattern.j4 = 1;
            oPattern.k3 = 1;
        }
    }
    
    if (place_meeting(x, y, oSoul))
        k4++;
    else
        k4 = 0;
    
    if (oPattern.j8 == 1000 && k3 != 10 && oPattern.ParryEvent == 0)
    {
        if (k3 == 0)
            ID[array_length(ID)] = "NoDamage";
        
        k3 = 1;
        
        if (k4 == 1)
        {
            sou(96);
            oAlways.ShakePower = 4;
            oAlways.ShakeTyme = 4;
            k3 = 10;
            
            if (oSoul.x < x)
            {
                WalkX = 4;
                k5 = iRan(-2, -1) * 5;
            }
            else
            {
                WalkX = -4;
                k5 = iRan(1, 2) * 5;
            }
            
            WalkY = iRan(-7, -2);
            eY = 0.5;
            
            if (oPattern.i3 == i1)
            {
                scrMakeAttack(oParryAttack, "p30@GS 1/2@NoDamage@ParEvDes", x, y, 0, 0, 0, 0, 0, 124, 0, 0, 1, 1, 0, 0);
            }
            else
            {
                sou(48);
                oPattern.ParryEvent = 1;
            }
        }
    }
    
    image_angle += k5;
}

if (scrACp("HandShow"))
{
    if (Tyme == 1)
        i1 = iRan(-10, 10) / 20;
    
    image_angle += i1;
    
    if (Tyme == 60)
        des(0);
    
    if (x > 400)
        x = 400;
    
    if (x < 240)
        x = 240;
}

if (scrACp("SpamSee"))
{
    if (Tyme == 20)
    {
        WalkY = 0;
        StartX = x;
        StartY = y;
        
        with (instance_create_depth(460, 28, -9999, oTextEngine))
        {
            Seed = "TBub";
            Font = sFont_Sma;
            image_xscale = 1;
            image_yscale = 1;
            RGB = make_color_rgb(0, 0, 0);
            BC = false;
            Text[0] = "FIND THE PIPIS!";
            Bubble_Xscale[0] = 7.5;
            Bubble_Yscale[0] = 1;
            Bubble_Arrow[0] = 1;
            Voice = 34;
            Spez = "Jöjöjaja";
            AllowKeys = false;
            Spez3 = "NUHKEY";
        }
    }
    
    if (Tyme > 20 && rTyme(2, Tyme) && oPattern.ParryEvent == 0)
    {
        x = StartX + (iRan(-1, 1) * 2);
        y = StartY + (iRan(-1, 1) * 2);
    }
    
    if (oPattern.ParryEvent == 1)
    {
        eY = 20;
        SpeedCap = 20;
        image_angle += WalkY;
    }
}

if (scrACp("Scams"))
{
    if (RanSpin == -15)
    {
        k6++;
        
        if (k6 == 100)
        {
            RanSpin = 0;
            
            if (j1 != 0)
                image_angle = 0;
            
            k2 = 0;
        }
    }
    else
    {
        k6 = 0;
    }
    
    if (Tyme == 76)
    {
        WalkY = 0;
        eY = 0;
    }
    
    if (Tyme == 76)
    {
        image_xscale = 2.25;
        image_yscale = 1;
        image_index = 1;
    }
    
    if (Tyme == 78)
    {
        image_xscale = 3;
        image_yscale = 0.5;
    }
    
    if (Tyme == 80)
    {
        image_xscale = 2.25;
        image_yscale = 1.75;
        image_index = 2;
    }
    
    if (Tyme == 82)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
    
    if (Tyme == 84)
    {
        image_index = 3;
        y -= 32;
    }
    
    if (Tyme == 88)
    {
        image_index = 4;
        StartX = x;
        StartY = y;
    }
    
    if (Tyme >= 88 && rTyme(8, Tyme) && k5 == 0)
    {
        image_index++;
        
        if (image_index == 5)
            image_index = 3;
    }
    
    if (Tyme >= 88)
    {
        if (k1 == 1)
        {
            if (oPattern.Var1 <= 0)
            {
                if (Var3 == 0)
                {
                    Var3 = 1;
                    sou(34);
                    a1 = 1;
                }
                
                Var4++;
                
                if (rTyme(4, Var4))
                {
                    Var3++;
                    
                    if (Var3 <= 10 && (oPattern.Pattern != "B3" || oMakeUI.LoopGoop))
                    {
                        audio_sound_pitch(snd_scampton_voice, a1);
                        a1 -= 0.075;
                        sou(34);
                    }
                    
                    scrMakeAttack(oWhiteAttack, "NoDamage@TrainSmoke@UneAN@OutLine", x, y, 0, 0, 0, 0, 0, 127, 0, 0, 2, 2, 0, 0);
                }
                
                if (oPattern.Pattern != "B3" || oMakeUI.LoopGoop)
                {
                    x += 8;
                    y -= 3;
                }
            }
            else
            {
                k2++;
                
                if (k2 == 1)
                {
                    k3 = 0;
                    k4 = 10;
                }
                
                if (k2 == 30)
                    k1 = 0;
            }
            
            RanSpin = -15;
        }
        else
        {
            RanSpin = 0;
            
            if (j1 != 0)
                image_angle = 0;
            
            k2 = 0;
        }
        
        k3 += k4;
        
        if (rTyme(2, Tyme))
            k4 -= 1;
        
        if (k3 < 0)
        {
            k3 = 0;
            k4 = 0;
        }
        
        if (oPattern.Var1 > 0)
        {
            if (k5 == 0 && !(k5 != 0 && j1 == 0))
            {
                x = StartX + ((k3 + (sin(Tyme * 0.1) * 20)) * j1);
                y = StartY + (sin(Tyme * 0.05) * 10 * j1);
            }
            
            if (k5 == 0)
            {
                if (j1 != 1)
                    j1 += 0.1;
            }
            else if (j1 != 0)
            {
                j1 -= 0.1;
            }
        }
        
        if (k1 == 0 && k2 == 0 && oMakeUI.Pattern == "B3" && oPattern.Var1 == 1 && k3 == 0 && k5 == 0 && !oMakeUI.LoopGoop)
        {
            k5 = 1;
            sou(31);
            
            with (instance_create_depth(455, 165, -20000, oEEF))
                Seed = "ParrySmoke";
            
            scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart4@NoGlow", 455, 165, 0, 0, 0, 0, 0, 265, 8, 0, 2, 2, 0, 0);
        }
    }
    
    oPattern.i1[0] = x + RotMx(image_angle + 230, 12);
    oPattern.i1[1] = y + RotMy(image_angle + 230, 8);
    
    if (x > 640 && oPattern.i3 == 0)
        oPattern.i3 = 1;
    
    if (k5 == 0 && rTyme(96, Tyme) && Tyme >= 275 && k1 == 0)
    {
        if (oPattern.Var2 == 1)
        {
            sou(34);
            j2 = point_direction(x - 10, y, oSoul.x, oSoul.y);
            scrMakeAttack(oWhiteAttack, "3speed@Front3@DrawLate", x - 10, y, 0, 0, 0, 0, 0, 152, iRan(0, 3), 0, 1, 1, j2, j2);
            scrMakeAttack(oWhiteAttack, "3speed@Front3@DrawLate", x - 10, y, 0, 0, 0, 0, 0, 152, iRan(0, 3), 0, 1, 1, j2 - 15, j2 - 15);
            scrMakeAttack(oWhiteAttack, "3speed@Front3@DrawLate", x - 10, y, 0, 0, 0, 0, 0, 152, iRan(0, 3), 0, 1, 1, j2 + 15, j2 + 15);
        }
        
        if (oPattern.Var2 == 2)
        {
            sou(34);
            j2 = point_direction(x - 10, y, oSoul.x, oSoul.y);
            scrMakeAttack(oWhiteAttack, "3speed@Front3@DrawLate", x - 10, y, 0, 0, 0, 0, 0, 152, iRan(0, 3), 0, 1, 1, j2, j2);
        }
    }
}

if (scrACp("FilGag1"))
{
    if (y > 325)
    {
        y = 325;
        WalkY = 0;
        eY = 0;
    }
}

if (scrACp("FilGag2"))
{
    if (y > 320)
    {
        y = 320;
        WalkY = 0;
        eY = 0;
        WalkX = 0;
    }
}

if (scrACp("FilGag3"))
{
    if (Tyme >= 255 && k1 == 1)
    {
        if (Tyme == 255)
        {
            with (oWhiteAttack)
            {
                if (scrACp("Br1"))
                    image_index = 1;
            }
            
            image_angle = 104;
            y += 8;
            
            with (oWhiteAttack)
            {
                if (scrACp("Br4"))
                {
                    SpeedCap = 100;
                    WalkX = 11.5;
                    WalkY = -14;
                    eY = 1;
                }
            }
        }
        
        if (Tyme == 281)
        {
            with (oWhiteAttack)
            {
                if (scrACp("Br3"))
                    image_index = 0;
            }
            
            with (oWhiteAttack)
            {
                if (scrACp("Br6"))
                {
                    SpeedCap = 100;
                    WalkX = -14.5;
                    WalkY = -14.5;
                    eY = 1;
                }
            }
        }
        
        if (Tyme == 315)
        {
            with (oWhiteAttack)
            {
                if (scrACp("Br2"))
                    image_index = 1;
            }
            
            with (oWhiteAttack)
            {
                if (scrACp("Br5"))
                {
                    SpeedCap = 100;
                    WalkX = 13;
                    WalkY = -19;
                    eY = 1;
                }
            }
        }
        
        if (Tyme == 340)
        {
            with (oWhiteAttack)
            {
                if (scrACp("Br5"))
                {
                    WalkX = -2;
                    WalkY = -5;
                }
            }
            
            with (oWhiteAttack)
            {
                if (scrACp("Br7"))
                {
                    SpeedCap = 100;
                    WalkY = -10;
                    eY = 1;
                    RanSpin = 10;
                }
            }
        }
    }
    else
    {
        if (y > 145 && k1 == 0)
        {
            if (i1 != 5)
            {
                WalkY *= -0.5;
                i1++;
                y = 145;
            }
            else
            {
                y = 145;
                WalkY = 0;
                eY = 0;
            }
        }
        
        if (Tyme >= 200)
        {
            if (image_angle < 50)
            {
                image_angle += 2;
                y -= 0.1;
            }
            else if (image_index == 4 && k1 == 0)
            {
                k1 = 1;
                i3 = 3.5;
            }
            
            if (k1 == 1)
            {
                if (image_angle != 100)
                    image_angle += 2;
                
                x -= i3;
                y += i2;
                
                if (rTyme(3, Tyme))
                    i2++;
                
                if (i3 != 0)
                    i3 -= 0.1;
            }
        }
    }
}

if (scrACp("Br7"))
{
    if (Tyme == 58)
    {
        WalkY = 0;
        eY = 0;
        image_xscale = 2.25;
        image_yscale = 1;
    }
    
    if (Tyme == 60)
    {
        image_xscale = 3;
        image_yscale = 0.5;
    }
    
    if (Tyme == 62)
    {
        image_xscale = 2.25;
        image_yscale = 1.75;
    }
    
    if (Tyme == 64)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
}

if (scrACp("Anvil"))
{
    if (Tyme == 1)
    {
        i3 = false;
        i6 = -70;
        i7 = irandom_range(150, 200);
        oPattern.i1 = i7;
    }
    
    if (!i3)
    {
        i1 += ((325 - i1) / 12);
        x = 320 + (cos(Tyme * 0.05) * 20);
        y = -220;
        i2 = sin(Tyme * 0.05) * 2;
        RotSka(i2, i1, i1);
        image_angle = i2;
    }
    
    if (Tyme == i7)
    {
        i3 = true;
        i4 = 0;
    }
    
    if (i3)
    {
        eY = 1;
        SpeedCap = 100;
        image_angle += ((0 - image_angle) / 12);
        i4++;
        
        if (i4 == 16)
        {
            oAlways.ShakePower = 50;
            oAlways.ShakeTyme = 50;
            sou(30);
        }
        
        if (i4 >= 16)
        {
            eY = 0;
            WalkY = 0;
            
            if (oAlways.ShakePower != 0)
                oAlways.ShakePower -= 1;
        }
    }
}

if (scrACp("AnvilSpamton"))
{
    if (Tyme == 1)
    {
        a1 = 0.5;
        
        repeat (50)
        {
            x += 10;
            image_angle -= 20;
        }
    }
    
    if (Tyme == 2)
        image_alpha = 1;
    
    if (Tyme <= 50)
    {
        if (rTyme(8, Tyme))
        {
            a1 += 0.08;
            audio_sound_pitch(snd_scampton_voice, a1);
            sou(34);
        }
        
        x -= 10;
        image_angle += 20;
    }
    
    if (Tyme == (oPattern.i1 - 50) && Tyme > 50)
        i1 = 1;
    
    if (Tyme == (oPattern.i1 - 25) && Tyme > 50)
    {
        i1 = 2;
        sou(26);
    }
    
    if (i1 == 1)
    {
        image_index = 7;
        x += ((465 - x) / 6);
    }
    
    if (i1 == 2)
        x += (((375 + (cos(Tyme * 0.05) * 20)) - x) / 3);
    
    if (Tyme == (oPattern.i1 - 3))
    {
        image_index = 6;
        
        with (instance_create_depth(x, y, -9999, oEEF))
        {
            sprite_index = sSkog;
            image_index = 10;
            Seed = "ScisEEF";
        }
    }
}

if (scrACp("PIPIPI"))
{
    if (Tyme < 30)
    {
        image_xscale += ((2 - image_xscale) / 12);
        image_yscale += ((2 - image_yscale) / 12);
    }
    
    if (Tyme == 30)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
}
