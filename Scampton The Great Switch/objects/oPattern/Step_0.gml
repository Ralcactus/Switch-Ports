Tyme++;

if (Pattern == 1)
{
    i1 += 1;
    i2 += 1;
    
    if (i1 == 1)
    {
        j1 = 0;
        j1[0] = 0;
        j1[1] = 1;
        j1[2] = 2;
        j1[3] = 3;
        
        if (Tyme > 10)
            array_delete(j1, j3, 1);
    }
    
    if (i2 == 50)
    {
        i2 = 0;
        j2 = irandom_range(0, array_length(j1) - 1);
        j3 = j1[j2];
        array_delete(j1, j2, 1);
        
        if (array_length(j1) == 0)
            i1 = 0;
        
        if (oP.Deaths > 0 || oP.NoHit == "Enabled")
            Var1 = "@p8";
        else
            Var1 = "@p4";
        
        if (j3 == 0)
            scrMakeAttack(oParryAttack, "Ghi@GS 1/2" + Var1, BoxX + oneRan(2, 20), BoxY - 150, 0, 0, 0, 0.05, 0, sSymb2, 4 + iRan(0, 3), 0, 1, 1, 270, 0);
        
        if (j3 == 1)
            scrMakeAttack(oParryAttack, "Ghi@GS 1/2" + Var1, BoxX + oneRan(2, 20), BoxY + 150, 0, 0, 0, -0.05, 0, sSymb2, 4 + iRan(0, 3), 0, 1, 1, 90, 0);
        
        if (j3 == 2)
            scrMakeAttack(oParryAttack, "Ghi@GS 1/2" + Var1, BoxX - 150, BoxY + oneRan(2, 20), 0, 0.05, 0, 0, 0, sSymb2, 4 + iRan(0, 3), 0, 1, 1, 0, 0);
        
        if (j3 == 3)
            scrMakeAttack(oParryAttack, "Ghi@GS 1/2" + Var1, BoxX + 150, BoxY + oneRan(2, 20), 0, -0.05, 0, 0, 0, sSymb2, 4 + iRan(0, 3), 0, 1, 1, 180, 0);
    }
    
    if ((Tyme == 750 && oP.Deaths == 0) || (Tyme == 435 && (oP.Deaths > 0 || oP.NoHit == "Enabled")))
        scrEndPattern();
}

if (Pattern == 2)
{
    if (!oMakeUI.Hatk)
    {
        if (Tyme == 1)
        {
            k1[0] = 0;
            k1[1] = 1;
            k1[2] = 2;
            k1[3] = 3;
        }
        
        i1 += 1;
        i2 += 1;
        
        if (i1 == 1)
        {
            j1 = 0;
            j1[0] = 0;
            j1[1] = 0;
            j1[2] = 1;
            j1[3] = 1;
        }
        
        if (i2 == 50)
        {
            if (!oMakeUI.TutorialDone && k2 == 0 && oP.NoHit != "Enabled")
            {
                scrMakeAttack(oWhiteAttack, "PipisGun@NoDamage@TextPopper@Front1", BoxX + 210, 400 + BoxY, 0, 0, 0, 0, 0, sSkog, 0, 0, 2, 2, 0, 0);
            }
            else
            {
                i2 = -10;
                j2 = irandom_range(0, array_length(j1) - 1);
                j3 = j1[j2];
                array_delete(j1, j2, 1);
                
                if (array_length(j1) == 0)
                    i1 = 0;
                
                if (j3 == 0)
                    scrMakeAttack(oWhiteAttack, "PipisGun@NoDamage@Front1", BoxX + (220 + (iRan(0, 4) * 10)), 400 + BoxY + (iRan(-4, 4) * 5), 0, 0, 0, 0, 0, sSkog, 2, 0, 2, 2, 0, 0);
                
                if (j3 == 1)
                    scrMakeAttack(oWhiteAttack, "PipisGun@NoDamage@Front1", BoxX - (220 + (iRan(0, 4) * 10)), 400 + BoxY + (iRan(-4, 4) * 5), 0, 0, 0, 0, 0, sSkog, 2, 0, -2, 2, 0, 0);
            }
            
            k2++;
        }
        
        if (Tyme == 800)
            scrEndPattern();
    }
    else
    {
        if (Tyme == 1)
            scrMakeAttack(oWhiteAttack, "NoDestroy@PopperBig", 665, BoxY + 20, 0, 0, 0, 0, 0, sPopperBig, 0, 0, 1, 1, 0, 270);
        
        if (Tyme == 737)
            scrEndPattern();
    }
}

