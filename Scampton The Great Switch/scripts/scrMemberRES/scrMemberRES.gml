function scrMemberRES()
{
    oTP.ExtraX = 0;
    PartyDone = false;
    Stage = "MENU";
    Cursor = 1;
    oMakeUI.HurtMode = 0;
    oMakeUI.DamageMode = 0;
    scrFillArray();
    MemberMagic[0] = "A_1";
    MemberMagic[1] = "N_1";
    MemberMagic[2] = "H_1";
    MemberHeal[0] = 0;
    MemberHeal[1] = "Heal_1";
    MemberHeal[2] = "Heal_1";
    MemberItem[0] = 1;
    MemberItem[1] = 1;
    MemberItem[2] = 1;
    MemberItemHeal[0] = "Heal_Item_1";
    MemberItemHeal[1] = "Heal_Item_1";
    MemberItemHeal[2] = "Heal_Item_1";
    ActMag = 0;
    ItemSel = 1;
    
    if (Stat[0] != 0)
        Stat[0] -= 1;
    
    if (Stat[1] != 0)
        Stat[1] -= 1;
    
    if (Stat[2] != 0)
        Stat[2] -= 1;
    
    if (Stat[3] != 0)
        Stat[3] -= 1;
    
    if (Stat[4] != 0)
        Stat[4] -= 1;
    
    if (Stat[5] != 0)
        Stat[5] -= 1;
    
    if (Stat[6] != 0)
        Stat[6] -= 1;
    
    if (Stat[7] != 0)
        Stat[7] -= 1;
    
    if (Stat[8] != 0)
        Stat[8] -= 1;
    
    A_MoveBoxUI[0] = 32;
    A_MoveBoxUI[1] = 32;
    A_MoveBoxUI[2] = 32;
    FlavourMake = 1;
    
    if (!oMakeUI._Last)
    {
        if (HP[0] < 1 || HP[1] < 1 || HP[2] < 1)
            sou(105);
        
        if (HP[0] < 1)
        {
            HP[0] += 15;
            
            if (HP[0] >= 0)
            {
                HP[0] += 20;
                scrNumber(45, 285, 288, make_color_rgb(0, 255, 0), "UP", "#", 0);
            }
            else
            {
                scrNumber(45, 285, 288, make_color_rgb(0, 255, 0), 0, 15, 0);
            }
        }
        
        if (HP[1] < 1)
        {
            HP[1] += 18;
            
            if (HP[1] >= 0)
            {
                HP[1] += 20;
                scrNumber(260, 285, 288, make_color_rgb(0, 255, 0), "UP", "#", 0);
            }
            else
            {
                scrNumber(260, 285, 288, make_color_rgb(0, 255, 0), 0, 18, 0);
            }
        }
        
        if (HP[2] < 1)
        {
            HP[2] += 13;
            
            if (HP[2] >= 0)
            {
                HP[2] += 20;
                scrNumber(475, 285, 288, make_color_rgb(0, 255, 0), "UP", "#", 0);
            }
            else
            {
                scrNumber(475, 285, 288, make_color_rgb(0, 255, 0), 0, 13, 0);
            }
        }
    }
    
    with (oPep)
    {
        if (other.HP[Pep - 1] > 0)
            sprite_index = ans[0];
    }
    
    if (HP[0] > 0)
    {
        oKris.sprite_index = sKris_Idle;
        oKris.image_speed = 1;
        oKris.image_index = 0;
    }
    
    if (HP[1] > 0)
    {
        oSusie.sprite_index = sSusie_Idle;
        oSusie.image_speed = 1;
        oSusie.image_index = 0;
    }
    
    if (HP[2] > 0)
    {
        oRalsei.sprite_index = sRalsei_Idle;
        oRalsei.image_speed = 1;
        oRalsei.image_index = 0;
    }
    
    if (oMakeUI._Last && oMakeUI.EndSong)
    {
        oMakeUI.EndSong = false;
        audio_play_sound(TS_End, -999, true);
    }
    
    if (oMakeUI.End == "B")
    {
        oMakeUI.Actions[0] = 0;
        oMakeUI.Actions[1] = "FF";
        oMakeUI.Actions[2] = 0;
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
    
    PartyTurn = 0;
    
    while (HP[PartyTurn] < 1)
        PartyTurn += 1;
    
    MemberTP[PartyTurn] = oTP.TP;
}
