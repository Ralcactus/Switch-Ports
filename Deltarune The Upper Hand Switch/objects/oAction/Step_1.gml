ty++;
use_keys();

if (inf_act == 0)
{
    oAActor.go = true;
    des(0);
}

if (inf_act == "item")
{
    if (ty == 1)
    {
        get_stats(op.party[inf_from]);
        i1 = "* " + jam[0] + " " + g_st("s_9") + " ";
        get_items(inf_item);
        i1 += (string_upper(jam[0]) + "!");
        
        if (array_contains(jamSeed, "randomEffect"))
        {
            snd(snd_cardrive);
            var _randomEffect = irandom_range(0, 2);
            
            if (op.st_noHit == 1)
                _randomEffect = 1;
            
            if (_randomEffect == 0)
            {
                jam[1] += 50;
                i1 += ("£" + g_st("s_6"));
            }
            
            if (_randomEffect == 1)
            {
                oBUI.TP += 25;
                i1 += ("£" + g_st("s_7"));
            }
            
            if (_randomEffect == 2)
            {
                oBUI.extraDEF[inf_too] += 3;
                i1 += ("£" + g_st("s_8"));
            }
        }
        
        oneText(i1, 30, 382, sFont1, 16777215, 0, undefined, "ago");
    }
    
    if (ty == 20)
    {
        if (arrayContains(jamSeed, "eatOne"))
            healPep(inf_too, jam[1]);
        
        if (arrayContains(jamSeed, "eatAll"))
        {
            res_i();
            
            repeat (array_length(op.party))
            {
                healPep(i, jam[1]);
                i++;
            }
        }
        
        des(0);
    }
}

