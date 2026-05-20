if (!Stop)
{
    while (!ActionFound && !Stop)
    {
        with (oTextEngine)
        {
            if (Spez != "TPa")
                instance_destroy();
        }
        
        PepDid = "no";
        
        if (SixS == 1)
        {
            if (oMakeUI.Actions[Pep] == "1_2_CHECK")
            {
                scrActF();
                oMakeUI.Check += 1;
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    
                    if (oMakeUI.Check == 1)
                    {
                        Text[0] = "* Spamton Restitched - YOU WON'T@FIND HIGHER ATTACK AND DEFENSE@ANYWHERE ELSE!!!";
                        Text[1] = "* WAKE UP AND SMELL THAT PAIN!£* Though.€€€€€€€€€.€€€€€€€€€.€€€€€€€€€.€€€€€€€€€£* He's still a little shaky.";
                    }
                    else
                    {
                        Text[0] = "fhuehfuehfuehfuheufhe";
                    }
                }
            }
            
            if (oMakeUI.Actions[Pep] == "PA")
            {
                oSpamtonRig.LimbShake = 10;
                oAlways.ActionWait = 50;
                
                with (instance_create_depth(470, 155, -2000, oEEF))
                {
                    Seed = "Hand Big";
                    image_alpha = 0;
                }
                
                oMakeUI.Spare += 7;
                scrActF();
                scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 7, 1);
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Everyone pulled needle!";
                    Seed = "EndAction";
                    
                    if (oMakeUI.Spare >= 100)
                        AllowKeys = false;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "1_2_Wind")
            {
                scrActF();
                oSpamtonRig.LimbShake = 5;
                
                if (oMakeUI.HP[1] < 1 && oMakeUI.HP[2] < 1)
                {
                    scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 4, 1);
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* You pulled desperately!";
                        
                        if (oMakeUI._Last)
                        {
                            Text[1] = "* But it refused.";
                            Spez = "BIR";
                            Spez2 = "BIRD";
                        }
                    }
                    
                    oMakeUI.Spare += 4;
                }
                else
                {
                    scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 2, 1);
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* You pulled needle!";
                        
                        if (oMakeUI._Last)
                        {
                            Text[1] = "* But it refused.";
                            Spez = "BIR";
                        }
                    }
                    
                    oMakeUI.Spare += 2;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_6_S_Mag1")
            {
                scrActF();
                oSpamtonRig.LimbShake = 5;
                
                if (oMakeUI.HP[0] < 1 && oMakeUI.HP[2] < 1)
                {
                    scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 4, 1);
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Susie pulled desperately!";
                        
                        if (oMakeUI._Last)
                        {
                            Text[1] = "* But it refused.";
                            Spez = "BIR";
                            Spez2 = "BIRD";
                        }
                    }
                    
                    oMakeUI.Spare += 4;
                }
                else
                {
                    scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 2, 1);
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Susie pulled needle!";
                        
                        if (oMakeUI._Last)
                        {
                            Text[1] = "* But it refused.";
                            Spez = "BIR";
                        }
                    }
                    
                    oMakeUI.Spare += 2;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "3_6_S_Mag1")
            {
                scrActF();
                oSpamtonRig.LimbShake = 5;
                
                if (oMakeUI.HP[0] < 1 && oMakeUI.HP[1] < 1)
                {
                    scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 4, 1);
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Ralsei pulled desperately!";
                        
                        if (oMakeUI._Last)
                        {
                            Text[1] = "* But it refused.";
                            Spez = "BIR";
                            Spez2 = "BIRD";
                        }
                    }
                    
                    oMakeUI.Spare += 4;
                }
                else
                {
                    scrNumber(425, 175, 276, make_color_rgb(255, 255, 255), "+", 2, 1);
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Ralsei pulled needle!";
                        
                        if (oMakeUI._Last)
                        {
                            Text[1] = "* But it refused.";
                            Spez = "BIR";
                        }
                    }
                    
                    oMakeUI.Spare += 2;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_6_S_Mag2")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* You Multi Shot! Can shoot@two bullets at the same time!£* Lasts 10 shots";
                }
                
                oAlways.MultiShot = 15;
            }
            
            if (oMakeUI.Actions[Pep] == "3_6_S_Mag2")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Ralsei defended you!";
                }
                
                oAlways.PointyGuard = 5;
            }
            
            if (oMakeUI.Actions[Pep] == "1_6_A_1")
            {
                scrActF();
                oMakeUI.Check += 1;
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    
                    if (oMakeUI.Check == 1)
                        Text[0] = "* Scampton - Not one for conversation,@you gotta COMPETE your way@out of this one!";
                    else
                        Text[0] = "I hate golf";
                }
            }
            
            if (oMakeUI.Actions[Pep] == "1_6_A_2" || oMakeUI.Actions[Pep] == "1_6_A_4")
            {
                scrActF();
                
                if (oMakeUI.Actions[Pep] == "1_6_A_4")
                    beefText(4);
                
                if (oMakeUI.Actions[Pep] == "1_6_A_2")
                    beefText(2);
            }
            
            if (oMakeUI.Actions[Pep] == "PA2" && Pep == 0)
            {
                scrActF();
                oMakeUI.Spare += 7;
                scrNumber(320, 125, 276, make_color_rgb(255, 255, 255), "+", 7, 1);
                oMakeUI.SpareTurns += 1;
                
                if (oMakeUI.SpareTurns == 1)
                {
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Everyone played Scampton!€€€€€€£* He's under a blunder...";
                    }
                }
                
                if (oMakeUI.SpareTurns == 2)
                {
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Everyone played Scampton!€€€€€€£* He ate all his pisces...";
                    }
                }
                
                if (oMakeUI.SpareTurns == 3)
                {
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Everyone played Scampton!€€€€€€£* He thinks about this...";
                    }
                }
                
                if (oMakeUI.SpareTurns == 4)
                {
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Everyone played Scampton!€€€€€€£* He never forgets...";
                    }
                }
                
                if (oMakeUI.SpareTurns == 5)
                {
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Everyone played Scampton!€€€€€€£* He makes a large noise...";
                        oMakeUI.SpareTurns = 0;
                    }
                }
            }
            
            if (oMakeUI.Actions[Pep] == "3_2_H_1" || oMakeUI.Actions[Pep] == "3_2_H_3" || oMakeUI.Actions[Pep] == "3_2_H_5")
            {
                scrActF();
                
                if (oMakeUI.Actions[Pep] == "3_2_H_1")
                {
                    oMakeUI.Stat[oMakeUI.SelPep[Pep] - 1] += 2;
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Charkis casts DEFENSE UP!";
                    }
                }
                
                if (oMakeUI.Actions[Pep] == "3_2_H_3")
                {
                    oMakeUI.Stat[(oMakeUI.SelPep[Pep] - 1) + 3] += 2;
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Charkis casts ATTACK UP!";
                    }
                }
                
                if (oMakeUI.Actions[Pep] == "3_2_H_5")
                {
                    oMakeUI.Stat[(oMakeUI.SelPep[Pep] - 1) + 6] += 1;
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        JustText = true;
                        Text[0] = "* Charkis casts IMMUNITY!";
                    }
                }
                
                if (oMakeUI.SelPep[Pep] == 1)
                {
                    x = 105;
                    i1 = rgb(222, 180, 237);
                }
                
                if (oMakeUI.SelPep[Pep] == 2)
                {
                    x = 320;
                    i1 = rgb(255, 235, 59);
                }
                
                if (oMakeUI.SelPep[Pep] == 3)
                {
                    x = 535;
                    i1 = rgb(53, 198, 148);
                }
                
                y = 275;
                
                with (instance_create_depth(x, y, -15000, oEEF))
                {
                    Seed = "ActUP";
                    sou(69);
                    
                    if (oMakeUI.Actions[other.Pep] == "3_2_H_1")
                    {
                        i1 = 1;
                        Var1 = other.i1;
                    }
                    
                    if (oMakeUI.Actions[other.Pep] == "3_2_H_3")
                    {
                        i1 = 2;
                        Var1 = other.i1;
                    }
                    
                    if (oMakeUI.Actions[other.Pep] == "3_2_H_5")
                    {
                        i1 = 3;
                        Var1 = other.i1;
                    }
                }
                
                with (instance_create_depth(x - 50, y, -15000, oEEF))
                {
                    Seed = "ActUP";
                    i1 = 0;
                    Var1 = other.i1;
                    Tyme = -5;
                }
                
                with (instance_create_depth(x + 75, y, -15000, oEEF))
                {
                    Seed = "ActUP";
                    i1 = 0;
                    Var1 = other.i1;
                    Tyme = -10;
                }
                
                with (instance_create_depth(x - 75, y, -15000, oEEF))
                {
                    Seed = "ActUP";
                    i1 = 0;
                    Var1 = other.i1;
                    Tyme = -15;
                }
                
                with (instance_create_depth(x + 50, y, -15000, oEEF))
                {
                    Seed = "ActUP";
                    i1 = 0;
                    Var1 = other.i1;
                    Tyme = -20;
                }
            }
            
            if (Pep != 2)
            {
                if (ActionFound || Stop)
                {
                    with (oPep)
                    {
                        if (Pep == (other.Pep + 1))
                        {
                            sprite_index = ans[7];
                            image_index = 0;
                        }
                    }
                }
            }
        }
        
        if (SixS == 2)
        {
            TheItem = oMakeUI.WillItem[Pep];
            
            if (TheItem != "TensionBit")
            {
                with (instance_create_depth(0, 0, 0, oHeal))
                {
                    Item = other.TheItem;
                    Pep = other.Pep;
                    HP = "no";
                    
                    if (oMakeUI.Actions[other.Pep] == "1_3_Heal_Item_1" || oMakeUI.Actions[other.Pep] == "2_3_Heal_Item_1" || oMakeUI.Actions[other.Pep] == "3_3_Heal_Item_1")
                        Seed = 1;
                    
                    if (oMakeUI.Actions[other.Pep] == "1_3_Heal_Item_2" || oMakeUI.Actions[other.Pep] == "2_3_Heal_Item_2" || oMakeUI.Actions[other.Pep] == "3_3_Heal_Item_2")
                        Seed = 2;
                    
                    if (oMakeUI.Actions[other.Pep] == "1_3_Heal_Item_3" || oMakeUI.Actions[other.Pep] == "2_3_Heal_Item_3" || oMakeUI.Actions[other.Pep] == "3_3_Heal_Item_3")
                        Seed = 3;
                    
                    if (oMakeUI.Actions[other.Pep] == "1_3_Item" || oMakeUI.Actions[other.Pep] == "2_3_Item" || oMakeUI.Actions[other.Pep] == "3_3_Item")
                        Seed = 4;
                    
                    if (other.TheItem == "CD Bagel")
                        HP = 80;
                    
                    if (other.TheItem == "SpagettiCode")
                        HP = 30;
                    
                    if (other.TheItem == "ReviveMint")
                        HP = 999;
                    
                    if (other.TheItem == "ButJuice")
                        HP = 100;
                    
                    if (other.TheItem == "BurntPipis")
                        HP = 0;
                    
                    if (other.TheItem == "MainMenu")
                    {
                        oP.Deaths = 0;
                        audio_stop_sound(oAlways.BattleMusic);
                        audio_stop_sound(TS_Intro);
                        audio_stop_sound(TS_End);
                        room_goto(rMainu);
                    }
                    
                    if (other.TheItem == "NerdSeed")
                    {
                        HP = iRan(1, 6) * 5;
                        
                        if (Seed == 2)
                            HP = 31;
                    }
                    
                    if (other.TheItem == "CrystalCob")
                        HP = 50;
                    
                    if (other.TheItem == "BrutchBrunch")
                        HP = 30;
                    
                    if (other.TheItem == "NerdDrumstick")
                        HP = 60;
                    
                    if (other.TheItem == "ScrabbledEggs")
                        HP = 30;
                    
                    if (other.TheItem == "BackGammon")
                        HP = 70;
                    
                    if (other.TheItem == "AsrielBrew")
                    {
                        if (Seed == 1)
                            HP = 30;
                        
                        if (Seed == 2)
                            HP = 30;
                        
                        if (Seed == 3)
                            HP = 50;
                    }
                    
                    if (other.TheItem == "NoelleBrew")
                    {
                        if (Seed == 1)
                            HP = 40;
                        
                        if (Seed == 2)
                            HP = 10;
                        
                        if (Seed == 3)
                            HP = 40;
                    }
                    
                    if (other.TheItem == "CharkisBrew")
                    {
                        if (Seed == 1)
                            HP = 30;
                        
                        if (Seed == 2)
                            HP = 10;
                        
                        if (Seed == 3)
                            HP = 50;
                    }
                    
                    if (HP == "no")
                        instance_destroy();
                }
                
                if (oMakeUI.Actions[Pep] == "1_3_Heal_Item_1" || oMakeUI.Actions[Pep] == "1_3_Heal_Item_2" || oMakeUI.Actions[Pep] == "1_3_Heal_Item_3" || oMakeUI.Actions[Pep] == "1_3_Item")
                {
                    scrActF();
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        UppercaseNumb = 18;
                        JustText = true;
                        Text[0] = "* Asriel used the " + other.TheItem + "!";
                    }
                }
                
                if (oMakeUI.Actions[Pep] == "2_3_Heal_Item_1" || oMakeUI.Actions[Pep] == "2_3_Heal_Item_2" || oMakeUI.Actions[Pep] == "2_3_Heal_Item_3" || oMakeUI.Actions[Pep] == "2_3_Item")
                {
                    scrActF();
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        UppercaseNumb = 18;
                        JustText = true;
                        Text[0] = "* Noelle used the " + other.TheItem + "!";
                    }
                }
                
                if (oMakeUI.Actions[Pep] == "3_3_Heal_Item_1" || oMakeUI.Actions[Pep] == "3_3_Heal_Item_2" || oMakeUI.Actions[Pep] == "3_3_Heal_Item_3" || oMakeUI.Actions[Pep] == "3_3_Item")
                {
                    scrActF();
                    
                    with (instance_create_depth(30, 382, -9999, oTextEngine))
                    {
                        UppercaseNumb = 19;
                        JustText = true;
                        Text[0] = "* Charkis used the " + other.TheItem + "!";
                    }
                }
            }
        }
        
        if (SixS == 3)
        {
            if (oMakeUI.Actions[Pep] == "1_4_NAME")
            {
                scrActF();
                scrNumber(320, 125, 288, make_color_rgb(255, 255, 255), "MISS", "#", 0);
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "_cw* Asriel spared Scampton!€€€€€€€€€£* But its name wasn't _cyYELLOW_cw...";
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_4_NAME")
            {
                scrActF();
                scrNumber(320, 125, 288, make_color_rgb(255, 255, 255), "MISS", "#", 0);
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "_cw* Noelle spared Scampton!€€€€€€€€€£* But its name wasn't _cyYELLOW_cw...";
                }
            }
            
            if (oMakeUI.Actions[Pep] == "3_4_NAME")
            {
                scrActF();
                scrNumber(320, 125, 288, make_color_rgb(255, 255, 255), "MISS", "#", 0);
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "_cw* Charkis spared Scampton!€€€€€€€€€£* But its name wasn't _cyYELLOW_cw...";
                }
            }
        }
        
        if (SixS == 4)
        {
            if (oMakeUI.Actions[Pep] == "2_6_S_Mag3")
            {
                scrActF();
                oSusie.image_index = 0;
                oSusie.image_speed = 1;
                oSusie.sprite_index = sSusie_Rude;
                oAlways.ActionWait = 100;
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Susie used RUDE BUSTER!";
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_6_Heal_1" || oMakeUI.Actions[Pep] == "2_6_Heal_2" || oMakeUI.Actions[Pep] == "2_6_Heal_3")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Susie cast ULTIMATEHEAL!";
                }
                
                with (instance_create_depth(0, 0, 0, oHeal))
                {
                    Item = 0;
                    Pep = other.Pep;
                    HP = 2;
                    
                    if (oMakeUI.Actions[other.Pep] == "2_6_Heal_1")
                        Seed = 1;
                    
                    if (oMakeUI.Actions[other.Pep] == "2_6_Heal_2")
                        Seed = 2;
                    
                    if (oMakeUI.Actions[other.Pep] == "2_6_Heal_3")
                        Seed = 3;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "3_6_S_Mag3")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "_cw* Ralsei cast PACIFY!€€€€€€€€€£* But the enemy wasn't _cbTIRED_cw...";
                }
            }
            
            if (oMakeUI.Actions[Pep] == "3_6_Heal_1" || oMakeUI.Actions[Pep] == "3_6_Heal_2" || oMakeUI.Actions[Pep] == "3_6_Heal_3")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Ralsei casts HEAL PRAYER!";
                }
                
                with (instance_create_depth(0, 0, 0, oHeal))
                {
                    Item = 0;
                    Pep = other.Pep;
                    HP = 55;
                    
                    if (oMakeUI.Actions[other.Pep] == "3_6_Heal_1")
                        Seed = 1;
                    
                    if (oMakeUI.Actions[other.Pep] == "3_6_Heal_2")
                        Seed = 2;
                    
                    if (oMakeUI.Actions[other.Pep] == "3_6_Heal_3")
                        Seed = 3;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_6_N_1")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Noelle casts HEAL PRAYER!";
                }
                
                with (instance_create_depth(0, 0, 0, oHeal))
                {
                    HP = 45;
                    Seed = oMakeUI.SelPep[other.Pep];
                    Item = 0;
                    Pep = other.Pep;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_6_N_3")
            {
                scrActF();
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Noelle casts HEAL HAILING!";
                }
                
                with (instance_create_depth(0, 0, 0, oHeal))
                {
                    HP = 25;
                    Seed = 4;
                    Item = 0;
                    Pep = other.Pep;
                }
            }
            
            if (oMakeUI.Actions[Pep] == "2_6_N_2")
            {
                scrActF();
                oAlways.ActionWait = 50;
                sou(45);
                sou(45);
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Noelle casts ICESHOCK!";
                }
                
                with (instance_create_depth(oSpamtonRig.LockX, oSpamtonRig.LockY - 80, 0, oEEF))
                    Seed = "IceMake";
            }
            
            if (ActionFound || Stop)
            {
                with (oPep)
                {
                    if (Pep == (other.Pep + 1))
                    {
                        sprite_index = ans[7];
                        image_index = 0;
                    }
                }
            }
        }
        
        if (SixS == 5)
        {
            oSpamtonRig.HitAnMemb = oSpamtonRig.AnMode;
            
            if (oMakeUI.Actions[0] == "1_1_NAME" || oMakeUI.Actions[1] == "2_1_NAME" || oMakeUI.Actions[2] == "3_1_NAME")
            {
                scrActF();
                instance_create_depth(0, 0, -9999, oFightDraw);
            }
        }
        
        if (SixS == 6)
        {
            if (oMakeUI.Actions[Pep] == "FF")
            {
                scrActF();
                
                with (instance_create_depth(0, 0, 0, oCC))
                    Seed = "FF";
            }
        }
        
        if (SixS == 4)
        {
            if (oMakeUI.Actions[Pep] == "2_6_Heal_1" || oMakeUI.Actions[Pep] == "2_6_Heal_2" || oMakeUI.Actions[Pep] == "2_6_Heal_3")
            {
                oSusie.image_index = 0;
                oSusie.image_speed = 1;
                oSusie.sprite_index = sSusie_Spare;
            }
            
            if (oMakeUI.Actions[Pep] == "3_6_S_Mag3" || oMakeUI.Actions[Pep] == "3_6_Heal_1" || oMakeUI.Actions[Pep] == "3_6_Heal_2" || oMakeUI.Actions[Pep] == "3_6_Heal_3")
            {
                oRalsei.image_index = 0;
                oRalsei.image_speed = 1;
                oRalsei.sprite_index = sRalsei_Mag;
            }
        }
        
        if (PepDid != "no")
        {
            if (SixS == 2)
            {
                if (PepDid == 0)
                {
                    oKris.image_index = 0;
                    oKris.image_speed = 1;
                    oKris.sprite_index = sKris_Item;
                }
                
                if (PepDid == 1)
                {
                    oSusie.image_index = 0;
                    oSusie.image_speed = 1;
                    oSusie.sprite_index = sSusie_Item;
                }
                
                if (PepDid == 2)
                {
                    oRalsei.image_index = 0;
                    oRalsei.image_speed = 1;
                    oRalsei.sprite_index = sRalsei_Item;
                }
            }
            
            if (SixS == 3)
            {
                if (PepDid == 0)
                {
                    oKris.image_index = 0;
                    oKris.image_speed = 1;
                    oKris.sprite_index = sKris_Spare;
                }
                
                if (PepDid == 1)
                {
                    oSusie.image_index = 0;
                    oSusie.image_speed = 1;
                    oSusie.sprite_index = sSusie_Spare;
                }
                
                if (PepDid == 2)
                {
                    oRalsei.image_index = 0;
                    oRalsei.image_speed = 1;
                    oRalsei.sprite_index = sRalsei_Mag;
                }
            }
        }
        
        Pep += 1;
        
        if (Pep == array_length(oMakeUI.Party))
        {
            SixS += 1;
            Pep = 0;
            oAlways.StackNumber = 0;
        }
        
        if (SixS == 7)
            Stop = true;
    }
}