if (Pattern == 3)
{
    if (ParryEvent == 1)
    {
        ParryEvent = 0;
        k1 *= -1;
        i1[1] *= -1;
        
        if (oMakeUI.Hatk && iRan(0, 1) == 0)
            i1[1] *= -1;
    }
    
    k2 += k1;
    
    if (Tyme == 1)
    {
        i1[0] = 150;
        i1[1] = 2;
        j1 = 0;
        k1 = 1;
        k3 = 4;
        j3 = "#";
        j4 = 3;
        scrMakeAttack(oWhiteAttack, "NoDestroy@CardSpin1@DamageTime2@Ghi@BlueThrough", BoxX, BoxY, 0, 0, 0, 0, 0, sCard, 0, 0, 2, 2, 0, 0);
        scrMakeAttack(oWhiteAttack, "NoDestroy@CardSpin1@DamageTime2@Ghi@BlueThrough", BoxX, BoxY, 0, 0, 0, 0, 0, sCard, 0, 0, 2, 2, 0, 90);
        scrMakeAttack(oWhiteAttack, "NoDestroy@CardSpin1@DamageTime2@Ghi@BlueThrough", BoxX, BoxY, 0, 0, 0, 0, 0, sCard, 0, 0, 2, 2, 0, 180);
        scrMakeAttack(oWhiteAttack, "NoDestroy@CardSpin1@DamageTime2@Ghi@BlueThrough", BoxX, BoxY, 0, 0, 0, 0, 0, sCard, 0, 0, 2, 2, 0, 270);
    }
    
    if (rTyme(5, Tyme))
        L1 += 1;
    
    if (oMakeUI.Hatk)
    {
        if (j4 == 2)
            Var1 += ((1 - Var1) / 3);
        else
            Var1 += ((1.5 - Var1) / 3);
    }
    else
    {
        Var1 = 1;
    }
    
    k4 += (i1[1] * Var1);
    i1[0] = sin(k2 * 0.025) * 150;
    i1[2] = i1[0];
    
    if (i1[2] < 0)
        i1[2] *= -1;
    
    if (j1 == 0 && i1[2] <= 140)
        j1 = 1;
    
    if (j1 == 2)
        j1 = 0;
    
    if (j1 == 1 && i1[2] > 140)
    {
        j1 = 2;
        j3 = j2;
        j2 = iRan(0, 3);
        
        while (j3 == j2)
            j2 = iRan(0, 3);
        
        if (j4 == 0 && oMakeUI.Hatk)
        {
            j4 = 3;
            j2 = j3;
        }
        
        j4 -= 1;
    }
    
    if (Tyme == 750 && !oMakeUI.Hatk)
        scrEndPattern();
    
    if (Tyme == 1000 && oMakeUI.Hatk)
        scrEndPattern();
}