if (inf_act == "spare")
{
    if (ty == 1)
    {
        temp = g_t("s_5");
        get_stats(op.party[inf_from]);
        i1 = "* " + jam[0] + " " + temp[0] + " ";
        get_enemieStats(oBUI.tot_enemies[inf_too]);
        i1 += (jam[1] + "!€€€€€€€€€");
        
        if (jam[5] < 100)
            i1 += ("£" + temp[1]);
        
        oneText(i1, 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
    }
}

if (inf_act == "fight")
{
    if (TapZ)
        j5 = 1;
    
    if (ty > 5 && j4 == 0)
        j7++;
    
    if (j7 > 30)
        j8 += 0.1;
    
    if (j8 >= 1)
    {
        oAActor.pep = array_length(op.party);
        oAActor.go = true;
        des(0);
    }
    
    if (ty == 1)
    {
        res_k();
        
        repeat (array_length(op.party))
        {
            if (oBUI.actions[k][0] == "fight")
                k1++;
            
            k++;
        }
        
        if (array_length(op.party) == 1 || k1 == 1)
        {
            res_j();
            j1 = [0, 0, 0];
        }
        else
        {
            res_j();
            j3 = 1;
            
            while (j3 == 1)
            {
                j1 = 0;
                j2 = 0;
                
                repeat (array_length(op.party))
                {
                    if (op.hp[j2] < 1)
                        j1[j2] = -1;
                    else
                        j1[j2] = irandom_range(0, 2);
                    
                    j2++;
                }
                
                j2 = 0;
                
                repeat (array_length(op.party) - 1)
                {
                    j2++;
                    
                    if (j1[0] != j1[j2])
                        j3 = 0;
                }
            }
            
            if (oBUI.actions[0][0] != "fight")
                j1[0] = -1;
            
            if (array_length(op.party) >= 2)
            {
                if (oBUI.actions[1][0] != "fight")
                    j1[1] = -1;
            }
            
            if (array_length(op.party) >= 3)
            {
                if (oBUI.actions[2][0] != "fight")
                    j1[2] = -1;
            }
            
            while (!arrayContains(j1, 0))
            {
                j2 = 0;
                
                repeat (array_length(j1))
                {
                    j1[j2]--;
                    j2++;
                }
            }
            
            if (!arrayContains(j1, 1))
            {
                j2 = 0;
                
                repeat (array_length(j1))
                {
                    if (j1[j2] > 0)
                        j1[j2]--;
                    
                    j2++;
                }
            }
        }
        
        j6 = 0;
        
        repeat (array_length(op.party))
        {
            if (oBUI.actions[j][0] == "fight")
            {
                j4++;
                
                with (instance_create_depth(85, 365 + (38 * j), -9999, oBO))
                {
                    seed = "fightStick";
                    i = other.j1[other.j];
                    i3 = other.j;
                }
            }
            
            j++;
        }
    }
    
    j6 = false;
    
    with (oBO)
    {
        if (seed == "fightStick" && x < 69)
        {
            other.j4--;
            other.j6 = true;
        }
    }
    
    if (j6)
    {
        j6 = false;
        
        with (oBO)
        {
            if (seed == "fightStick")
            {
                i--;
                
                if (x < 69)
                {
                    damageEne(oBUI.actions[i3][2], i3, 0);
                    des(0);
                }
            }
        }
    }
    
    if (j4 != 0)
    {
        if (TapZ)
        {
            j9 = false;
            TapZ = false;
            
            with (oBO)
            {
                if (x < 202)
                    other.j9 = true;
            }
            
            if (j9)
            {
                with (oBO)
                {
                    if (seed == "fightStick")
                    {
                        i--;
                        
                        if (i == -1)
                        {
                            other.j4--;
                            snd(snd_swipe);
                            i2 = 1;
                            
                            if (x == 93)
                                x -= 8;
                            
                            spawnEEF(x + 3, y + 17, sSymb, 3, "stickEnd,draw,ghostDie");
                            pepAn(i3, 3, "stop");
                            
                            repeat (3)
                                spawnEEF(oBUI.pPos[i3 * 2] + irandom_range(0, 16), oBUI.pPos[1 + (i3 * 2)] + irandom_range(-5, 5), sEEF_star2, 0, "walkRight,ghostDie,scale2");
                            
                            with (instance_create_depth(0, 0, 0, oBO))
                            {
                                seed = "fightDamage";
                                i3 = other.i3;
                                i4 = other.i4;
                                
                                if (other.x == 85)
                                    i4 = oBUI.pDamage[i3];
                                else
                                    i4 -= 10;
                            }
                        }
                    }
                }
            }
        }
    }
}

if (inf_act == "act1")
{
    if (ty == 1)
        oneText(g_st("b_check"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
}

if (inf_act == "actSusieHelp")
{
    if (ty == 1)
    {
        oBUI.susieStuckPoints++;
        
        if (oBUI.susieStuckPoints == 1)
            do_text([30], [382], g_t("b_susieSnap1"), ["mono", "bc", "ago"], undefined, undefined, [snd_txtral], undefined, undefined, [12, 12]);
        
        if (oBUI.susieStuckPoints == 2)
            do_text([30], [382], g_t("b_susieSnap2"), ["mono", "bc", "ago"], undefined, undefined, [snd_txtral], undefined, undefined, [32, 62, 63]);
        
        if (oBUI.susieStuckPoints == 3)
        {
            do_text([30], [382], g_t("b_susieSnap3"), ["mono", "bc", "ago", "privilegeCskip"], undefined, undefined, [snd_txtral, snd_txtral, snd_txtral, snd_txtSus, snd_txtral, snd_txtSus, snd_txtSus], undefined, undefined, [32, 64, 15, 65, 56, 18, 48], [-1, -1, -1, -1, -1, function()
            {
                op.twait = 60;
            }, -1], function()
            {
                oBUI.susieStuck = false;
                oBUI.actions[1][3] = 7;
            });
        }
        
        oBUI.actions[0][3] = 7;
        oBUI.actions[2][3] = 7;
        pepAn(2, 4, "stop");
    }
}

if (inf_act == "actAlone")
{
    if (ty == 1)
    {
        oBUI.autoAnimatePep = false;
        pepAn(0, 0, "stop", sKris_Pray);
        oneText(g_st("b_w2"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
        spareEne(0, 5 + op.custom_sparePower);
        
        if (op.challengeMode)
            spareEne(0, 2);
    }
}

if (inf_act == "actAll")
{
    if (ty == 1)
    {
        i1 = g_t("b_w1");
        i2 = i1[0];
        i3 = "";
        i3 = i1[4];
        
        if (oEnemie.inf_spareP < 50)
            i3 = i1[3];
        
        if (oEnemie.inf_spareP < 25)
            i3 = i1[2];
        
        if (oEnemie.inf_spareP < 12)
            i3 = i1[1];
        
        i2 += i3;
        
        if (irandom_range(1, 10) == 1)
            i2 = g_st("b_w3");
        
        oneText(i2, 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
        
        if (oEnemie.inf_spareP < 89)
        {
            spareEne(0, 11 + op.custom_sparePower);
            
            if (op.challengeMode)
                spareEne(0, 3);
        }
        
        oBUI.autoAnimatePep = false;
        pepAn(0, 0, "stop", sKris_Pray);
        pepAn(1, 0, "stop", sSusie_Pray);
        pepAn(2, 0, "stop", sRalsei_Pray);
        squashHand(1, 3, 0.02, [sHand_EyeClose, sHand_EyeCloseM]);
    }
}

if (inf_act == "rudeBuster")
{
    if (ty == 1)
        oneText(g_st("b_rudeBuster"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "keysOff");
    
    if (ty == 20)
        pepAn(inf_from, 0, "stop", sSusie_Rude);
    
    if (ty == 30)
    {
        snd(snd_rudebusterSwing);
        spawnEEF(200, 160, sRude, 0, "spawnRude");
    }
    
    if (ty == 50)
        pepAn(inf_from, 2, "idle");
    
    if (ty == 90)
    {
        oAActor.go = true;
        des(oText);
        des(0);
    }
}

if (inf_act == "ultimatHeal")
{
    if (ty == 1)
        oneText(g_st("b_ultimateHeal"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
    
    if (ty == 20)
        healPep(inf_too, 17);
    
    if (ty == 40)
        pepAn(inf_from, 2, "idle");
}

if (inf_act == "modifyS")
{
    if (ty == 1)
    {
        snd(snd_cardrive);
        oBUI.susieAddon = 3;
        res_i();
        i1 = g_t("s_2");
        
        if (op.gamepad == 0)
            oneText(g_st("b_gp") + i1[0] + "[" + keysText2(op.keys[0][1]) + "]" + i1[1], 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
        
        if (op.gamepad != 0)
            oneText(g_st("b_gp") + i1[0] + op.gp2 + i1[1], 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
        
        oBUI.autoAnimatePep = false;
        pepAn(1, 0, "stop", sSusie_Pray);
    }
}

if (inf_act == "pacify")
{
    if (ty == 1)
        oneText(g_st("b_pacify"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
    
    if (ty == 20)
        damageEne(inf_too, inf_from, 0);
    
    if (ty == 40)
        pepAn(inf_from, 2, "idle");
}

if (inf_act == "healPrayer")
{
    if (ty == 1)
        oneText(g_st("b_healPrayer"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
    
    if (ty == 20)
        healPep(inf_too, 95);
    
    if (ty == 40)
        pepAn(inf_from, 2, "idle");
}

if (inf_act == "modifyR")
{
    if (ty == 1)
    {
        snd(snd_cardrive);
        oBUI.ralseiAddon = 3;
        oneText(g_st("b_dj"), 30, 382, sFont1, 16777215, snd_txtMonster, undefined, "ago");
        oBUI.autoAnimatePep = false;
        pepAn(2, 0, "stop", sRalsei_Pray);
    }
}
