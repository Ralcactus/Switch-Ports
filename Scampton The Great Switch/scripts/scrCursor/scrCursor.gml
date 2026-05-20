function scrCursor(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
    if (arg0 == Cursor)
    {
        SaveDelTP = arg7;
        
        if (KeyUP && UPtyme == 1 && arg1 != 0)
        {
            Cursor = arg1;
            UPtyme = 2;
            
            if (arg9 != 0)
                sou(oP.Csound);
        }
        
        if (KeyDOWN && DOWNtyme == 1 && arg2 != 0)
        {
            Cursor = arg2;
            DOWNtyme = 2;
            
            if (arg9 != 0)
                sou(oP.Csound);
        }
        
        if (KeyLEFT && LEFTtyme == 1 && arg3 != 0)
        {
            Cursor = arg3;
            LEFTtyme = 2;
            
            if (arg9 != 0)
                sou(oP.Csound);
        }
        
        if (KeyRIGHT && RIGHTtyme == 1 && arg4 != 0)
        {
            Cursor = arg4;
            RIGHTtyme = 2;
            
            if (arg9 != 0)
                sou(oP.Csound);
        }
        
        if ((KeyZ && Ztyme == 1 && arg5 != 0 && arg5 != "NEXTp" && arg5 != "AM_NEXTp") && oTP.TP >= arg7)
        {
            TPmemory = arg7;
            sou(snd_select);
            
            if (arg5 == "ActMag")
                ActMag = Cursor;
            
            Cursor = arg5;
            Ztyme = 2;
        }
        
        if (KeyX && Xtyme == 1 && arg6 != 0)
        {
            Cursor = arg6;
            Xtyme = 2;
            sou(oP.Csound);
        }
        
        if ((KeyZ && Ztyme == 1) && (arg5 == "NEXTp" || arg5 == "AM_NEXTp") && oTP.TP >= arg7)
        {
            Ztyme = 2;
            DidAM = ActMag;
            ActMag = 0;
            sou(snd_select);
            
            with (oPep)
            {
                if (Pep == (other.PartyTurn + 1))
                {
                    image_speed = 0;
                    sprite_index = ans[other.FAISD[other.PartyTurn]];
                    image_index = 0;
                    
                    if (other.FAISD[other.PartyTurn] == 5 || other.FAISD[other.PartyTurn] == 6)
                        image_speed = 1;
                }
            }
            
            if (arg5 == "NEXTp")
            {
                Actions[PartyTurn] = string(Party[PartyTurn]) + "_" + string(FAISD[PartyTurn]) + "_" + string(Cursor);
                
                if (StringContains(arg10, "MemoryPick"))
                    Actions[PartyTurn] = string(Party[PartyTurn]) + "_" + string(FAISD[PartyTurn]) + "_" + string(MemberMagic[PartyTurn]);
                
                if (FAISD[PartyTurn] == 3 && Cursor != 3)
                {
                    if (Items[ItemSel - 1] == "TensionBit")
                    {
                        oTP.TP += 32;
                        sou(69);
                        
                        if (PartyTurn == 0)
                        {
                            oKris.Glow = true;
                            scrEEF("TP", 100, 100);
                        }
                        
                        if (PartyTurn == 1)
                        {
                            oSusie.Glow = true;
                            scrEEF("TP", 115, 185);
                        }
                        
                        if (PartyTurn == 2)
                        {
                            oRalsei.Glow = true;
                            scrEEF("TP", 115, 270);
                        }
                    }
                    
                    WillItem[PartyTurn] = Items[ItemSel - 1];
                    array_delete(Items, ItemSel - 1, 1);
                    WillItemNumb[PartyTurn] = ItemSel - 1;
                }
                
                if (FAISD[PartyTurn] == 5)
                    oTP.TP += 8;
                
                if (oTP.TP > 100)
                    oTP.TP = 100;
            }
            
            if (arg5 == "AM_NEXTp")
                Actions[PartyTurn] = string(Party[PartyTurn]) + "_" + string(FAISD[PartyTurn]) + "_" + string(DidAM);
            
            if (arg8 != 0)
                oTP.TP -= SaveDelTP;
            
            if (WillItem[PartyTurn] != "TensionBit")
            {
                if (Party[PartyTurn] == 1)
                {
                    if (FAISD[PartyTurn] != 4)
                    {
                        oKris.image_index = 0;
                        oKris.image_speed = 1;
                    }
                    
                    if (FAISD[PartyTurn] == 1)
                        oKris.sprite_index = sKris_Fight_P;
                    
                    if (FAISD[PartyTurn] == 2)
                        oKris.sprite_index = sKris_Act_P;
                    
                    if (FAISD[PartyTurn] == 3)
                        oKris.sprite_index = sKris_Item_P;
                    
                    if (FAISD[PartyTurn] == 5)
                        oKris.sprite_index = sKris_Defend_P;
                }
                
                if (Party[PartyTurn] == 2)
                {
                    if (FAISD[PartyTurn] != 4)
                    {
                        oSusie.image_index = 0;
                        oSusie.image_speed = 1;
                    }
                    
                    if (FAISD[PartyTurn] == 1)
                        oSusie.sprite_index = sSusie_Fight_P;
                    
                    if (FAISD[PartyTurn] == 6)
                    {
                        oSusie.sprite_index = sSusie_Act_P;
                        
                        if (DidAM == "S_Mag3" || DidAM == "S_Mag4" || Cursor == "Heal_1" || Cursor == "Heal_2" || Cursor == "Heal_3")
                            oSusie.sprite_index = sSusie_Mag_P;
                    }
                    
                    if (FAISD[PartyTurn] == 3)
                        oSusie.sprite_index = sSusie_Item_P;
                    
                    if (FAISD[PartyTurn] == 5)
                        oSusie.sprite_index = sSusie_Defend_P;
                }
                
                if (Party[PartyTurn] == 3)
                {
                    if (FAISD[PartyTurn] != 4)
                    {
                        oRalsei.image_index = 0;
                        oRalsei.image_speed = 1;
                    }
                    
                    if (FAISD[PartyTurn] == 1)
                        oRalsei.sprite_index = sRalsei_Fight_P;
                    
                    if (FAISD[PartyTurn] == 6)
                    {
                        if (DidAM == "S_Mag3" || DidAM == "S_Mag4" || Cursor == "Heal_1" || Cursor == "Heal_2" || Cursor == "Heal_3")
                            oRalsei.sprite_index = sRalsei_Mag_P;
                    }
                    
                    if (FAISD[PartyTurn] == 3)
                        oRalsei.sprite_index = sRalsei_Item_P;
                    
                    if (FAISD[PartyTurn] == 5)
                        oRalsei.sprite_index = sRalsei_Defend_P;
                }
            }
            
            PartyTurn += 1;
            
            while (HP[PartyTurn] < 1 && PartyTurn != array_length(Party))
                PartyTurn += 1;
            
            MemberTP[PartyTurn] = oTP.TP;
            
            if (arg0 == "GroupWind" || StringContains(arg10, "AllParty"))
            {
                with (oPep)
                    sprite_index = ans[4];
                
                PartyTurn = 3;
                Actions[0] = "PA2";
                Actions[1] = "PA2";
                Actions[2] = "PA2";
                FAISD[1] = 2;
                FAISD[2] = 2;
                oSusie.image_index = 0;
                oSusie.image_speed = 1;
                oSusie.sprite_index = sSusie_Act;
                oRalsei.image_index = 0;
                oRalsei.image_speed = 1;
                oRalsei.sprite_index = sRalsei_Act;
            }
            
            if (PartyTurn == array_length(Party))
            {
                PartyTurn -= 1;
                PartyDone = true;
                Cursor = "PartyDone";
                Stage = "ACTIONS";
                
                with (oTextEngine)
                {
                    if (Spez == "BottomText")
                        instance_destroy();
                }
                
                instance_create_depth(0, 0, 0, oActionSET);
            }
            else
            {
                Cursor = FAISD[PartyTurn];
            }
        }
    }
}
