Tyme += 1;

if (oP.NoHit == "Disabled" || oP.Deaths < 1)
{
    if (Tyme == 30)
    {
        audio_stop_sound(oAlways.BattleMusic);
        audio_play_sound(oAlways.BattleMusic, 100, true);
        audio_sound_pitch(oAlways.BattleMusic, 1);
    }
}

if (ResMemb)
{
    scrMemberRES();
    ResMemb = false;
}

if (Tyme < 100)
{
    if (HUDy != 0)
    {
        if (HUDy < 30)
            HUDy -= 5;
        else
            HUDy -= 10;
    }
}

KeyUP = keyboard_check(vk_up);

if (keyboard_check(ord("W")))
    KeyUP = true;

KeyDOWN = keyboard_check(vk_down);

if (keyboard_check(ord("S")))
    KeyDOWN = true;

KeyLEFT = keyboard_check(vk_left);

if (keyboard_check(ord("A")))
    KeyLEFT = true;

KeyRIGHT = keyboard_check(vk_right);

if (keyboard_check(ord("D")))
    KeyRIGHT = true;

KeyZ = keyboard_check(ord("Z"));

if (keyboard_check(vk_enter))
    KeyZ = true;

KeyX = keyboard_check(ord("X"));

if (keyboard_check(vk_shift))
    KeyX = true;

if (KeyUP)
    UPtyme += 1;
else
    UPtyme = 0;

if (KeyDOWN)
    DOWNtyme += 1;
else
    DOWNtyme = 0;

if (KeyLEFT)
    LEFTtyme += 1;
else
    LEFTtyme = 0;

if (KeyRIGHT)
    RIGHTtyme += 1;
else
    RIGHTtyme = 0;

if (KeyZ)
    Ztyme += 1;
else
    Ztyme = 0;

if (KeyX)
    Xtyme += 1;
else
    Xtyme = 0;

if (HUDy != 0)
{
    KeyZ = false;
    KeyX = false;
    Ztyme = 2;
    Xtyme = 2;
}

