ti += pi;
patternTime++;
time++;

if (playSnd1 != -1)
{
    snd(playSnd1);
    playSnd1 = -1;
}

if (playSnd2 != -1)
{
    snd(playSnd2);
    playSnd2 = -1;
}

if (op.challengeMode || array_length(op.party) != 3)
    oBUI.susieStuck = false;

if (array_length(op.party) == 3 && op.party[1] != "susie")
    oBUI.susieStuck = false;

if (!op.custom_susieScared)
    oBUI.susieStuck = false;

if (oBUI.susieStuck)
{
    actions[1] = ["spare", 1, 0, 2, 0, 0];
    
    if (op.hp[1] <= 0)
        actions[1] = [0, 0, 0, 0, 0, 0];
}

op.susieStuck = oBUI.susieStuck;

if (op.itemsON[0] == 1)
    ralseiAddon = 3;

if (op.itemsON[1] == 1)
    susieAddon = 3;

if (!op.susieStuck && fogFadeOn)
{
    if (oDrawBackground.fogAlpha < 1)
        oDrawBackground.fogAlpha += 0.016666666666666666;
    else
        fogFadeOn = false;
}

if (fogFadeOn2)
{
    if (attack == "final")
    {
        fogFadeOn = false;
        
        if (oDrawBackground.fogAlpha > 0)
            oDrawBackground.fogAlpha -= 1/15;
        else
            fogFadeOn2 = false;
    }
}

if (introON)
{
    move_UI -= 20;
    move_TP -= 5;
    
    if (move_UI == 0)
    {
        introON = false;
        
        if (page == "s" && stage == 0)
        {
            with (oEnemie)
            {
                if (numb == other.eneFlavour)
                {
                    flavourAt++;
                    
                    if (array_contains(oBUI.battleProgress, "breather"))
                        _flavour[flavourAt] = g_st("b_flavourText2");
                    
                    oneText(_flavour[flavourAt], 30, 382, sFont1, 16777215, 0, ["mono,bc"], "keysOff,boxFlavour");
                }
            }
        }
    }
}

if (comeBack)
{
    comeBack = false;
    fallenStars = 0;
    damageTimes = 1;
    oEnemie.drawL = 0;
    soulFloorCap = 325;
    soulFloorBounce = 11;
    
    if (array_contains(battleProgress, "L3"))
    {
        if (TP > 49)
            TP = 49;
    }
    
    eneFlavour++;
    
    if (eneFlavour == array_length(tot_enemies))
        eneFlavour = 0;
    
    eneFlavour = 0;
    
    with (oEnemie)
    {
        if (numb == other.eneFlavour)
        {
            flavourAt++;
            
            if (flavourAt == array_length(_flavour))
                flavourAt = 2;
            
            if (array_contains(oBUI.battleProgress, "breather"))
                _flavour[flavourAt] = g_st("b_flavourText2");
            
            oneText(_flavour[flavourAt], 30, 382, sFont1, 16777215, 0, ["mono,bc"], "keysOff,boxFlavour");
        }
    }
    
    res_i();
    
    repeat (array_length(op.party))
    {
        if (op.hp[i] < 1)
        {
            healPep(i, healUp[i]);
            
            if (op.hp[i] > -1)
                op.hp[i] = irandom_range(20, 35);
            
            if (op.hp[i] > op.MAXhp[i])
                op.hp[i] = op.MAXhp[i];
        }
        
        if (oBUI.extraDEF[i] > 0)
            oBUI.extraDEF[i]--;
        
        i++;
    }
    
    res_keys();
    cur = 0;
    page = "s";
    pep = 0;
    stage = 0;
    
    while (stage == 0 && (op.hp[pep] < 1 || (oBUI.susieStuck && pep == 1)))
    {
        pep++;
        
        if (pep >= array_length(op.party))
        {
            pep--;
            stage = 1;
            instance_create_depth(0, 0, 0, oAActor);
        }
    }
    
    undo_tree = 0;
    undo_tree[0] = 0;
    array_delete(undo_tree, 0, 1);
    pepBack = 0;
    pepBack[0] = 0;
    array_delete(pepBack, 0, 1);
    actions = 0;
    AAsave = "Skip";
    itemDel = 0;
    res_i();
    
    repeat (array_length(op.party))
    {
        actions[i][0] = 0;
        actions[i][1] = 0;
        actions[i][2] = 0;
        actions[i][3] = 0;
        actions[i][4] = 0;
        actions[i][5] = 0;
        pm_faim[i] = 0;
        pm_names[i] = 0;
        pm_peps[i] = 0;
        pm_act[i] = 0;
        pm_item[i] = 0;
        upP[i] = 0;
        upE[i] = 0;
        
        if (op.hp[i] > 0)
            pepAn(i, 2, "idle");
        
        i++;
    }
    
    res_i();
    
    if (op.alexMode)
    {
        alexTimerTrack -= irandom_range(1, 2);
        alexTimerTrack = clamp(alexTimerTrack, 10, 999);
    }
    else
    {
        alexTimerTrack = clamp(alexTimerTrack, 20, 999);
    }
}