if (Pattern == 4)
{
    j1++;
    
    if (j3 > 0)
        j3--;
    
    if (Tyme == 1)
    {
        i1[0] = 0;
        array_delete(i1, 0, 1);
        j1 = 75;
    }
    
    if (j1 == 100)
    {
        j1 = 15;
        
        if (oMakeUI.Hatk)
            j1 = 25;
        
        j4++;
        
        if (array_length(i1) == 0)
        {
            i1[0] = 0;
            i1[1] = 1;
            
            if (oMakeUI.Hatk)
            {
                i1[2] = 2;
                i1[3] = 3;
            }
            
            if (j4 > 1)
                array_delete(i1, i3, 1);
        }
        
        i2 = iRan(0, array_length(i1) - 1);
        i3 = i1[i2];
        array_delete(i1, i2, 1);
        
        if (iRan(0, 1) == 0)
            j2 = 1;
        else
            j2 = -1;
        
        scrMakeAttack(oWhiteAttack, "DumHeadMake@NoDestroy@NoDamage", -100, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    }
    
    if (Tyme == 760 && !oMakeUI.Hatk)
        scrEndPattern();
    
    if (Tyme == 755 && oMakeUI.Hatk)
        scrEndPattern();
}

if (Pattern == 5)
{
    if (Tyme == 1)
    {
        if (oMakeUI.Hatk)
        {
            i1 = 4;
            j3 += 45;
        }
        else
        {
            i1 = 3;
        }
        
        i2 = 0;
        i3 = iRan(0, i1 - 1);
        j1 = BoxX;
        j2 = BoxY;
        L1 = false;
        j6 = 2;
        
        repeat (i1)
        {
            scrMakeAttack(oWhiteAttack, "NoDestroy@DamageTime2@CupATK@Ghi@Front2", BoxX, BoxY, 0, 0, 0, 0, 0, sCup, 0, 0, 2, 2, 0, 0);
            i2++;
        }
    }
    
    if (Tyme < 25)
    {
        k1 += 4;
        k2 += 4;
    }
    
    if (L1)
    {
        j1 += (j4 * 2);
        
        if (j1 > (175 + BoxX) && j4 == 1)
        {
            j1 = 175 + BoxX;
            j4 = -1;
            j5 = k3;
        }
        
        if (j1 < (-175 + BoxX) && j4 == -1)
        {
            j1 = -175 + BoxX;
            j4 = 1;
            j5 = k3;
        }
        
        if (j5 != 0)
        {
            j7++;
            
            while (j5 == k3)
                k3 = iRan(1, 3);
            
            j6 = iRan(-1, 1) * 2;
            
            while (j6 == 0)
                j6 = iRan(-1, 1) * 2;
            
            j5 = 0;
            
            if (j7 == 5)
            {
                k3 = 1;
                j8 = j1;
            }
        }
        
        j3 += j6;
        
        if (j8 != 0 && j8 != 1000)
        {
            if (j8 < 320 && j1 > 320 && j8 != 1000)
            {
                j1 = BoxX;
                j4 = 0;
                j8 = 1000;
            }
            
            if (j8 > 320 && j1 < 320 && j8 != 1000)
            {
                j1 = BoxX;
                j4 = 0;
                j8 = 1000;
            }
        }
        
        if (k3 == 1)
            CupMove(100, 100);
        
        if (k3 == 2)
            CupMove(50, 100);
        
        if (k3 == 3)
            CupMove(125, 75);
        
        if (j8 == 1000)
        {
            oMakeUI.Box_Xscale += ((20 - oMakeUI.Box_Xscale) / 5);
            oMakeUI.Box_Yscale += ((20 - oMakeUI.Box_Yscale) / 5);
            
            if (j6 > 0)
                j6 -= 0.025;
            
            if (j6 < 0)
                j6 += 0.025;
            
            if (c4 == 0)
            {
                c4 = 1;
                scrMakeAttack(oWhiteAttack, "NoDamage@SpamSee", 520, -76, 0, 0, 3, 0, 0, sSkog, 0, 0, 2, -2, 0, 0);
            }
        }
    }
    
    if (((!oMakeUI.TutorialDone && j7 > 1) || (oMakeUI.TutorialDone && j7 > 0)) && (j8 != 1000 && j7 != 5))
    {
        c2++;
        
        if (c2 == 100)
        {
            c2 = 0;
            
            if (j4 < 0)
                c3 = iRan(0, 3) * 25;
            else
                c3 = iRan(0, 3) * -25;
            
            scrMakeAttack(oWhiteAttack, "HandShow@NoDamage@Front-1", BoxX + c3, BoxY - 30, iRan(-2, 2) / 5, 0, -5, 0.2, 0, sHand, 0, 0, 2, 2, 0, 0);
            
            if (oMakeUI.Hatk)
                a1 = "p3";
            else
                a1 = "p4";
            
            scrMakeAttack(oParryAttack, "LayerFrontDown@GS 1/2@Front-1@DamageTime3@" + a1, BoxX + c3, BoxY - 70, 0, 0, -5, 0.25, 0, sPipis2, 0, 0, 1, 1, 0, 0);
        }
    }
    
    if (ParryEvent == 1)
        c1++;
    
    if (c1 == 1)
    {
        with (oTextEngine)
        {
            if (Spez == "Jöjöjaja")
                des(0);
        }
    }
    
    if (c1 == 30)
    {
        with (oTextEngine)
        {
            if (Spez == "Jöjöjaja")
                des(0);
        }
        
        scrEndPattern();
    }
}

if (Pattern == 6)
{
    if (Tyme == 1)
    {
        if (oMakeUI.Hatk)
            c1 = 2.5;
        else
            c1 = 2.5;
        
        oMakeUI.SMN = false;
        scrMakeAttack(oWhiteAttack, "NoDamage@RailIn@UneAN", BoxX, 240, 0, 0, 0, 0, 0, sRailATK, 0, 0, 2, 2, 0, 0);
    }
    
    if (rTyme(100, Tyme - 50))
    {
        if (iRan(1, 100) == 1)
            Var1 = sRailCart4;
        else
            Var1 = sRailCart;
        
        scrMakeAttack(oWhiteAttack, "CartON@NoDestroy", BoxX - 75, 580, 0, 0, -2.5, 0, 0, Var1, 0, 0, 2, -2, 0, 0);
        
        if (iRan(1, 100) == 1)
            Var1 = sRailCart4;
        else
            Var1 = sRailCart;
        
        scrMakeAttack(oWhiteAttack, "CartON@NoDestroy", BoxX + 75, 580, 0, 0, -2.5, 0, 0, Var1, 0, 0, 2, -2, 0, 0);
        
        if (iRan(1, 100) == 1)
            Var1 = sRailCart4;
        else
            Var1 = sRailCart;
        
        scrMakeAttack(oWhiteAttack, "CartON@NoDestroy", BoxX, -100, 0, 0, c1, 0, 0, Var1, 0, 0, 2, 2, 0, 0);
    }
    
    if (rTyme(100, Tyme))
    {
        while (i1 == i2)
            i1 = iRan(1, 3);
        
        i2 = i1;
        
        if (i1 == 1)
            scrMakeAttack(oParryAttack, "CartPip@GS 1/2@PipBob@p7", BoxX - 75, 580, 0, 0, -2.5, 0, 0, 124, 0, 0, 1.5, 1.5, 0, 0);
        
        if (i1 == 2)
            scrMakeAttack(oParryAttack, "CartPip@GS 1/2@PipBob@p7", BoxX + 75, 580, 0, 0, -2.5, 0, 0, sPipis2, 0, 0, 1.5, 1.5, 0, 0);
        
        if (i1 == 3)
            scrMakeAttack(oParryAttack, "CartPip@GS 1/2@PipBob@p7", BoxX, -100, 0, 0, c1, 0, 0, sPipis2, 0, 0, 1.5, 1.5, 0, 0);
    }
    
    if (rTyme(300, Tyme))
    {
        while (i3 == i4)
            i3 = iRan(-1, 1);
        
        i4 = i3;
        i5++;
        
        if (i3 == 0)
            i5 = 1;
        
        scrMakeAttack(oWhiteAttack, "TrainSpawn", -500, -500, 0, 0, 0, 0, 0, sRailCart, 0, 0, 0, 0, 0, 0);
    }
    
    if (rTyme(300, Tyme + 150) && Tyme >= 150 && Tyme < 1000 && oMakeUI.Hatk)
    {
        while (i6 == i7)
            i6 = iRan(-1, 1);
        
        i7 = i6;
        i8++;
        scrMakeAttack(oWhiteAttack, "TrainSpawn@TrainSps2", -500, -500, 0, 0, 0, 0, 0, sRailCart, 0, 0, 0, 0, 0, 0);
    }
    
    if ((Tyme == 1100 && !oMakeUI.Hatk) || (Tyme == 1050 && oMakeUI.Hatk))
        scrEndPattern();
}

if (Pattern == "B1")
{
    if (Tyme == 1)
    {
        i2 = 12;
        Var1 = 1;
        Var2 = 1;
        scrMakeAttack(oWhiteAttack, "NoDestroy@Scams@Heart1", 480, 630, 0, 0, -15, 0.25, 15, sScams, 0, 0, 2, 2, 0, 0);
    }
    
    if (Tyme == 84)
    {
        sou(laughlouid);
        
        with (instance_create_depth(455, 165, -20000, oEEF))
            Seed = "ParrySmoke";
        
        scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart1@p3", 455, 165, 0, 0, 0, 0, 0, sScams, 5, 0, 2, 2, 0, 0);
    }
    
    if (i3 == 1)
    {
        if (oMakeUI.Spare >= (100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)))
        {
            oAlways.StackNumber = 0;
            scrNumber(455, 165, 276, make_color_rgb(255, 255, 255), "+", 3, 1);
            oMakeUI.Spare += 3;
        }
    }
    
    if (i3 > 0)
    {
        oSoul.INV_SPEZ = 1000;
        i3++;
        
        if (i3 == 50)
        {
            oMakeUI.Pattern = oMakeUI.PastPT;
            scrEndPattern();
        }
    }
}