if (!PartyDone)
{
    with (oPep)
        glow = false;
    
    if (FAISD[PartyTurn] == 3 && Cursor != 3 && Cursor != "Heal_Item_1" && Cursor != "Heal_Item_2" && Cursor != "Heal_Item_3")
    {
        if (ItemSel > 2)
        {
            if (KeyUP && UPtyme == 1)
            {
                ItemSel -= 2;
                UPtyme = 2;
            }
        }
        
        if (ItemSel < (round(array_length(Items) / 2) * 2))
        {
            if (KeyDOWN && DOWNtyme == 1 && (ItemSel + 2) <= array_length(Items))
            {
                ItemSel += 2;
                DOWNtyme = 2;
            }
        }
        
        if (KeyDOWN && DOWNtyme == 1 && ItemSel == 6 && array_length(Items) == 7)
        {
            ItemSel += 1;
            DOWNtyme = 2;
        }
        
        if ((round(ItemSel / 2) * 2) == ItemSel)
        {
            if (KeyRIGHT && RIGHTtyme == 1)
            {
                ItemSel -= 1;
                RIGHTtyme = 2;
            }
            
            if (KeyLEFT && LEFTtyme == 1)
            {
                ItemSel -= 1;
                LEFTtyme = 2;
            }
        }
        else
        {
            if (KeyRIGHT && RIGHTtyme == 1 && ItemSel != array_length(Items))
            {
                ItemSel += 1;
                RIGHTtyme = 2;
            }
            
            if (KeyLEFT && LEFTtyme == 1 && ItemSel != array_length(Items))
            {
                ItemSel += 1;
                LEFTtyme = 2;
            }
        }
        
        MemberItem[PartyTurn] = ItemSel;
        
        if (Items[ItemSel - 1] == "TensionBit" || Items[ItemSel - 1] == "SpagettiCode" || Items[ItemSel - 1] == "BrutchBrunch")
            scrCursor(Cursor, 0, 0, 0, 0, "NEXTp", 3, 0, 0, 0, "A");
        else
            scrCursor(Cursor, 0, 0, 0, 0, MemberItemHeal[PartyTurn], 3, 0, 0, 0, "A");
    }
    
    if (Cursor == 3 && KeyZ && Ztyme == 1 && array_length(Items) != 0)
    {
        sou(101);
        Cursor = "Item";
        ItemSel = MemberItem[PartyTurn];
        
        while (ItemSel > array_length(Items))
            ItemSel -= 1;
        
        Ztyme = 2;
    }
    
    if (Party[PartyTurn] == 1)
    {
        scrCursor(1, 0, 0, 5, 6, "NAME", 0, 0, 0, 1, "");
        scrCursor(6, 0, 0, 1, 3, "NAME", 0, 0, 0, 1, "");
        scrCursor(3, 0, 0, 6, 4, 0, 0, 0, 0, 1, "");
        scrCursor(4, 0, 0, 3, 5, "NAME", 0, 0, 0, 1, "");
        scrCursor(5, 0, 0, 4, 1, "NEXTp", 0, 0, 0, 1, "");
    }
    
    if (Party[PartyTurn] == 2)
    {
        scrCursor(1, 0, 0, 5, 6, "NAME", 0, 0, 0, 1, "");
        scrCursor(6, 0, 0, 1, 3, MemberMagic[PartyTurn], 0, 0, 0, 1, "");
        scrCursor(3, 0, 0, 6, 4, 0, 0, 0, 0, 1, "");
        scrCursor(4, 0, 0, 3, 5, "NAME", 0, 0, 0, 1, "");
        scrCursor(5, 0, 0, 4, 1, "NEXTp", 0, 0, 0, 1, "");
    }
    
    if (Party[PartyTurn] == 3)
    {
        scrCursor(1, 0, 0, 5, 2, "NAME", 0, 0, 0, 1, "");
        scrCursor(2, 0, 0, 1, 3, MemberMagic[PartyTurn], 0, 0, 0, 1, "");
        scrCursor(3, 0, 0, 2, 4, 0, 0, 0, 0, 1, "");
        scrCursor(4, 0, 0, 3, 5, "NAME", 0, 0, 0, 1, "");
        scrCursor(5, 0, 0, 4, 1, "NEXTp", 0, 0, 0, 1, "");
    }
    
    scrCursor("NAME", 0, 0, 0, 0, 0, FAISD[PartyTurn], 0, 0, 0, "");
    
    if (Party[PartyTurn] == 1)
    {
        if (FAISD[PartyTurn] == 1)
            scrCursor("NAME", 0, 0, 0, 0, "NEXTp", 0, 0, 0, 0, "");
        
        if (FAISD[PartyTurn] == 4)
            scrCursor("NAME", 0, 0, 0, 0, "NEXTp", 0, 0, 0, 0, "");
        
        if (FAISD[PartyTurn] == 6)
            scrCursor("NAME", 0, 0, 0, 0, "A_1", 0, 0, 0, 0, "");
    }
    
    if (Party[PartyTurn] == 2)
    {
        if (FAISD[PartyTurn] == 1)
            scrCursor("NAME", 0, 0, 0, 0, "NEXTp", 0, 0, 0, 0, "");
        
        if (FAISD[PartyTurn] == 4)
            scrCursor("NAME", 0, 0, 0, 0, "NEXTp", 0, 0, 0, 0, "");
    }
    
    if (Party[PartyTurn] == 3)
    {
        if (FAISD[PartyTurn] == 1 || FAISD[PartyTurn] == 4)
            scrCursor("NAME", 0, 0, 0, 0, "NEXTp", 0, 0, 0, 0, "");
        
        if (FAISD[PartyTurn] == 2)
            scrCursor("NAME", 0, 0, 0, 0, MemberMagic[2], 0, 0, 0, 0, "");
    }
    
    scrCursor("A_1", "A_3", "A_3", "A_2", "A_2", "NEXTp", FAISD[PartyTurn], 0, 0, 0, "");
    scrCursor("A_2", "A_4", "A_4", "A_1", "A_1", "NEXTp", FAISD[PartyTurn], 25, 1, 0, "");
    
    if (HP[0] < 1 || HP[1] < 1 || HP[2] < 1)
        scrCursor("A_3", "A_1", "A_1", "A_4", "A_4", 0, FAISD[PartyTurn], 50, 1, 0, "");
    else
        scrCursor("A_3", "A_1", "A_1", "A_4", "A_4", "NEXTp", FAISD[PartyTurn], 50, 1, 0, "AllParty");
    
    scrCursor("A_4", "A_2", "A_2", "A_3", "A_3", "NEXTp", FAISD[PartyTurn], 36, 1, 0, "");
    scrCursor("N_1", "N_3", "N_3", "N_2", "N_2", MemberHeal[PartyTurn], FAISD[PartyTurn], 32, 1, 0, "");
    scrCursor("N_2", 0, 0, "N_1", "N_1", "ActMag", FAISD[PartyTurn], 40, 1, 0, "");
    scrCursor("N_3", "N_1", "N_1", 0, 0, "NEXTp", FAISD[PartyTurn], 32, 1, 0, "");
    
    if (oP.NoHit == "Disabled")
    {
        scrCursor("H_1", "H_5", "H_3", 0, 0, MemberHeal[PartyTurn], FAISD[PartyTurn], 16, 1, 0, "");
        scrCursor("H_3", "H_1", "H_5", 0, 0, MemberHeal[PartyTurn], FAISD[PartyTurn], 16, 1, 0, "");
        scrCursor("H_5", "H_3", "H_1", 0, 0, MemberHeal[PartyTurn], FAISD[PartyTurn], 32, 1, 0, "");
    }
    else
    {
        scrCursor("H_1", "H_3", "H_3", 0, 0, MemberHeal[PartyTurn], FAISD[PartyTurn], 16, 1, 0, "");
        scrCursor("H_3", "H_1", "H_1", 0, 0, MemberHeal[PartyTurn], FAISD[PartyTurn], 16, 1, 0, "");
    }
    
    scrCursor("CHECK", 0, "GroupWind", "Wind", "Wind", "NEXTp", FAISD[PartyTurn], 0, 0, 0, "");
    scrCursor("Wind", 0, 0, "CHECK", "CHECK", "NEXTp", FAISD[PartyTurn], 0, 0, 0, "");
    
    if (HP[0] < 1 || HP[1] < 1 || HP[2] < 1)
        scrCursor("GroupWind", "CHECK", 0, 0, 0, 0, FAISD[PartyTurn], 0, 0, 0, "");
    else
        scrCursor("GroupWind", "CHECK", 0, 0, 0, "NEXTp", FAISD[PartyTurn], 0, 0, 0, "");
    
    scrCursor("S_Mag1", 0, "S_Mag3", "S_Mag2", "S_Mag2", "ActMag", FAISD[PartyTurn], 0, 0, 0, "");
    scrCursor("S_Mag2", 0, "S_Mag4", "S_Mag1", "S_Mag1", "ActMag", FAISD[PartyTurn], 32, 0, 0, "");
    scrSR(50, 16);
    scrCursor("S_Mag3", "S_Mag1", 0, "S_Mag4", "S_Mag4", "ActMag", FAISD[PartyTurn], ReturnVal, 0, 0, "");
    scrSR(100, 32);
    scrCursor("S_Mag4", "S_Mag2", 0, "S_Mag3", "S_Mag3", MemberHeal[PartyTurn], FAISD[PartyTurn], ReturnVal, 0, 0, "");
    scrCursor("ActMag", 0, 0, 0, 0, "AM_NEXTp", ActMag, TPmemory, 1, 0, "");
    
    if (Cursor == "Heal_1" || Cursor == "Heal_Item_1")
        SelPep[PartyTurn] = 1;
    
    if (Cursor == "Heal_2" || Cursor == "Heal_Item_2")
        SelPep[PartyTurn] = 2;
    
    if (Cursor == "Heal_3" || Cursor == "Heal_Item_3")
        SelPep[PartyTurn] = 3;
    
    scrCursor("Heal_1", "Heal_3", "Heal_2", 0, 0, "NEXTp", MemberMagic[PartyTurn], TPmemory, 1, 1, "MemoryPick");
    scrCursor("Heal_2", "Heal_1", "Heal_3", 0, 0, "NEXTp", MemberMagic[PartyTurn], TPmemory, 1, 1, "MemoryPick");
    scrCursor("Heal_3", "Heal_2", "Heal_1", 0, 0, "NEXTp", MemberMagic[PartyTurn], TPmemory, 1, 1, "MemoryPick");
    scrCursor("Heal_Item_1", "Heal_Item_3", "Heal_Item_2", 0, 0, "NEXTp", "Item", 0, 0, 1, "");
    scrCursor("Heal_Item_2", "Heal_Item_1", "Heal_Item_3", 0, 0, "NEXTp", "Item", 0, 0, 1, "");
    scrCursor("Heal_Item_3", "Heal_Item_2", "Heal_Item_1", 0, 0, "NEXTp", "Item", 0, 0, 1, "");
    
    if (Cursor == 1 || Cursor == 2 || Cursor == 3 || Cursor == 4 || Cursor == 5 || Cursor == 6)
    {
        FAISD[PartyTurn] = Cursor;
        ActMag = 0;
    }
    
    if (Cursor == "Heal_Item_1" || Cursor == "Heal_Item_2" || Cursor == "Heal_Item_3")
        MemberItemHeal[PartyTurn] = Cursor;
    
    if (KeyX && Xtyme == 1 && PartyTurn != 0 && (Cursor == 1 || Cursor == 2 || Cursor == 3 || Cursor == 4 || Cursor == 5 || Cursor == 6))
    {
        with (oPep)
        {
            if (Pep == other.PartyTurn && oMakeUI.HP[Pep - 1] > 0)
            {
                image_speed = 1;
                sprite_index = ans[0];
            }
        }
        
        SavePartyTurn = PartyTurn;
        
        for (PartyTurn -= 1; HP[PartyTurn] < 1 && !(PartyTurn == 0 && HP[0] < 1); PartyTurn -= 1)
        {
            with (oPep)
            {
                if (Pep == other.PartyTurn && oMakeUI.HP[Pep - 1] > 0)
                {
                    image_speed = 1;
                    sprite_index = ans[0];
                }
            }
        }
        
        if (PartyTurn == 0 && HP[0] < 1)
        {
            PartyTurn = SavePartyTurn;
        }
        else
        {
            sou(39);
            Cursor = FAISD[PartyTurn];
            Actions[PartyTurn] = 0;
            oTP.TP = MemberTP[PartyTurn];
            
            if (FAISD[PartyTurn] == 3)
                array_insert(Items, WillItemNumb[PartyTurn], WillItem[PartyTurn]);
        }
        
        if (!(WillItem[PartyTurn] == "TensionBit" && FAISD[PartyTurn] == 3))
        {
            if (Party[PartyTurn] == 1 && FAISD[PartyTurn] != 4)
            {
                oKris.sprite_index = sKris_Idle;
                oKris.image_speed = 1;
                oKris.image_index = 0;
            }
            
            if (Party[PartyTurn] == 2 && FAISD[PartyTurn] != 4)
            {
                oSusie.sprite_index = sSusie_Idle;
                oSusie.image_speed = 1;
                oSusie.image_index = 0;
            }
            
            if (Party[PartyTurn] == 3 && FAISD[PartyTurn] != 4)
            {
                oRalsei.sprite_index = sRalsei_Idle;
                oRalsei.image_speed = 1;
                oRalsei.image_index = 0;
            }
        }
    }
    
    if (Cursor != "ActMag")
    {
        if (Cursor == "Heal_1" || Cursor == "Heal_2" || Cursor == "Heal_3")
            MemberHeal[PartyTurn] = Cursor;
        else if ((FAISD[PartyTurn] == 6 && Cursor != 6) || (FAISD[PartyTurn] == 2 && Cursor != 2))
            MemberMagic[PartyTurn] = Cursor;
    }
    
    if (Cursor == "Heal_1" || Cursor == "Heal_Item_1")
    {
        with (oPep)
        {
            if (Pep == 1)
                glow = true;
        }
    }
    
    if (Cursor == "Heal_2" || Cursor == "Heal_Item_2")
    {
        with (oPep)
        {
            if (Pep == 2)
                glow = true;
        }
    }
    
    if (Cursor == "Heal_3" || Cursor == "Heal_Item_3")
    {
        with (oPep)
        {
            if (Pep == 3)
                glow = true;
        }
    }
}