res_i();

repeat (3)
{
    lines[i] *= 1.1;
    
    if (lines[i] > 30)
        lines[i] = 1;
    
    i++;
}

res_i();
use_keys();

if (move_UI != 0)
    res_keys();

if (stage != 0)
{
    res_keys();
}
else
{
    op.highSS = -1;
    oEnemie.depth = 0;
    oEnemie.eX += (0 - oEnemie.eX) / 10;
    oEnemie.eY += (0 - oEnemie.eY) / 10;
    deathTimerAlpha = lerp(deathTimerAlpha, 0, 0.5);
}

if (TapZ)
{
    if (TP >= TPremove)
        snd(snd_select);
    
    undo_tree[array_length(undo_tree)] = cur;
    undo_tree[array_length(undo_tree)] = page;
}

if (TapX && array_length(undo_tree) != 0)
{
    TapZ = false;
    TapX = false;
    snd(snd_menumove);
    cur = undo_tree[array_length(undo_tree) - 2];
    page = undo_tree[array_length(undo_tree) - 1];
    array_delete(undo_tree, array_length(undo_tree) - 2, 2);
    
    if (array_length(undo_tree) == 0)
        pepAn(pep, 2, "idle");
}

if (page == "s" && stage == 0)
{
    TPremove = 0;
    setAction(0, 0);
    setAction(1, 0);
    setAction(2, 0);
    setAction(3, 0);
    setAction(4, 0);
    setAction(5, 0);
    textExists = false;
    
    with (oText)
    {
        if (arrayContains(obj_seed, "boxFlavour"))
            other.textExists = true;
    }
    
    if (move_UI != 0)
        textExists = true;
    
    if (!textExists)
    {
        with (oEnemie)
        {
            if (numb == other.eneFlavour)
            {
                if (flavourAt > -1)
                    oneText(_flavour[flavourAt], 30, 382, sFont1, 16777215, 0, ["mono,bc"], "keysOff,boxFlavour,done");
            }
        }
    }
    
    get_stats(op.party[pep]);
    
    if (TapLEFT)
    {
        snd(snd_menumove);
        TapLEFT = false;
        cur--;
        
        if (cur == -1)
            cur = array_length(jamOptions) - 1;
    }
    
    if (TapRIGHT)
    {
        snd(snd_menumove);
        TapRIGHT = false;
        cur++;
        
        if (cur == array_length(jamOptions))
            cur = 0;
    }
    
    pm_faim[pep] = cur;
    
    if (TapZ && cur == 0)
    {
        TapZ = false;
        TapX = false;
        setAction(0, "fight");
        setAction(3, 4);
        page = "names";
        cur = pm_names[pep];
    }
    
    if (TapZ && cur == 1)
    {
        TapZ = false;
        TapX = false;
        get_stats(op.party[pep]);
        
        if (arrayContains(jamSeed, "opt_ACT"))
        {
            setAction(3, 0);
            setAction(0, "act");
            page = "names";
            cur = pm_names[pep];
        }
        
        if (arrayContains(jamSeed, "opt_MAG"))
        {
            setAction(3, 3);
            setAction(0, "act");
            page = "act";
            cur = pm_act[pep];
            cur = 0;
        }
    }
    
    if (TapZ && cur == 2)
    {
        TapZ = false;
        TapX = false;
        
        if (array_length(op.item) == 0)
        {
            array_delete(undo_tree, array_length(undo_tree) - 2, 2);
        }
        else
        {
            setAction(0, "item");
            setAction(3, 1);
            page = "item";
            cur = pm_item[pep];
        }
    }
    
    if (TapZ && cur == 3)
    {
        TapZ = false;
        TapX = false;
        setAction(0, "spare");
        setAction(3, 2);
        page = "names";
        cur = pm_names[pep];
    }
    
    if (TapZ && cur == 4)
    {
        TapZ = false;
        TapX = false;
        setAction(0, "defend");
        setAction(3, 5);
        nextPep();
        TP += 16;
    }
    
    if (TapX && array_length(pepBack) != 0)
    {
        TapX = false;
        snd(snd_menumove);
        pep = pepBack[array_length(pepBack) - 1];
        TP = pastTP[pep];
        array_delete(pepBack, array_length(pepBack) - 1, 1);
        cur = pm_faim[pep];
        pepAn(pep, 2, "idle");
        
        if (actions[pep][3] == 1)
            array_insert(op.item, actions[pep][5], actions[pep][4]);
    }
}

if (!(page == "s" && stage == 0))
{
    with (oText)
    {
        if (arrayContains(obj_seed, "boxFlavour"))
            des(0);
    }
}