if (Pattern == "B2")
{
    if (Tyme == 1)
    {
        i2 = 15;
        Var1 = 2;
        Var2 = 2;
        scrMakeAttack(oWhiteAttack, "NoDestroy@Scams", 480, 630, 0, 0, -15, 0.25, 15, sScams, 0, 0, 2, 2, 0, 0);
    }
    
    if (Tyme == 84)
    {
        sou(laughlouid);
        
        with (instance_create_depth(455, 165, -20000, oEEF))
            Seed = "ParrySmoke";
        
        scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart2@p2", 455, 165, 0, 0, 0, 0, 0, sScams, 6, 0, 2, 2, 0, 0);
        scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart1@p2", 455, 165, 0, 0, 0, 0, 0, sScams, 5, 0, 2, 2, 0, 0);
    }
    
    if (i3 == 1)
    {
        if (oMakeUI.Spare >= (100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)))
        {
            oAlways.StackNumber = 0;
            scrNumber(455, 165, 276, make_color_rgb(255, 255, 255), "+", 3, 1);
            oMakeUI.Spare += 3;
        }
    }
    
    if (i3 > 0)
    {
        oSoul.INV_SPEZ = 1000;
        i3++;
        
        if (i3 == 50)
        {
            oMakeUI.Pattern = oMakeUI.PastPT;
            scrEndPattern();
        }
    }
}

