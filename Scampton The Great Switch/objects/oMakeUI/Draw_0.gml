draw_sprite(sPepBT, Party[PartyTurn] - 1, ((array_length(Party) - 3) * -106) + HUDx + (PartyTurn * 213), HUDy + 294);
draw_sprite(sPepFAISD, FAISD[PartyTurn] - 1, ((array_length(Party) - 3) * -106) + HUDx + (PartyTurn * 213), HUDy + 294);
PartyCount = 0;

with (oTextEngine)
{
    if (Spez == "HP_Text")
        instance_destroy();
}

while (PartyCount != array_length(Party))
{
    PartyCount += 1;
    MinusBox = 1;
    
    if ((PartyTurn + 1) == PartyCount && !PartyDone)
        MinusBox = 2;
    
    draw_sprite(sPepHud, (2 * Party[PartyCount - 1]) - MinusBox, ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), HUDy + 294 + A_MoveBoxUI[PartyCount - 1]);
    
    with (instance_create_depth(180 + ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), HUDy + 300 + A_MoveBoxUI[PartyCount - 1], -4000, oTextEngine))
    {
        Text[0] = other.MaxHP[other.PartyCount - 1];
        Font = sFont_HP;
        StringAT = 9;
        Spez = "HP_Text";
        BC = false;
        
        if (other.HP[other.PartyCount - 1] < 31)
            RGB = make_color_rgb(255, 242, 0);
        
        if (other.HP[other.PartyCount - 1] < 1)
            RGB = make_color_rgb(255, 0, 0);
    }
    
    with (instance_create_depth(((string_length(string(HP[PartyCount - 1])) - 3) * -8) + 135 + ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), HUDy + 300 + A_MoveBoxUI[PartyCount - 1], -4000, oTextEngine))
    {
        Text[0] = other.HP[other.PartyCount - 1];
        Font = sFont_HP;
        StringAT = 9;
        Spez = "HP_Text";
        BC = false;
        
        if (other.HP[other.PartyCount - 1] < 31)
            RGB = make_color_rgb(255, 242, 0);
        
        if (other.HP[other.PartyCount - 1] < 1)
            RGB = make_color_rgb(255, 0, 0);
    }
    
    ScaleHP = 76 * (1 - (HP[PartyCount - 1] / MaxHP[PartyCount - 1]));
    
    if (ScaleHP > 76)
        ScaleHP = 76;
    
    draw_sprite_ext(sRedHP, 0, 204 + ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), HUDy + 315 + A_MoveBoxUI[PartyCount - 1], ScaleHP, 1, 0, c_white, 1);
    FaceS = Face[PartyCount - 1];
    
    if (Actions[PartyCount - 1] != 0)
    {
        FaceS = Face[PartyCount - 1] + FAISD[PartyCount - 1] + 1;
        
        if (Actions[PartyCount - 1] == "2_6_S_Mag1" || Actions[PartyCount - 1] == "2_6_S_Mag2")
            FaceS = 11;
        
        if (Actions[PartyCount - 1] == "3_6_S_Mag1" || Actions[PartyCount - 1] == "3_6_S_Mag2")
            FaceS = 19;
    }
    
    draw_sprite_ext(sFaces, FaceS, 25 + ((array_length(Party) - 3) * -115) + HUDx + ((PartyCount - 1) * 213), HUDy + 315 + A_MoveBoxUI[PartyCount - 1], 1, 1, 0, c_white, 1);
    StatWalk = 0;
    
    if (Stat[PartyCount - 1] > 0)
    {
        DrawOutline(267, PartyCount - 1, (20 * StatWalk) + 50 + ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), (sin((oP.Tyme + (StatWalk * 5)) * 0.1) * 2) + HUDy + 294 + A_MoveBoxUI[PartyCount - 1], 1, 1, 0, 16777215, 1);
        StatWalk += 1;
    }
    
    if (Stat[3 + (PartyCount - 1)] > 0)
    {
        DrawOutline(267, 3 + (PartyCount - 1), (20 * StatWalk) + 50 + ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), (sin((oP.Tyme + (StatWalk * 5)) * 0.1) * 2) + HUDy + 294 + A_MoveBoxUI[PartyCount - 1], 1, 1, 0, 16777215, 1);
        StatWalk += 1;
    }
    
    if (Stat[6 + (PartyCount - 1)] > 0)
    {
        DrawOutline(267, 6 + (PartyCount - 1), (20 * StatWalk) + 50 + ((array_length(Party) - 3) * -106) + HUDx + ((PartyCount - 1) * 213), (sin((oP.Tyme + (StatWalk * 5)) * 0.1) * 2) + HUDy + 294 + A_MoveBoxUI[PartyCount - 1], 1, 1, 0, 16777215, 1);
        StatWalk += 1;
    }
}