if (page == "names" || page == "names_AA" || page == "names_EP")
{
    if (TapUP)
    {
        TapUP = false;
        cur--;
        
        if (cur < 0)
            cur = array_length(tot_enemies) - 1;
    }
    
    if (TapDOWN)
    {
        TapDOWN = false;
        cur++;
        
        if (cur > (array_length(tot_enemies) - 1))
            cur = 0;
    }
    
    pm_names[pep] = cur;
    
    if (TapZ && (actions[pep][0] == "fight" || actions[pep][0] == "spare"))
    {
        TapZ = false;
        TapX = false;
        setAction(1, pep);
        setAction(2, cur);
        nextPep();
    }
    
    if (page == "names")
    {
        if (TapZ && actions[pep][0] == "act")
        {
            TapZ = false;
            TapX = false;
            setAction(1, pep);
            setAction(2, cur);
            page = "act";
            cur = pm_act[pep];
            cur = 0;
        }
    }
    
    if (page == "names_AA")
    {
        if (TapZ)
        {
            TapZ = false;
            TapX = false;
            setAction(1, pep);
            setAction(2, cur);
            setAction(3, 0);
            nextPep();
        }
    }
    
    if (page == "names_EP")
    {
        if (TapZ)
        {
            TapZ = false;
            TapX = false;
            setAction(1, pep);
            setAction(2, cur);
            nextPep();
        }
    }
}

if (page == "names_PP")
{
    if (TapUP)
    {
        TapUP = false;
        cur--;
        
        if (cur < 0)
            cur = array_length(op.party) - 1;
    }
    
    if (TapDOWN)
    {
        TapDOWN = false;
        cur++;
        
        if (cur > (array_length(op.party) - 1))
            cur = 0;
    }
    
    pm_peps[pep] = cur;
    
    if (TapZ)
    {
        TapZ = false;
        TapX = false;
        
        if (actions[pep][3] == 1)
        {
            setAction(5, itemDel);
            array_delete(op.item, itemDel, 1);
        }
        
        setAction(1, pep);
        setAction(2, cur);
        nextPep();
    }
}

if (page == "act")
{
    get_enemieStats(tot_enemies[actions[pep][2]]);
    
    if (TapUP)
    {
        TapUP = false;
        cur -= 2;
    }
    
    if (TapDOWN)
    {
        TapDOWN = false;
        cur += 2;
    }
    
    if (TapLEFT)
    {
        TapLEFT = false;
        cur--;
    }
    
    if (TapRIGHT)
    {
        TapRIGHT = false;
        cur++;
    }
    
    cur = clamp(cur, 0, array_length(jam_movesStore) - 1);
    pm_act[pep] = cur;
    get_moves(jam_movesStore[cur]);
    AAsave = jam[0];
    TPremove = jam[3];
    
    if (TapZ)
    {
        TapZ = false;
        TapX = false;
        
        if (TP >= TPremove && (!arrayContains(jamSeed, "SA") || (arrayContains(jamSeed, "SA") && ((arrayContains(jamSeed, "needsEveryone") && op.hp[0] > 0 && op.hp[1] > 0 && op.hp[2] > 0) || (arrayContains(jamSeed, "needsNotSusie") && op.hp[0] > 0 && op.hp[2] > 0)))))
        {
            setAction(0, port_info);
            
            if (arrayContains(jamSeed, "NP"))
                nextPep();
            
            if (arrayContains(jamSeed, "SA"))
            {
                pep = array_length(op.party) - 1;
                nextPep();
            }
            else
            {
                array_delete(undo_tree, array_length(undo_tree) - 2, 2);
            }
            
            if (arrayContains(jamSeed, "AA"))
            {
                page = "names_AA";
                cur = pm_names[pep];
            }
            
            if (arrayContains(jamSeed, "EP"))
            {
                page = "names_EP";
                cur = pm_names[pep];
            }
            
            if (arrayContains(jamSeed, "PP"))
            {
                page = "names_PP";
                cur = pm_peps[pep];
            }
        }
        else
        {
            array_delete(undo_tree, array_length(undo_tree) - 2, 2);
        }
    }
}

if (page == "item")
{
    setAction(4, 0);
    itemDel = 0;
    
    if (TapUP)
    {
        TapUP = false;
        cur -= 2;
    }
    
    if (TapDOWN)
    {
        TapDOWN = false;
        
        if (array_length(op.item) == 7 && cur == 5)
            cur = 6;
        else
            cur += 2;
    }
    
    if (TapLEFT)
    {
        TapLEFT = false;
        cur--;
    }
    
    if (TapRIGHT)
    {
        TapRIGHT = false;
        cur++;
    }
    
    if (cur < 0)
        cur = array_length(op.item) - 1;
    
    if (cur > (array_length(op.item) - 1))
        cur = 0;
    
    pm_item[pep] = cur;
    
    if (TapZ)
    {
        TapZ = false;
        TapX = false;
        setAction(4, op.item[cur]);
        itemDel = cur;
        get_items(op.item[cur]);
        
        if (arrayContains(jamSeed, "eatOne"))
        {
            page = "names_PP";
            cur = pm_peps[pep];
        }
        
        if (arrayContains(jamSeed, "eatAll"))
        {
            setAction(1, pep);
            setAction(5, itemDel);
            array_delete(op.item, itemDel, 1);
            nextPep();
        }
    }
}
