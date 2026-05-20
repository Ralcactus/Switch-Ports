if (curtainC != -1)
{
    curtainC++;
    
    if (curtainX > curtainTarget)
    {
        curtainX -= curtainC;
        
        if (curtainX <= curtainTarget)
        {
            curtainX = curtainTarget;
            curtainC = -1;
            curtainShake = 8;
        }
    }
    else
    {
        curtainX += curtainC;
        
        if (curtainX >= curtainTarget)
        {
            curtainX = curtainTarget;
            curtainC = -1;
            curtainShake = 8;
            snd(snd_wing);
        }
    }
}

if (curtainX == 0)
    bcAlpha += ((0 - bcAlpha) / 5);
else
    bcAlpha += ((1 - bcAlpha) / 5);

i = irandom_range(-curtainShake, curtainShake);
ext(sPlayBC, 1, curtainX + i, 0, -2);
i = irandom_range(-curtainShake, curtainShake);
ext(sPlayBC, 1, (640 - curtainX) + i + irandom_range(-curtainShake, curtainShake), 0, 2);

if (curtainShake > 0)
    curtainShake--;

if (page == "buy" || page == "buy2")
{
    ext(sShopUI, 3, 0, 180 + _eys, undefined, undefined, undefined, undefined, shopAlpha);
    res_i();
    
    if ((cur == 0 && page == "buy") || (curSave == 0 && page == "buy2"))
        i1 = g_t("7_1");
    
    if ((cur == 1 && page == "buy") || (curSave == 1 && page == "buy2"))
        i1 = g_t("7_2");
    
    if ((cur == 2 && page == "buy") || (curSave == 2 && page == "buy2"))
        i1 = g_t("7_3");
    
    if ((cur == 3 && page == "buy") || (curSave == 3 && page == "buy2"))
        i1 = g_t("7_4");
    
    if (cur != 4)
    {
        repeat (array_length(i1))
        {
            print(i1[i], 440, 234 + (i * 32) + _eys, undefined, undefined, ["prop"]);
            i++;
        }
    }
}

ext(sShopUI, 0 + (page == "dia"), 0, 240, undefined, undefined, undefined, undefined, shopAlpha);

if (page == "buy" || page == "buy2")
{
    ext(sShopUI, 2, 0, 8, undefined, undefined, undefined, undefined, shopAlpha);
    print(g_st("7_5") + string(12 - array_length(op.item)), 530, 430, sFont2);
}

if (page != "dia")
    print("$" + string(op.gold), 440, 426, undefined, undefined, ["prop"]);

if (page == 0)
{
    res_i();
    i1 = [shopText[0], shopText[1], shopText[2], shopText[3]];
    
    repeat (array_length(i1))
    {
        print(i1[i], 480, 266 + (i * 40), undefined, undefined, ["prop"]);
        i++;
    }
    
    ext(sSoul, 0, 456, 278 + (cur * 40), 1, 1);
}

if (page == "buy" || page == "buy2")
{
    res_i();
    i1 = g_t("7_0");
    
    repeat (array_length(i1))
    {
        if (soldOut[i][1] == 0)
        {
            print(i1[i], 60, 266 + (i * 40), undefined, undefined, ["prop"]);
            
            if (i != 4)
                print("$" + string(costs[i]), 300, 266 + (i * 40), undefined, undefined, ["prop"]);
        }
        else if (i != 4)
        {
            print(shopText[4], 60, 266 + (i * 40), undefined, 8421504, ["prop"]);
        }
        
        i++;
    }
    
    if (page == "buy")
        ext(sSoul, 0, 36, 278 + (cur * 40), 1, 1);
}

if (page == "buy2")
{
    print(shopText[5] + " ", 460, 266, undefined, undefined, ["prop"]);
    print("$" + string(costs[curSave]) + " ?", 460, 296, undefined, undefined, ["prop"]);
    print(shopText[6], 480, 346, undefined, undefined, ["prop"]);
    print(shopText[7], 480, 376, undefined, undefined, ["prop"]);
    ext(sSoul, 0, 456, 358 + (cur * 30), 1, 1);
}

if (page == "talk")
{
    res_i();
    i1 = [g_st("6_1_1"), g_st("6_2_1"), g_st("6_3_1"), g_st("6_4_1"), g_st("6_5")];
    
    if (talkProgress[3][1] == 1)
        i1[3] = g_st("6_4_2");
    
    repeat (array_length(i1))
    {
        i2 = 16777215;
        
        if (i != 4)
        {
            if (talkProgress[i][1] > 0)
                i2 = 65535;
        }
        
        print(i1[i], 60, 266 + (i * 40), undefined, i2, ["prop"]);
        i++;
    }
    
    ext(sSoul, 0, 36, 278 + (cur * 40), 1, 1);
}

ext(sPixel, 0, 0, 0, -9999, 9999, undefined, 0);
ext(sPixel, 0, 640, 0, 9999, 9999, undefined, 0);
ext(sPixel, 0, 0, 0, 640, 240, undefined, 0, black);
