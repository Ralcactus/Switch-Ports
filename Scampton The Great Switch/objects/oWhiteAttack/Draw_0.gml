RGB = make_color_rgb(_R, _G, _B);
BobX = round(BobX);
BobY = round(BobY);

if (rTyme(2, Tyme))
{
    ShowX = round(x);
    ShowY = round(y);
}

if (scrACp("TextPopper") && image_index == 0)
{
    if (Tyme == (206 + i4))
        sou(31);
    
    if (Tyme >= (206 + i4))
    {
        i5 += ((0 - i5) / 5);
        i6 += ((1 - i6) / 5);
        
        if (rTyme(2, Tyme))
        {
            BobX = iRan(-1, 1) * 2;
            BobY = iRan(-1, 1) * 2;
        }
    }
    
    draw_sprite_ext(sprite_index, 4, (ShowX + BobX) - 10, (ShowY + BobY) - 26, 2, 2, image_angle + i5, RGB, i6);
}

if (scrACp("CupATK") && false)
{
    if (i1 == 0)
    {
        if (oPattern.j8 == 1000 && Var1 != 0)
            Var1 -= 0.1;
        
        draw_sprite_ext(sprite_index, 13, 495, oPattern.j2, 2, 2, 0, RGB, Var1);
        draw_sprite_ext(sprite_index, 13, 145, oPattern.j2, 2, 2, 0, RGB, Var1);
        draw_sprite_ext(sprite_index, 12, oPattern.j1, oPattern.j2, 2, 2, 0, RGB, Var1);
    }
}

if (scrACp("CupATK") && k3 != 10)
{
    draw_sprite_ext(sprite_index, 15, x, y, 2, 2, 0, RGB, 0.1);
    draw_sprite_ext(sprite_index, 15, x - 2, y, 2, 2, 0, RGB, 0.1);
    draw_sprite_ext(sprite_index, 15, x + 2, y, 2, 2, 0, RGB, 0.1);
    draw_sprite_ext(sprite_index, 15, x, y - 2, 2, 2, 0, RGB, 0.1);
    draw_sprite_ext(sprite_index, 15, x, y + 2, 2, 2, 0, RGB, 0.1);
}

if (scrACp("Br7"))
{
    draw_sprite_ext(sHand2, 0, (ShowX + BobX) - 12, (ShowY + BobY) - 20, i1, 1, 0, c_white, 1);
    
    if (Tyme > 200 && Tyme <= 240)
        i1 += 0.025;
    
    if (Tyme > 240 && Tyme <= 280)
        i1 -= 0.025;
}

if (!scrACp("UneAN") && !scrACp("DrawLate"))
    draw_sprite_ext(sprite_index, image_index, ShowX + BobX, ShowY + BobY, image_xscale, image_yscale, image_angle, RGB, image_alpha);

if (scrACp("OutLine"))
    DrawOutline(sprite_index, image_index, ShowX, ShowY, image_xscale, image_yscale, image_angle, RGB, image_alpha);

if (scrACp("RailIn"))
{
    if (Tyme == 1)
    {
        depth += 1000;
        mask_index = sNO;
    }
    
    draw_sprite_ext(sWhite2, 0, 320, 0, j1, 240, 0, rgb(0, 0, 5), 0.5);
    j1 += ((112 - j1) / 10);
    
    if (rTyme(2, Tyme))
    {
        if (i1 < 20)
            i1++;
        
        if (i4 == 0 && i1 == 20)
        {
            i4 = 1;
            oAlways.ShakeTyme = 5;
            oAlways.ShakePower = 5;
            sou(96);
        }
        
        i3++;
    }
    
    i2 = 0;
    
    repeat (i1)
    {
        RGB = rgb(51, 51, 56.666666666666664);
        image_speed = sin(Tyme * 0.1) * 1;
        draw_sprite_ext(sRailATK, image_index, 320 + (round((sin((i3 + (i2 * 3)) * 0.25) * 6) / 2) * 1), 24 + (i2 * 24), 1, 1, 0, RGB, 1);
        draw_sprite_ext(sRailATK2, image_index, 245 + (round((cos((i3 + (i2 * 3)) * 0.25) * 6) / 2) * 1), 480 - (i2 * 24), 1, 1, 0, RGB, 1);
        draw_sprite_ext(sRailATK2, image_index, 395 + (round((cos((i3 + (i2 * 3)) * 0.25) * 6) / 2) * 1), 480 - (i2 * 24), 1, 1, 0, RGB, 1);
        i2++;
    }
}

