if (ja)
{
    if (D1 != 6 && oMakeUI.Dice6 < 3)
        oMakeUI.Dice6 = 0;
    
    if (D1 == 2)
    {
        sou(69);
        oMakeUI.DamageMode = 1;
    }
    
    if (D1 == 3)
    {
        sou(105);
        oMakeUI.Spare += 3;
        scrNumber(320, 125, 276, rgb(255, 255, 255), "+", 3, 1);
        oMakeUI.HP[0] += 25;
        oMakeUI.HP[1] += 25;
        oMakeUI.HP[2] += 25;
        
        if (oMakeUI.HP[0] > oMakeUI.MaxHP[0])
            oMakeUI.HP[0] = oMakeUI.MaxHP[0];
        
        if (oMakeUI.HP[1] > oMakeUI.MaxHP[1])
            oMakeUI.HP[1] = oMakeUI.MaxHP[1];
        
        if (oMakeUI.HP[2] > oMakeUI.MaxHP[2])
            oMakeUI.HP[2] = oMakeUI.MaxHP[2];
    }
    
    if (D1 == 4)
    {
        sou(88);
        
        if (oMakeUI.HP[D2] > 0)
        {
            oMakeUI.HP[D2] -= 35;
            
            if (oMakeUI.HP[D2] < 1)
                oMakeUI.HP[D2] = 1;
        }
    }
    
    if (D1 == 5)
    {
        sou(69);
        oMakeUI.HurtMode = 1;
        oMakeUI.Spare += 1;
        scrNumber(320, 125, 276, rgb(255, 255, 255), "+", 1, 1);
    }
    
    if (D1 == 6)
    {
        oMakeUI.Dice6++;
        
        if (oMakeUI.Dice6 > 2)
        {
            oSpamtonRig.AnMode = "P";
            audio_pause_sound(oAlways.BattleMusic);
            audio_play_sound(snd_junkilpede, -999, true);
        }
    }
    
    if (D1 == 7)
    {
        oMakeUI.Spare += 2;
        scrNumber(320, 125, 276, rgb(255, 255, 255), "+", 2, 1);
    }
    
    if (D1 == 9)
    {
        sou(88);
        oMakeUI.HurtMode = 2;
    }
    
    if (D1 == 10)
    {
        sou(105);
        oMakeUI.Spare += 2;
        scrNumber(320, 125, 276, rgb(255, 255, 255), "+", 2, 1);
        D2 = iRan(0, 2);
        
        if (!(oMakeUI.HP[0] == oMakeUI.MaxHP[0] && oMakeUI.HP[1] == oMakeUI.MaxHP[1] && oMakeUI.HP[2] == oMakeUI.MaxHP[2]))
        {
            while (oMakeUI.HP[D2] == oMakeUI.MaxHP[D2])
                D2 = iRan(0, 2);
            
            oMakeUI.HP[D2] += 55;
            
            if (oMakeUI.HP[D2] > oMakeUI.MaxHP[D2])
                oMakeUI.HP[D2] = oMakeUI.MaxHP[D2];
        }
    }
    
    if (D1 == 11)
    {
        sou(88);
        
        if (oMakeUI.HP[0] > 0)
        {
            oMakeUI.HP[0] -= 25;
            
            if (oMakeUI.HP[0] < 1)
                oMakeUI.HP[0] = 1;
        }
        
        if (oMakeUI.HP[1] > 0)
        {
            oMakeUI.HP[1] -= 25;
            
            if (oMakeUI.HP[1] < 1)
                oMakeUI.HP[1] = 1;
        }
        
        if (oMakeUI.HP[2] > 0)
        {
            oMakeUI.HP[2] -= 25;
            
            if (oMakeUI.HP[2] < 1)
                oMakeUI.HP[2] = 1;
        }
    }
    
    if (D1 == 12)
    {
        oMakeUI.Spare += 5;
        scrNumber(320, 125, 276, rgb(255, 255, 255), "+", 5, 1);
    }
    
    des(0);
}