PartyCount = 0;

while (PartyCount != array_length(Party))
{
    PartyCount += 1;
    
    if ((PartyCount - 1) == PartyTurn && !PartyDone)
    {
        if (A_MoveBoxUI[PartyCount - 1] > 20)
            A_MoveBoxUI[PartyCount - 1] -= 5;
        else
            A_MoveBoxUI[PartyCount - 1] -= 2;
        
        if (A_MoveBoxUI[PartyCount - 1] < 0)
            A_MoveBoxUI[PartyCount - 1] = 0;
    }
    else
    {
        A_MoveBoxUI[PartyCount - 1] += 10;
        
        if (A_MoveBoxUI[PartyCount - 1] > 32)
            A_MoveBoxUI[PartyCount - 1] = 32;
    }
}

DelTP = 0;

if ((Cursor == "A_1" || Cursor == "A_2" || Cursor == "A_3" || Cursor == "A_4" || Cursor == "A_5" || Cursor == "A_6") || (Cursor == "N_1" || Cursor == "N_2" || Cursor == "N_3" || Cursor == "N_4" || Cursor == "N_5" || Cursor == "N_6") || (Cursor == "H_1" || Cursor == "H_2" || Cursor == "H_3" || Cursor == "H_4" || Cursor == "H_5" || Cursor == "H_6"))
    DelTP = SaveDelTP;