if (scrACp("Anvil"))
{
    draw_sprite_ext(sprite_index, 1, ShowX + BobX + RotMx(i2 + 180, 0), ShowY + BobY + RotMy(i2 + 180, -20), 1, i6, image_angle, RGB, image_alpha);
    draw_sprite_ext(sprite_index, 1, ShowX + BobX + RotMx(i2 + 180, 70), (ShowY + BobY + RotMy(i2 + 180, 50)) - (i5 * 5), 1, -100, image_angle, RGB, image_alpha);
    i5 += WalkY;
    
    if (i3)
        i6 += ((0 - i6) / 6);
}

if (scrACp("AnvilSpamton"))
    draw_sprite_ext(sprite_index, image_index + 2, ShowX + BobX, ShowY + BobY, 2, 2, image_angle, RGB, image_alpha);

if (scrACp("LastP"))
{
    if (Tyme == 0)
    {
        image_xscale = 2;
        i1[0] = 0;
        a2 = 255;
        Var1 = 1;
        Var2 = 0;
        Var3 = 3;
        a5 = 0.06;
    }
    
    image_yscale += ((2 - image_yscale) / 12);
    
    if (Tyme > 25)
        i1[0] += (2 - i1[0]) / 6;
    
    if (Tyme == 3 || Tyme == 27)
        sou(31);
    
    if (oPattern.k1 == 0)
        Var1 += ((0.1 - Var1) / 24);
    
    i1[1] = sin(Tyme * a5 * Var1) * 20 * Var1;
    i1[2] = 270 + RotMx(-110 + i1[1], 145 * i1[0] * 0.5);
    i1[3] = Var2 + 150 + RotMy(-110 + i1[1], 145 * i1[0] * 0.5);
    i1[4] = 370 + RotMx(110 + i1[1], 145 * i1[0] * 0.5);
    i1[5] = Var2 + 150 + RotMy(110 + i1[1], 145 * i1[0] * 0.5);
    i1[6] = sin(Tyme * 0.15 * Var1) * 10;
    i1[7] = cos(Tyme * 0.15 * Var1) * 10;
    
    if (a1 != 0 && rTyme(2, Tyme))
    {
        if (a1 > 0)
            a1--;
        else
            a1++;
        
        if (a1 != 0)
            a1 = -a1;
    }
    
    a2 += ((255 - a2) / 24);
    
    if (a2 < 240 && rTyme(8, Tyme) && oPattern.k1 != 0)
    {
        audio_sound_pitch(snd_scampton_voice, (a2 / 255) + ((oPattern.Var2 - 1) * 2));
        sou(34);
    }
    
    if (oPattern.k1 == 0 && rTyme(8, Tyme) && Var1 > 0.15)
    {
        audio_sound_pitch(snd_scampton_voice, Var1 / 1);
        sou(34);
    }
    
    if (rTyme(20, Tyme))
    {
        if (a4 == 0)
            a4 = 1;
        else
            a4 = 0;
    }
    
    draw_sprite_ext(sScamp_big1, 5 + a4, 320, Var2 + 290, image_xscale, image_yscale + (sin(Tyme * 0.05 * Var1) * 0.1 * Var1), 0, RGB, 1);
    draw_sprite_ext(sScamparm_big1, 0, 270, Var2 + 150, i1[0], 2, -20 + i1[1], RGB, 1);
    draw_sprite_ext(sScamparm_big1, 0, 370, Var2 + 150, -i1[0], 2, 20 + i1[1], RGB, 1);
    draw_sprite_ext(sScamphand_big1, 0, i1[2], i1[3], i1[0], 2, i1[6], RGB, 1);
    draw_sprite_ext(sScamphand_big1, 0, i1[4], i1[5], -i1[0], 2, i1[7], RGB, 1);
    i2 = 0;
    
    repeat (4)
    {
        draw_sprite_ext(sString2, 0, i1[2] + RotMx(15 + i2 + i1[6], 30 * i1[0] * 0.5), i1[3] + RotMy(15 + i2 + i1[6], 30), i1[0], 120, 0, RGB, 1);
        
        if (i2 == 180)
            i2 += 60;
        else
            i2 += 95;
    }
    
    i2 = 0;
    
    repeat (4)
    {
        draw_sprite_ext(sString2, 0, i1[4] + RotMx(-15 + i2 + i1[7], 30 * i1[0] * 0.5), i1[5] + RotMy(-15 + i2 + i1[7], 30), i1[0], 120, 0, RGB, 1);
        
        if (i2 == -180)
            i2 -= 60;
        else
            i2 -= 95;
    }
    
    draw_sprite_ext(sScamp_big1, 1, 320, Var2 + 300, image_xscale, image_yscale + (sin(Tyme * 0.05 * Var1) * 0.1 * Var1), 0, RGB, 1);
    draw_sprite_ext(sScamp_big1, 2, 320, Var2 + 300, image_xscale, image_yscale, cos(Tyme * 0.1 * Var1) * 2 * Var1, RGB, 1);
    
    if (oPattern.k1 != 0)
        Var3 = 3;
    else
        Var3 = 4;
    
    draw_sprite_ext(sScamp_big1, Var3, 320 + a1, Var2 + 300 + (sin(Tyme * 0.1 * Var1) * 3 * Var1), image_xscale, image_yscale, cos(Tyme * 0.1 * Var1) * 2 * Var1, rgb(255, a2, a2), 1);
    
    if (oPattern.k1 != 0)
    {
        draw_sprite_ext(sPlushbod_1, 0, i1[2] - 8, i1[3] + 120 + (sin(Tyme * a5) * 30), i1[0], 2, 0, RGB, 1);
        draw_sprite_ext(sPlushHead_1, 0, i1[2] - 8, i1[3] + 50, i1[0], 2, 0, RGB, 1);
        draw_sprite_ext(sPlushbod_1, 0, i1[4] + 8, (i1[5] + 120) - (sin(Tyme * a5) * 30), -i1[0], 2, 0, RGB, 1);
        draw_sprite_ext(sPlushHead_1, 0, i1[4] + 8, i1[5] + 50, -i1[0], 2, 0, RGB, 1);
    }
    else
    {
        draw_sprite_ext(sPlushHead_1, 1, i1[2] - 8, i1[3] + 50 + (sin(Tyme * a5) * 3), i1[0], 2, 0, RGB, 1);
        draw_sprite_ext(sPlushHead_1, 1, i1[4] + 8, (i1[5] + 50) - (sin(Tyme * a5) * 3), -i1[0], 2, 0, RGB, 1);
    }
    
    if (j1 != 0)
        j1--;
    
    if (oPattern.k1 == 0)
    {
        j1 = 100;
        
        if (rTyme(4, Tyme))
        {
            scrMakeAttack(oWhiteAttack, "RanSpin2", (i1[2] - 8) + iRan(-7, 30), i1[3] + 120, 0, 0, 0, 0.25, 10, 173, 0, 0, 2, 2, 0, 0);
            scrMakeAttack(oWhiteAttack, "RanSpin2", (i1[2] - 8) + iRan(-7, 30), i1[3] + 120, 0, 0, iRan(1, 3), 0.25, 10, 173, 0, 0, 2, 2, 0, 0);
        }
        
        if (rTyme(4, Tyme - 2))
        {
            scrMakeAttack(oWhiteAttack, "RanSpin2", i1[4] + 8 + iRan(-30, 7), i1[5] + 120, 0, 0, 0, 0.25, 10, 173, 0, 0, 2, 2, 0, 0);
            scrMakeAttack(oWhiteAttack, "RanSpin2", i1[4] + 8 + iRan(-30, 7), i1[5] + 120, 0, 0, iRan(1, 3), 0.25, 10, 173, 0, 0, 2, 2, 0, 0);
        }
    }
    
    if ((sin(Tyme * a5) * 30) > 29 && j1 == 0 && Tyme > 50)
    {
        j1 = 20;
        
        with (instance_create_depth(150, 340, -20000, oEEF))
            Seed = "ParrySmoke";
        
        audio_sound_pitch(snd_scampton_voice_2, 1 - (iRan(0, 3) / 10));
        sou(71);
        
        if (oPattern.j3 == 0)
        {
            oPattern.j1 = 1;
            scrMakeAttack(oParryAttack, "Front2@GS 1/2@ParFree@BOMB@BlueThrough@NoDestroy@p17@DPE", 150, 340, 2, 0, -9, 0.25, 50, 112, 0, 0, 0.01, 0.01, 0, 0);
        }
        else
        {
            oPattern.j3--;
            j2 = iRan(0, array_length(oPattern.i1) - 1);
            k1 = oPattern.i1[j2];
            array_delete(oPattern.i1, j2, 1);
            k2 = iRan(0, 3);
            
            while (k2 == k3)
                k2 = iRan(0, 3);
            
            k3 = k2;
            
            if (k1 == 0)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 0, 0);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 20, 20);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, -20, -20);
            }
            
            if (k1 == 1)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 0, 0);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 10, 10);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 20, 20);
            }
            
            if (k1 == 2)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 0, 0);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, -10, -10);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, -20, -20);
            }
            
            if (k1 == 3)
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4@Si5@PIPIPI", 150, 340, 0, 0, 0, 0, 0, 124, 0, 0, 0.01, 0.01, 0, 0);
            
            if (k1 == 4)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 15, 15);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, -15, -15);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 30, 30);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 150, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, -30, -30);
            }
        }
    }
    
    if ((-sin(Tyme * a5) * 30) > 29 && j1 == 0 && Tyme > 50)
    {
        j1 = 20;
        
        with (instance_create_depth(490, 340, -20000, oEEF))
            Seed = "ParrySmoke";
        
        audio_sound_pitch(snd_scampton_voice_2, 1 - (iRan(0, 3) / 10));
        sou(71);
        
        if (oPattern.j3 == 0)
        {
            oPattern.j1 = 1;
            scrMakeAttack(oParryAttack, "Front2@GS 1/2@ParFree@BOMB@BlueThrough@NoDestroy@p17@DPE", 490, 340, -2, 0, -9, 0.25, 50, 112, 0, 0, 0.01, 0.01, 0, 0);
        }
        else
        {
            oPattern.j3--;
            j2 = iRan(0, array_length(oPattern.i1) - 1);
            k1 = oPattern.i1[j2];
            array_delete(oPattern.i1, j2, 1);
            k2 = iRan(0, 3);
            
            while (k2 == k3)
                k2 = iRan(0, 3);
            
            k3 = k2;
            
            if (k1 == 0)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 180, 180);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 200, 200);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 160, 160);
            }
            
            if (k1 == 1)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 180, 180);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 170, 170);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 160, 160);
            }
            
            if (k1 == 2)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 180, 180);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 190, 190);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 200, 200);
            }
            
            if (k1 == 3)
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4@Si5@RevSpin@PIPIPI", 490, 340, 0, 0, 0, 0, 0, 124, 0, 0, 0.01, 0.01, 180, 180);
            
            if (k1 == 4)
            {
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 195, 195);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 165, 165);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 210, 210);
                scrMakeAttack(oWhiteAttack, "Front2@FadeFbox@Walk4", 490, 340, 0, 0, 0, 0, 0, 152, k2, 0, 1, 1, 150, 150);
            }
        }
    }
    
    if (array_length(oPattern.i1) == 0)
    {
        oPattern.i1 = 0;
        oPattern.i1[0] = 0;
        oPattern.i1[1] = 1;
        oPattern.i1[2] = 2;
        oPattern.i1[3] = 3;
        oPattern.i1[4] = 4;
        array_delete(oPattern.i1, k1, 1);
    }
}
