Tyme++;

if (Tyme == 1)
{
    D1 = iRan(0, 23);
    D2 = iRan(0, 23);
    D1_der = 1;
    
    if (iRan(0, 1) == 0)
        D1_der = -1;
    
    D2_der = 1;
    
    if (iRan(0, 1) == 0)
        D2_der = -1;
    
    D1_spd = iRan(4, 5);
    D2_spd = iRan(4, 5);
}

if (Tyme == 3)
{
    oAlways.ShakePower = 5;
    oAlways.ShakeTyme = 5;
    sou(96);
}

if (Turn < 3)
    oTP.ExtraX += ((-200 - oTP.ExtraX) / 6);
else
    oTP.ExtraX += ((0 - oTP.ExtraX) / 3);

with (oTextEngine)
{
    if (Spez == "Dice2text")
        des(0);
}

with (instance_create_depth(450 + (sin(oP.Tyme * 0.05) * 2), (eY + 240) - 208, -1000, oTextEngine))
{
    Text[0] = "2 =";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 10) * 0.05) * 2), (eY + 240) - 182, -1000, oTextEngine))
{
    Text[0] = "3 =";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 20) * 0.05) * 2), (eY + 240) - 156, -1000, oTextEngine))
{
    Text[0] = "4 =";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 30) * 0.05) * 2), (eY + 240) - 130, -1000, oTextEngine))
{
    Text[0] = "5 =";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 40) * 0.05) * 2), (eY + 240) - 104, -1000, oTextEngine))
{
    Text[0] = "6 = Nothing";
    StringAT = 15;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 50) * 0.05) * 2), (eY + 240) - 78, -1000, oTextEngine))
{
    Text[0] = "7 =";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 60) * 0.05) * 2), (eY + 240) - 52, -1000, oTextEngine))
{
    Text[0] = "8 = Nothing";
    StringAT = 15;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(450 + (sin((oP.Tyme + 70) * 0.05) * 2), (eY + 240) - 26, -1000, oTextEngine))
{
    Text[0] = "9 =";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(444 + (sin((oP.Tyme + 80) * 0.05) * 2), eY + 240, -1000, oTextEngine))
{
    Text[0] = "10=";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(444 + (sin((oP.Tyme + 90) * 0.05) * 2), eY + 240 + 26, -1000, oTextEngine))
{
    Text[0] = "11=";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

with (instance_create_depth(444 + (sin((oP.Tyme + 100) * 0.05) * 2), eY + 240 + 52, -1000, oTextEngine))
{
    Text[0] = "12=";
    StringAT = 9;
    BC = false;
    Spez = "Dice2text";
    Mono = true;
}

draw_sprite_ext(sWhite2, 0, 118, eY + 20, 90, 200, 0, rgb(0, 0, 25), 0.5);
draw_sprite_ext(sWhite2, 0, 522, eY + 20, 90, 200, 0, rgb(0, 0, 25), 0.5);

if (rTyme(D1_spd, oP.Tyme) && Turn < 2)
{
    D1 += D1_der;
    
    if (D1 < 0)
        D1 = 23;
    
    if (D1 > 23)
        D1 = 0;
}

if (rTyme(D2_spd, oP.Tyme) && Turn < 3)
{
    D2 += D2_der;
    
    if (D2 < 0)
        D2 = 23;
    
    if (D2 > 23)
        D2 = 0;
}

draw_sprite_ext(sDice3, D1, 122, eY + 104, s1, s1, 0, rgb(0, 0, 25), 0.5);
draw_sprite_ext(sDice3, D1, 118, eY + 100, s1, s1, 0, c_white, 1);
draw_sprite_ext(sDice3, D2, 122, eY + 104 + 150, s2, s2, 0, rgb(0, 0, 25), 0.5);
draw_sprite_ext(sDice3, D2, 118, eY + 100 + 150, s2, s2, 0, c_white, 1);
draw_sprite_ext(sPlus, 0, 123, eY + 175 + 5, 0.5 + (s1 * 0.1), 0.5 + (s1 * 0.1), 0, rgb(0, 0, 25), 0.5);
DrawOutline(228, 0, 118, eY + 175, 0.5 + (s1 * 0.1), 0.5 + (s1 * 0.1), 0, 16777215, 1);

if (Turn == 1)
{
    draw_sprite_ext(sPlus, 1, 122, eY + 104, 1 + (sin(oP.Tyme * 0.1) * 0.1), 1 + (sin(oP.Tyme * 0.1) * 0.1), sin(oP.Tyme * 0.05) * 22, rgb(0, 0, 25), 0.5);
    DrawOutline(228, 1, 118, eY + 100, 1 + (sin(oP.Tyme * 0.1) * 0.1), 1 + (sin(oP.Tyme * 0.1) * 0.1), sin(oP.Tyme * 0.05) * 22, 16777215, 1);
}

if (Turn == 2)
{
    draw_sprite_ext(sPlus, 1, 122, eY + 104 + 150, 1 + (sin(oP.Tyme * 0.1) * 0.1), 1 + (sin(oP.Tyme * 0.1) * 0.1), sin(oP.Tyme * 0.05) * 22, rgb(0, 0, 25), 0.5);
    DrawOutline(228, 1, 118, eY + 100 + 150, 1 + (sin(oP.Tyme * 0.1) * 0.1), 1 + (sin(oP.Tyme * 0.1) * 0.1), sin(oP.Tyme * 0.05) * 22, 16777215, 1);
}

s1 += ((2 - s1) / 6);
s2 += ((2 - s2) / 6);

if (Turn < 2)
    eY += ((0 - eY) / 6);

i1 = 0;

repeat (11)
{
    draw_sprite_ext(s22x22, i1, 494 + (sin((oP.Tyme + (10 * i1)) * 0.05) * 2), (eY + 240) - (26 * (8 - i1)), 1, 1, 0, c_white, 1);
    i1++;
}

if ((keyboard_check(ord("Z")) || keyboard_check(vk_enter)) && Tyme > 20)
    zTyme++;
else
    zTyme = 0;

if (Turn == 1)
{
    Val = D1;
    Val2 = D1_der;
}

if (Turn == 2)
{
    Val = D2;
    Val2 = D2_der;
}

if (zTyme == 1 && Turn < 3)
{
    zTyme = 2;
    oAlways.ShakePower = 5;
    oAlways.ShakeTyme = 5;
    sou(96);
    sou(snd_Parry);
    sou(snd_Parry);
    
    if (Val2 == 1)
    {
        if (Val == 0 || Val == 1 || Val == 22 || Val == 23)
            out = 1;
        
        if (Val == 2 || Val == 3 || Val == 4 || Val == 5)
            out = 2;
        
        if (Val == 6 || Val == 7 || Val == 8 || Val == 9)
            out = 3;
        
        if (Val == 10 || Val == 11 || Val == 12 || Val == 13)
            out = 4;
        
        if (Val == 14 || Val == 15 || Val == 16 || Val == 17)
            out = 5;
        
        if (Val == 18 || Val == 19 || Val == 20 || Val == 21)
            out = 6;
    }
    
    if (Val2 == -1)
    {
        if (Val == 0 || Val == 1 || Val == 2 || Val == 23)
            out = 1;
        
        if (Val == 3 || Val == 4 || Val == 5 || Val == 6)
            out = 2;
        
        if (Val == 7 || Val == 8 || Val == 9 || Val == 10)
            out = 3;
        
        if (Val == 11 || Val == 12 || Val == 13 || Val == 14)
            out = 4;
        
        if (Val == 15 || Val == 16 || Val == 17 || Val == 18)
            out = 5;
        
        if (Val == 19 || Val == 20 || Val == 21 || Val == 22)
            out = 6;
    }
    
    if (Turn == 1)
    {
        s1 = 4;
        
        if (out == 1)
            D1 = 0;
        
        if (out == 2)
            D1 = 4;
        
        if (out == 3)
            D1 = 8;
        
        if (out == 4)
            D1 = 12;
        
        if (out == 5)
            D1 = 16;
        
        if (out == 6)
            D1 = 20;
        
        eD1 = out;
    }
    
    if (Turn == 2)
    {
        s2 = 4;
        
        if (out == 1)
            D2 = 0;
        
        if (out == 2)
            D2 = 4;
        
        if (out == 3)
            D2 = 8;
        
        if (out == 4)
            D2 = 12;
        
        if (out == 5)
            D2 = 16;
        
        if (out == 6)
            D2 = 20;
        
        eD2 = out;
    }
    
    Turn++;
    
    if (Turn == 3)
    {
        if (oMakeUI.Dice6 < 3)
            audio_resume_sound(oAlways.BattleMusic);
        
        audio_stop_sound(mus_dice);
        Turn = 4;
        
        with (oTextEngine)
        {
            if (Spez == "DiceHelp")
                des(0);
        }
        
        with (instance_create_depth(0, 0, 0, oDice))
        {
            D1 = other.eD1 + other.eD2;
            D2 = iRan(0, 2);
            ja = true;
        }
        
        Dice = eD1 + eD2;
        QQ = 2;
        DiceAllText();
    }
}

if (Turn > 2)
{
    if (rTyme(3, oP.Tyme))
        EE++;
    
    eY += EE;
    
    if (eY > 500)
        des(0);
}