if (Cursor == 1 || Cursor == 2 || Cursor == 3 || Cursor == 4 || Cursor == 5 || Cursor == 6)
{
    DelTP = 0;
    WillItem[PartyTurn] = 0;
}

if (Cursor != "NAME" && Cursor != "ActMag" && Cursor != "Heal_1" && Cursor != "Heal_2" && Cursor != "Heal_3" && Cursor != "Heal_Item_1" && Cursor != "Heal_Item_2" && Cursor != "Heal_Item_3" && Cursor != "CHECK" && Cursor != "Wind" && Cursor != "GroupWind")
    oAlways.TymeGlow = 0;

if (Cursor == "NAME" || Cursor == "ActMag" || Cursor == "CHECK" || Cursor == "Wind" || Cursor == "GroupWind")
    oSpamtonRig.White = sin(oAlways.TymeGlow * 0.1) * 0.5;

if (Cursor == "Heal_1" || Cursor == "Heal_Item_1")
    oKris.White = sin(oAlways.TymeGlow * 0.1) * 0.5;

if (Cursor == "Heal_2" || Cursor == "Heal_Item_2")
    oSusie.White = sin(oAlways.TymeGlow * 0.1) * 0.5;

if (Cursor == "Heal_3" || Cursor == "Heal_Item_3")
    oRalsei.White = sin(oAlways.TymeGlow * 0.1) * 0.5;