draw_sprite(sBigBox, 0, 0, HUDy + 362);

if (!PartyDone)
{
    if (PartyTurn == 0 && (FAISD[PartyTurn] - 1) == 5)
        draw_sprite(sPepText, 6, ((array_length(Party) - 3) * -106) + HUDx + (PartyTurn * 213), HUDy + 294);
    else
        draw_sprite(sPepText, FAISD[PartyTurn] - 1, ((array_length(Party) - 3) * -106) + HUDx + (PartyTurn * 213), HUDy + 294);
}

if (Cursor == "Heal_1" || Cursor == "Heal_2" || Cursor == "Heal_3" || Cursor == "Heal_Item_1" || Cursor == "Heal_Item_2" || Cursor == "Heal_Item_3")
{
    draw_sprite_ext(sHealHP, 0, 400, 380, 100, 1, 0, c_white, 1);
    draw_sprite_ext(sHealHP, 0, 400, 410, 100, 1, 0, c_white, 1);
    draw_sprite_ext(sHealHP, 0, 400, 440, 100, 1, 0, c_white, 1);
    draw_sprite_ext(sHealHP, 1, 400, 380, (100 * HP[0]) / MaxHP[0], 1, 0, c_white, 1);
    draw_sprite_ext(sHealHP, 1, 400, 410, (100 * HP[1]) / MaxHP[1], 1, 0, c_white, 1);
    draw_sprite_ext(sHealHP, 1, 400, 440, (100 * HP[2]) / MaxHP[2], 1, 0, c_white, 1);
}

with (oTextEngine)
{
    if (Spez == "SpamUItext")
        instance_destroy();
}