if (Stop)
{
    if (oSpamtonRig.HitAnT > 0)
    {
        oSpamtonRig.HitAnT = 0;
        oSpamtonRig.AnMode = oSpamtonRig.HitAnMemb;
        oSpamtonRig.image_index = 0;
    }
    
    oTP.ExtraX = 0;
    oSpamtonRig.MoveMode = false;
    oSpamtonRig.LastAn = oSpamtonRig.AnMode;
    oSpamtonRig.depth = oSpamtonRig.TheDepth;
    
    with (oPep)
    {
        if (sprite_index != ans[5] && oMakeUI.HP[Pep - 1] > 0)
            sprite_index = ans[0];
    }
    
    if (oMakeUI.Spare >= 100 || oMakeUI.SpamtonHP <= 0)
    {
        with (instance_create_depth(0, 0, 0, oCC2))
            Seed = "BattleEnd";
        
        des(0);
    }
    else
    {
        with (instance_create_depth(0, 0, 0, oEEF))
            Seed = "BlackB2";
        
        if (oMakeUI.FAISD[0] != 5)
            oMakeUI.Actions[0] = 0;
        
        if (oMakeUI.FAISD[1] != 5)
            oMakeUI.Actions[1] = 0;
        
        if (oMakeUI.FAISD[2] != 5)
            oMakeUI.Actions[2] = 0;
        
        if (oKris.sprite_index == sKris_Act)
        {
            oKris.sprite_index = sKris_UnAct;
            oKris.image_index = 0;
            oKris.image_speed = 1;
        }
        
        if (oSusie.sprite_index == sSusie_Act)
        {
            oSusie.sprite_index = sSusie_UnAct;
            oSusie.image_index = 0;
            oSusie.image_speed = 1;
        }
        
        if (oRalsei.sprite_index == sRalsei_Act)
        {
            oRalsei.sprite_index = sRalsei_UnAct;
            oRalsei.image_index = 0;
            oRalsei.image_speed = 1;
        }
        
        if (oMakeUI.Pattern == 6 && !oMakeUI.TutorialDone)
            oMakeUI.TutorialDone = true;
        
        if (oMakeUI.TutorialDone && !oMakeUI.Hatk && (oMakeUI.Spare >= 20 || (100 - ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100)) >= 20))
            oMakeUI.Hatk = true;
        
        if (oMakeUI._Last)
            oMakeUI.Pattern = "TP";
        
        oMakeUI.PastPT = oMakeUI.Pattern;
        
        if (oMakeUI.Pattern != "B1" && oMakeUI.Pattern != "B2" && oMakeUI.Pattern != "B3" && oMakeUI.Pattern != "N1" && oMakeUI.Pattern != "L1")
        {
            oMakeUI.Pattern++;
            
            if (!oMakeUI.LoopGoop)
            {
                if (oMakeUI.Pattern > 6)
                    oMakeUI.Pattern = 2;
            }
        }
        
        if (oMakeUI.LoopGoop)
        {
            if (LPC && oMakeUI.Pattern == "L1")
            {
                LPC = false;
                oMakeUI.Pattern = "B3";
            }
            
            if (LPC && oMakeUI.Pattern == "B3")
            {
                LPC = false;
                oMakeUI.Pattern = 2;
            }
            
            if (LPC && oMakeUI.Pattern > 6)
            {
                LPC = false;
                oMakeUI.Pattern = "L1";
            }
        }
        
        oMakeUI.BoxFlav++;
        
        if (oMakeUI.BoxFlav > 10)
            oMakeUI.BoxFlav = 3;
        
        if (oMakeUI.Spare >= 70 || ((oMakeUI.SpamtonHP / oMakeUI.SpamtonMaxHP) * 100) <= 25)
            oMakeUI.PatternStage += 1;
        
        if (oMakeUI.PatternStage == 0 && oMakeUI.Pattern == 3)
        {
            oMakeUI.PatternStage = 1;
            oMakeUI.Pattern = "B1";
        }
        
        if (oMakeUI.PatternStage == 1 && oMakeUI.Pattern == 6)
        {
            oMakeUI.PatternStage = 2;
            oMakeUI.Pattern = "B2";
        }
        
        if (oMakeUI.PatternStage == 3)
            oMakeUI.Pattern = "B3";
        
        if (oMakeUI.PatternStage == 4)
            oMakeUI.Pattern = "N1";
        
        if (oMakeUI.PatternStage == 5)
            oMakeUI.Pattern = "L1";
        
        if (false && !oMakeUI.LoopGoop)
        {
            oMakeUI.PastPT = oMakeUI.Pattern;
            oMakeUI.Pattern = 3;
        }
        
        ParryE = 0;
        
        if (oMakeUI.Pattern == 1)
            scrBoxStats("#", "#", 15, 10, "#", 0);
        
        if (oMakeUI.Pattern == 2)
        {
            if (!oMakeUI.Hatk)
                scrBoxStats("#", "#", 12, 12, "#", 1);
            else
                scrBoxStats(220, "#", 15, 15, "#", 2);
        }
        
        if (oMakeUI.Pattern == 3)
        {
            ParryE = 1;
            
            if (oMakeUI.Hatk)
                ParryE = 4;
            
            scrBoxStats("#", "#", 15, 15, "#", ParryE);
        }
        
        if (oMakeUI.Pattern == 4)
        {
            ParryE = 4;
            
            if (oMakeUI.Hatk)
                ParryE = 0;
            
            scrBoxStats("#", "#", 20, 17, "#", ParryE);
        }
        
        if (oMakeUI.Pattern == 5)
            scrBoxStats("#", "#", 17, 17, "#", 3);
        
        if (oMakeUI.Pattern == 6)
            scrBoxStats("#", 240, 20, 22, -4000, 1);
        
        if (oMakeUI.Pattern == "B1")
            scrBoxStats(220, "#", 20, 10, -12000, 3);
        
        if (oMakeUI.Pattern == "B2")
            scrBoxStats(220, "#", 20, 10, -12000, 5);
        
        if (oMakeUI.Pattern == "B3")
            scrBoxStats(220, "#", 20, 10, -12000, 4);
        
        if (oMakeUI.Pattern == "N1")
            scrBoxStats("#", 220, 15, 15, "#", 0);
        
        if (oMakeUI.Pattern == "L1")
            scrBoxStats("#", 340, 16, 12, -12000, 2);
        
        if (oP.NoHit == "Enabled")
        {
            instance_create_depth(-50, -50, -2800, oDarkCov);
            instance_create_depth(oMakeUI.Box_X, oMakeUI.Box_Y, oMakeUI.Box_Depth, oBox);
            
            with (instance_create_depth(100, 100, -9999, oSoul))
                Seed = "Glide";
            
            with (instance_create_depth(0, 0, -9999, oEEF))
                Seed = "SoulOutSpawner";
        }
        else
        {
            if (!oMakeUI.Hatk)
            {
                if (oMakeUI.Pattern == 1)
                {
                    if (oP.setP || oP.setG)
                        scrFlavourBub("What's with that@[HANDSOMELY GEAR]?#Did you steal@my likeness?", 430, 110, "9#7", "2#2", "3#3", "6#7", snd_scampton_voice);
                    else
                        scrFlavourBub("WHAT'S WITH THOSE FACES?@€€€€€€€€€SCARED OF A LITTLE@[Change of perspective?]", 400, 110, "11.5", "3", "3", "5", snd_scampton_voice);
                }
                
                if (oMakeUI.Pattern == 2)
                    scrFlavourBub("DON'T [Hurt yourself@in confusion]#THIS IS CERTIFIED@[Pipis] BLUE!!", 430, 110, "9.75#8.5", "2#2", "3#3", "1#5", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 3)
                    scrFlavourBub("PICK A [Card],@ANY [Kaard]#HOPE YOU GET@THE RIGHT ONE!!", 430, 110, "7#7.5", "2#2", "3#3", "1#2", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 4)
                    scrFlavourBub("SAY HELLO TO MY@[[MAGIC ME'S]]!!!", 430, 110, "8.5", "2", "3", "5", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 5)
                    scrFlavourBub("LET US PLAY THE@[Seeking game]!#[Eyes on the prize]@€€€€€€€€€NO PEEKING ALLOWED!", 430, 110, "8#10", "2#2", "3#3", "5#1", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 6)
                {
                    sou(tlk_express);
                    scrFlavourBub("ALL€€€ ABOARD€€€€€€€€€ THE@BIG SHOT EXPRESS!!!", 430, 110, "9.25", "2", "3", "2", snd_none);
                }
            }
            else
            {
                if (oMakeUI.Pattern == 2)
                    scrFlavourBub("THE [Bigger]@THE [BETTER]", 430, 110, "7", "2", "3", "2", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 3)
                    scrFlavourBub("FASTER,€€€€€€€€€ FASTER!!€€€€€€€€€ A@[Twister] IS BREWING!", 430, 110, "10", "2", "3", "1", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 4)
                    scrFlavourBub("GO FORTH, MY@[Miserable Pile of]@[Minions]!!!", 430, 110, "10", "3", "3", "1", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 5)
                    scrFlavourBub("[Eyes] ON THE [prize]!", 430, 110, "10.5", "1", "3", "5", snd_scampton_voice);
                
                if (oMakeUI.Pattern == 6)
                    scrFlavourBub("I HOPE YOU [trained]@FOR THIS!", 430, 110, "10", "2", "3", "6", snd_scampton_voice);
            }
            
            if (oMakeUI.Pattern == "B1")
            {
                sou(tlk_heart);
                scrFlavourBub("I€€ BRING€€ MY€€ [[Heart]]€€€€€€€€€@OUT TO€€ YOU€€€€€€ [Scamps!]!", 430, 100, "10", "2", "3", "3", snd_none);
            }
            
            if (oMakeUI.Pattern == "B2")
            {
                sou(tlk_strings);
                scrFlavourBub("NO€ MORE€ STRINGS€ ON€ ME!@€€€€€€€€€€€€€€€€€€€€€€€€NOW€€€ I€€€€€€ WILL€€€ BE€€€ FREE!!", 430, 100, "10.5", "2", "3", "3", snd_none);
            }
            
            if (oMakeUI.LoopGoop)
            {
                if (oMakeUI.Pattern == "B3")
                    scrFlavourBub("EXCITED€€€€€€€€ EXCITED@€€€€€€€€I€€€ AM€€€ EXCITED!!!", 430, 100, "8", "2", "3", "3", snd_scampton_voice);
                
                if (oMakeUI.Pattern == "L1")
                    scrFlavourBub("WELCOME TO YOUR@[Final Test]#[Again]", 430, 100, "7.5#4", "2#1", "3#3", "8#0", snd_scampton_voice);
            }
            else
            {
                if (oMakeUI.Pattern == "B3")
                {
                    sou(tlk_congratulations);
                    scrFlavourBub("[Congratulations!]€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€@YOU LOSE!!!", 430, 100, "9", "2", "3", "3", snd_none);
                }
                
                if (oMakeUI.Pattern == "L1")
                    scrFlavourBub("ENOUGH!€€€€€€€€€ YOU KIDS ARE@STEPPING OUT OF LINE!#[[Behold]]€€€€€€€€€ THE@POWER OF NEO!", 430, 100, "10#7.5", "2#2", "3#3", "8#9", snd_scampton_voice);
                
                if (oMakeUI.Pattern == "N1")
                    scrFlavourBub("WHO NEEDS FRIENDS@WHEN YOU'VE GOT...#[[500 pounds of@pure steel!]]", 430, 100, "9#7.5", "2#2", "3#3", "2#7", snd_scampton_voice);
            }
        }
        
        instance_destroy();
    }
}