if (Pattern == "B3")
{
    if (Tyme == 1)
    {
        i2 = 16;
        Var1 = 4;
        Var2 = 3;
        
        if (oMakeUI.LoopGoop)
        {
            Var1 = 3;
            i2 = 20;
        }
        
        scrMakeAttack(oWhiteAttack, "NoDestroy@Scams", 480, 630, 0, 0, -15, 0.25, 15, sScams, 0, 0, 2, 2, 0, 0);
    }
    
    if (Tyme == 84)
    {
        sou(laughlouid);
        
        with (instance_create_depth(455, 165, -20000, oEEF))
            Seed = "ParrySmoke";
        
        scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart3@p1", 455, 165, 0, 0, 0, 0, 0, sScams, 7, 0, 2, 2, 0, 0);
        scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart2@p1", 455, 165, 0, 0, 0, 0, 0, sScams, 6, 0, 2, 2, 0, 0);
        scrMakeAttack(oParryAttack, "UneAN@DrawLate@CT_PH3@NoDestroy@ParFree@ParEvDes@ScamsHeart1@Front1@WhiteParry@Heart1@p2", 455, 165, 0, 0, 0, 0, 0, sScams, 5, 0, 2, 2, 0, 0);
    }
    
    if (i3 == 1 && !oMakeUI.LoopGoop)
    {
        if (oMakeUI.Spare >= (100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)))
        {
            oAlways.StackNumber = 0;
            scrNumber(355, 185, 276, make_color_rgb(255, 255, 255), "+", 3, 1);
            oMakeUI.Spare += 3;
        }
    }
    
    if (i3 > 0)
    {
        oSoul.INV_SPEZ = 1000;
        i3++;
        
        if (i3 == 50)
        {
            if (!oMakeUI.LoopGoop)
                oMakeUI.Pattern = oMakeUI.PastPT;
            
            scrEndPattern();
        }
    }
}