if (!PartyDone)
{
    if ((Cursor == "NAME" || Cursor == "ActMag") && (ActMag != "S_Mag1" && ActMag != "S_Mag2"))
    {
        draw_sprite_ext(sHealHP, 0, 420, 380, 80, 1, 0, c_white, 1);
        draw_sprite_ext(sHealHP, 1, 420, 380, (80 * SpamtonHP) / SpamtonMaxHP, 1, 0, c_white, 1);
        
        with (instance_create_depth(424, 367, -9999, oTextEngine))
        {
            Spez = "SpamUItext";
            image_yscale = 1;
            Text[0] = "HP";
            StringAT = 999;
            BC = false;
            Mono = true;
        }
        
        with (instance_create_depth(424, 383, -9999, oTextEngine))
        {
            Spez = "SpamUItext";
            image_yscale = 1;
            Text[0] = string(round((100 * other.SpamtonHP) / other.SpamtonMaxHP)) + "%";
            StringAT = 999;
            BC = false;
            Mono = true;
        }
    }
    
    if (Cursor == "NAME" || Cursor == "ActMag")
    {
        draw_sprite_ext(sHealHP, 2, 520, 380, 80, 1, 0, c_white, 1);
        draw_sprite_ext(sHealHP, 3, 520, 380, (80 * Spare) / 100, 1, 0, c_white, 1);
        
        with (instance_create_depth(524, 367, -9999, oTextEngine))
        {
            Spez = "SpamUItext";
            image_yscale = 1;
            Text[0] = "MERCY";
            StringAT = 999;
            BC = false;
            Mono = true;
        }
        
        with (instance_create_depth(524, 383, -9999, oTextEngine))
        {
            Spez = "SpamUItext";
            image_yscale = 1;
            Text[0] = string(other.Spare) + "%";
            StringAT = 999;
            BC = false;
            Mono = true;
            RGB = make_color_rgb(128, 0, 0);
        }
    }
    
    if (FlavourMake != 0 && HUDy == 0)
    {
        with (oTextEngine)
        {
            if (Spez == "BottomText")
                instance_destroy();
        }
        
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            if (other.FlavourMake == 2)
                StringAT = 999;
            
            Spez = "BottomText";
            Voice = 0;
            
            if (oMakeUI.BoxFlav == 1)
                Text[0] = "* Let the games begin!";
            
            if (oMakeUI.BoxFlav == 2)
                Text[0] = "* Press [Z] to parry blue attacks!";
            
            if (oMakeUI.BoxFlav == 3)
                Text[0] = "* It's an armageddon!";
            
            if (oMakeUI.BoxFlav == 4)
                Text[0] = "* Scampton's jaw is clattering.";
            
            if (oMakeUI.BoxFlav == 5)
                Text[0] = "* Smells like clown makeup.£* Spoiler alert:€€€€€€ it's you.";
            
            if (oMakeUI.BoxFlav == 6)
                Text[0] = "* For some wacky reason.€€€€€€€€€.€€€€€€€€€.€€€€€€€€€£* Scampton wants to eat a Big Burger!";
            
            if (oMakeUI.BoxFlav == 7)
                Text[0] = "* Scampton is doing an@armed ska dance.";
            
            if (oMakeUI.BoxFlav == 8)
                Text[0] = "* The air screams with memories.";
            
            if (oMakeUI.BoxFlav == 9)
                Text[0] = "* Scampton says something@miserable and depressing.";
            
            if (oMakeUI.BoxFlav == 10)
                Text[0] = "* The sunlight is shattered.";
            
            if (oMakeUI.AnVil)
            {
                Text[0] = "* Time for the grand finale!";
            }
            else if (oMakeUI.BoxFlav != 1 && oMakeUI.BoxFlav != 2)
            {
                if (iRan(1, 100) == 1)
                    Text[0] = "* Scampton let the bird out the cage.€€€€€€@Dancing...€€€€€€ Shopping...";
            }
        }
        
        FlavourMake = 0;
    }
    
    if (Cursor != 1 && Cursor != 2 && Cursor != 3 && Cursor != 4 && Cursor != 5 && Cursor != 6)
    {
        FlavourMake = 2;
        
        with (oTextEngine)
        {
            if (Spez == "BottomText")
                instance_destroy();
        }
    }
    
    if (Cursor == "NAME" || Cursor == "ActMag" || Cursor == "TheNameGo")
    {
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            Text[0] = "        Scampton";
            StringAT = 999;
            BC = false;
            Mono = true;
            Spez = "BottomText";
        }
        
        if (ActMag == "S_Mag1" || ActMag == "S_Mag2")
        {
            with (instance_create_depth(350, 382, -9999, oTextEngine))
            {
                StringAT = 999;
                BC = false;
                Mono = true;
                Spez = "BottomText";
                
                if (other.ActMag == "S_Mag1" && other.Party[other.PartyTurn] == 2)
                {
                    Text[0] = "Pull";
                    RGB = make_color_rgb(255, 128, 255);
                }
                
                if (other.ActMag == "S_Mag1" && other.Party[other.PartyTurn] == 3)
                {
                    Text[0] = "Pull";
                    RGB = make_color_rgb(128, 255, 128);
                }
                
                if (other.ActMag == "S_Mag2" && other.Party[other.PartyTurn] == 2)
                {
                    Text[0] = "MultiShot";
                    RGB = make_color_rgb(255, 128, 255);
                }
                
                if (other.ActMag == "S_Mag2" && other.Party[other.PartyTurn] == 3)
                {
                    Text[0] = "PointyGuard";
                    RGB = make_color_rgb(128, 255, 128);
                }
            }
        }
    }
    
    if (Cursor == "A_1" || Cursor == "A_2" || Cursor == "A_3" || Cursor == "A_4" || Cursor == "A_5" || Cursor == "A_6")
    {
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            Spez = "BottomText";
            Text[0] = other.Skills[0];
            StringAT = 999;
            BC = false;
            Mono = true;
            TPmakeRGB(0, rgb(222, 180, 237), 0);
        }
        
        with (instance_create_depth(260, 382, -9999, oTextEngine))
        {
            Spez = "BottomText";
            Text[0] = other.Skills[1];
            StringAT = 999;
            BC = false;
            Mono = true;
            TPmakeRGB(25, rgb(222, 180, 237), rgb(127.5, 127.5, 127.5));
        }
        
        with (instance_create_depth(30, 412, -9999, oTextEngine))
        {
            Spez = "BottomText";
            Text[0] = other.Skills[2];
            StringAT = 999;
            BC = false;
            Mono = true;
            TPmakeRGB(50, rgb(222, 180, 237), rgb(127.5, 127.5, 127.5));
            
            if (other.HP[0] < 1 || other.HP[1] < 1 || other.HP[2] < 1)
                RGB = make_color_rgb(127.5, 127.5, 127.5);
        }
        
        with (instance_create_depth(260, 412, -9999, oTextEngine))
        {
            Spez = "BottomText";
            Text[0] = other.Skills[3];
            StringAT = 999;
            BC = false;
            Mono = true;
            TPmakeRGB(36, rgb(222, 180, 237), rgb(127.5, 127.5, 127.5));
        }
    }
    
    if (Cursor == "N_1" || Cursor == "N_2" || Cursor == "N_3" || Cursor == "N_4" || Cursor == "N_5" || Cursor == "N_6")
    {
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[6];
            TPmakeRGB(32, rgb(255, 255, 255), rgb(127.5, 127.5, 127.5));
        }
        
        with (instance_create_depth(260, 382, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[7];
            TPmakeRGB(40, rgb(255, 255, 255), rgb(127.5, 127.5, 127.5));
        }
        
        with (instance_create_depth(30, 412, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[8];
            TPmakeRGB(32, rgb(255, 255, 255), rgb(127.5, 127.5, 127.5));
        }
        
        with (instance_create_depth(260, 412, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[9];
        }
    }
    
    if (Cursor == "H_1" || Cursor == "H_2" || Cursor == "H_3" || Cursor == "H_4" || Cursor == "H_5" || Cursor == "H_6")
    {
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[12];
            TPmakeRGB(16, rgb(255, 255, 255), rgb(127.5, 127.5, 127.5));
        }
        
        with (instance_create_depth(260, 382, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[13];
        }
        
        with (instance_create_depth(30, 412, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[14];
            TPmakeRGB(16, rgb(255, 255, 255), rgb(127.5, 127.5, 127.5));
        }
        
        with (instance_create_depth(260, 412, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[15];
        }
        
        if (oP.NoHit == "Disabled")
        {
            with (instance_create_depth(30, 442, -9999, oTextEngine))
            {
                Spez = "BottomText";
                StringAT = 999;
                BC = false;
                Mono = true;
                Text[0] = other.Skills[16];
                TPmakeRGB(32, rgb(255, 255, 255), rgb(127.5, 127.5, 127.5));
            }
        }
        
        with (instance_create_depth(260, 442, -9999, oTextEngine))
        {
            Spez = "BottomText";
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = other.Skills[17];
        }
        
        if (oP.NoHit == "Enabled")
            draw_sprite_ext(sSC, 0, 118, 456, 2, 2, 0, c_white, 1);
    }
    
    if (Cursor == "Heal_1" || Cursor == "Heal_2" || Cursor == "Heal_3" || Cursor == "Heal_Item_1" || Cursor == "Heal_Item_2" || Cursor == "Heal_Item_3")
    {
        with (instance_create_depth(30, 382, -9999, oTextEngine))
        {
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = "        Asriel";
            Spez = "BottomText";
        }
        
        with (instance_create_depth(30, 412, -9999, oTextEngine))
        {
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = "        Noelle";
            Spez = "BottomText";
        }
        
        with (instance_create_depth(30, 442, -9999, oTextEngine))
        {
            StringAT = 999;
            BC = false;
            Mono = true;
            Text[0] = "        Charkis";
            Spez = "BottomText";
        }
    }
    
    if (FAISD[PartyTurn] == 3 && Cursor != 3 && Cursor != "Heal_Item_1" && Cursor != "Heal_Item_2" && Cursor != "Heal_Item_3")
    {
        if (ItemSel < 7)
        {
            if (array_length(Items) > 0)
            {
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    Text[0] = other.Items[0];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 1)
            {
                with (instance_create_depth(260, 382, -9999, oTextEngine))
                {
                    Text[0] = other.Items[1];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 2)
            {
                with (instance_create_depth(30, 412, -9999, oTextEngine))
                {
                    Text[0] = other.Items[2];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 3)
            {
                with (instance_create_depth(260, 412, -9999, oTextEngine))
                {
                    Text[0] = other.Items[3];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 4)
            {
                with (instance_create_depth(30, 442, -9999, oTextEngine))
                {
                    Text[0] = other.Items[4];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 5)
            {
                with (instance_create_depth(260, 442, -9999, oTextEngine))
                {
                    Text[0] = other.Items[5];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
        }
        else
        {
            if (array_length(Items) > 6)
            {
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    Text[0] = other.Items[6];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 7)
            {
                with (instance_create_depth(260, 382, -9999, oTextEngine))
                {
                    Text[0] = other.Items[7];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 8)
            {
                with (instance_create_depth(30, 412, -9999, oTextEngine))
                {
                    Text[0] = other.Items[8];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 9)
            {
                with (instance_create_depth(260, 412, -9999, oTextEngine))
                {
                    Text[0] = other.Items[9];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 10)
            {
                with (instance_create_depth(30, 442, -9999, oTextEngine))
                {
                    Text[0] = other.Items[10];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
            
            if (array_length(Items) > 11)
            {
                with (instance_create_depth(260, 442, -9999, oTextEngine))
                {
                    Text[0] = other.Items[11];
                    StringAT = 999;
                    BC = false;
                    Mono = true;
                    Spez = "BottomText";
                }
            }
        }
    }
    
    if (Cursor == "NAME" || Cursor == "ActMag")
        draw_sprite(sTextHeads, 0, 50, 382);
    
    if (Cursor == "A_1" || Cursor == "N_1" || Cursor == "H_1")
        draw_sprite(sTextHeads, 0, 8, 382);
    
    if (Cursor == "A_2" || Cursor == "N_2" || Cursor == "H_2")
        draw_sprite(sTextHeads, 0, 238, 382);
    
    if (Cursor == "A_3" || Cursor == "N_3" || Cursor == "H_3")
        draw_sprite(sTextHeads, 0, 8, 412);
    
    if (Cursor == "A_4" || Cursor == "N_4" || Cursor == "H_4")
        draw_sprite(sTextHeads, 0, 238, 412);
    
    if (Cursor == "A_5" || Cursor == "N_5" || Cursor == "H_5")
        draw_sprite(sTextHeads, 0, 8, 442);
    
    if (Cursor == "A_6" || Cursor == "N_6" || Cursor == "H_6")
        draw_sprite(sTextHeads, 0, 238, 442);
    
    if (Cursor == "Heal_1" || Cursor == "Heal_Item_1")
        draw_sprite(sTextHeads, 0, 50, 382);
    
    if (Cursor == "Heal_2" || Cursor == "Heal_Item_2")
        draw_sprite(sTextHeads, 0, 50, 412);
    
    if (Cursor == "Heal_3" || Cursor == "Heal_Item_3")
        draw_sprite(sTextHeads, 0, 50, 442);
    
    if (FAISD[PartyTurn] == 3 && Cursor != 3 && Cursor != "Heal_Item_1" && Cursor != "Heal_Item_2" && Cursor != "Heal_Item_3")
    {
        if (ItemSel == 1 || ItemSel == 7)
            draw_sprite(sTextHeads, 0, 8, 382);
        
        if (ItemSel == 2 || ItemSel == 8)
            draw_sprite(sTextHeads, 0, 238, 382);
        
        if (ItemSel == 3 || ItemSel == 9)
            draw_sprite(sTextHeads, 0, 8, 412);
        
        if (ItemSel == 4 || ItemSel == 10)
            draw_sprite(sTextHeads, 0, 238, 412);
        
        if (ItemSel == 5 || ItemSel == 11)
            draw_sprite(sTextHeads, 0, 8, 442);
        
        if (ItemSel == 6 || ItemSel == 12)
            draw_sprite(sTextHeads, 0, 238, 442);
    }
    
    scrHelpText(2, "S_Mag2", "Multiple£shots", 32, 0);
    scrHelpText(2, "S_Mag3", "Rude£Damage", 50, 0);
    scrHelpText(2, "S_Mag4", "Best£Healing", 100, 0);
    scrHelpText(3, "S_Mag2", "Back£shield", 32, 0);
    scrHelpText(3, "S_Mag3", "Spare£TIRED foe", 16, 0);
    scrHelpText(3, "S_Mag4", "Heal£Ally", 32, 0);
    scrHelpText(1, "A_2", "Random£event", 25, 0);
    scrHelpText(1, "A_3", "Induce£spare", 50, 0);
    scrHelpText(1, "A_4", "Timing£event", 36, 0);
    scrHelpText(2, "N_1", "Heal£Ally", 32, 0);
    scrHelpText(2, "N_2", "Damage£w/ ICE", 40, 0);
    scrHelpText(2, "N_3", "Heal£Team", 32, 0);
    scrHelpText(3, "H_1", "Boosts£Defense", 16, 0);
    scrHelpText(3, "H_3", "Boosts£Attack", 16, 0);
    scrHelpText(3, "H_5", "Can't take£Damage", 32, 0);
    
    if (FAISD[PartyTurn] == 3 && Cursor != 3 && Cursor != "Heal_Item_1" && Cursor != "Heal_Item_2" && Cursor != "Heal_Item_3")
    {
        scrHelpText(0, 0, "Raises£TP£32%", 0, "TensionBit");
        scrHelpText(0, 0, "Heals£80 HP", 0, "CD Bagel");
        scrHelpText(0, 0, "Heals£Team£30HP", 0, "SpagettiCode");
        scrHelpText(0, 0, "Heal£Downed£Ally", 0, "ReviveMint");
        scrHelpText(0, 0, "Heals£100HP", 0, "ButJuice");
        scrHelpText(0, 0, "Pipis", 0, "BurntPipis");
        scrHelpText(0, 0, "Heals£5-30 HP", 0, "NerdSeed");
        scrHelpText(0, 0, "Heals£50 HP", 0, "CrystalCob");
        scrHelpText(0, 0, "Heals£Team£30HP", 0, "BrutchBrunch");
        scrHelpText(0, 0, "Heals£60HP", 0, "NerdDrumstick");
        scrHelpText(0, 0, "Heals£30HP", 0, "ScrabbledEggs");
        scrHelpText(0, 0, "Heals£70HP", 0, "BackGammon");
        scrHelpText(0, 0, "Healing£varies", 0, "AsrielBrew");
        scrHelpText(0, 0, "Healing£varies", 0, "NoelleBrew");
        scrHelpText(0, 0, "Healing£varies", 0, "CharkisBrew");
        
        if (array_length(Items) > 6)
        {
            if (ItemSel > 6)
                draw_sprite_ext(sArrow, 0, 470, 377 + round(sin(oAlways.Tyme * 0.1) * 3), 1, 1, 0, c_white, 1);
            else
                draw_sprite_ext(sArrow, 0, 470, 470 - round(sin(oAlways.Tyme * 0.1) * 3), 1, -1, 0, c_white, 1);
        }
    }
}