if (Pattern == "N1")
{
    if (Tyme == 1)
    {
        oMakeUI.SMN = false;
        oMakeUI.AnVil = true;
        scrMakeAttack(oWhiteAttack, "Anvil@NoDestroy", 320, -200, 0, 0, 0, 0, 0, sAnvil, 0, 0, 1, 1, 0, 0);
        scrMakeAttack(oWhiteAttack, "AnvilSpamton@NoDestroy@AlphaZero@DrawLate", 450, 80, 0, 0, 0, 0, 0, sSkog, 6, 0, 2, 2, 0, 0);
    }
    
    if (Tyme == 275)
        scrEndPattern();
}

if (Pattern == "L1")
{
    if (Tyme == 1)
    {
        oMakeUI.SMN = false;
        Var1[0] = -4;
        i1 = 0;
        i1[0] = 0;
        i1[1] = 1;
        i1[2] = 2;
        i1[3] = 3;
        i1[4] = 4;
        j1 = 0;
        j2 = 4;
        j3 = j2;
        k1 = 3;
        Var2 = 0.9;
        Var3 = 0.9;
    }
    
    if (Tyme <= 50)
    {
        if (rTyme(2, Tyme - 1))
            Var1[0]++;
        
        oMakeUI.HUDy += Var1[0];
        oTP.ExtraX -= Var1[0];
    }
    
    if (Tyme == 50)
        scrMakeAttack(oWhiteAttack, "UneAN@NoDestroy@NoDamage@LastP", 0, 0, 0, 0, 0, 0, 0, sNothing, 0, 0, 0.01, 0.01, 0, 0);
    
    if (j1 == 1)
    {
        j1 = 0;
        j2 += 0;
        
        if (j2 >= 6)
            j2 -= 2;
        
        j3 = j2;
    }
    
    if (k1 == 0)
    {
        k2++;
        
        if (k2 == 100)
        {
            sou(laughlouid);
            oAlways.ShakePower = 10;
            oAlways.ShakeTyme = 20;
            sou(snd_explosion);
            
            with (instance_create_depth(x, y, -32000, oEEF))
                Seed = "WhiteFlash2";
        }
        
        if (k2 == 140)
        {
            oSoul.HH = true;
            oMakeUI.LoopGoop = true;
            oMakeUI.BoxEEF = false;
            scrEndPattern();
        }
    }
}
