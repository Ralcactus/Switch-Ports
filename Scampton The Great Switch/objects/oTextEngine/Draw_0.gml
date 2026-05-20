Tyme += 1;
instance_destroy(oTextBrick);

if (StringAT == 0.5 && string_length(Text[0] == 1))
{
    oAlways.KeyZ = false;
    oAlways.Ztyme = 2;
}

scrTextSpez();

if (Font == sFont_Det || Font == sFont_DW)
    FontSpace = 8;

if (Font == sFont_Sma)
    FontSpace = 9;

if (Font == sFont_HP)
    FontSpace = 4;

if (Bubble_Xscale[0] != 0)
{
    if (Bubble_Arrow[AtText] < 3)
        BBxWithScale = Bubble_Xscale[AtText] * 20;
    
    BByWithScale = Bubble_Yscale[AtText] * 10;
    draw_sprite_ext(sBubble, 0, StartX - 4 - 5 - BBxWithScale, StartY - 3 - 7 - BByWithScale, Bubble_Xscale[AtText], 0.5 + (Bubble_Yscale[AtText] * 1.1), 0, c_white, 1);
    
    if (Bubble_Arrow[AtText] == 1 || Bubble_Arrow[AtText] == 2)
        draw_sprite_ext(sBubble, Bubble_Arrow[AtText], StartX - 9, StartY - 13, 1, 1, 0, c_white, 1);
    
    if (Bubble_Arrow[AtText] == 3 || Bubble_Arrow[AtText] == 4)
        draw_sprite_ext(sBubble, Bubble_Arrow[AtText], StartX - 29 - BBxWithScale, StartY - 13, 1, 1, 0, c_white, 1);
}

if (StringContains(Seed, "(TB)"))
{
    draw_sprite_ext(sTextHud, round(oP.Tyme / 20), 320, 478, 2, 2, 0, c_white, 1);
    StartX = 58;
    StartY = 348;
}

if (StringAT < 2 && Man)
    oSpamtonRig.AnMode = AnMan[AtText];

StringAT += TextSpeed;

if (StringAT > string_length(Text[AtText]) || Cur != 0)
    StringAT = string_length(Text[AtText]);

TexCounter = 0;
BumpX += ((0 - BumpX) / 5);
BumpY += ((0 - BumpY) / 5);
x = (StartX - BBxWithScale) + BumpX;
y = (StartY - BByWithScale) + BumpY;

if (Cur2 != 0)
{
    RGB = rgb(255, 255, 255);
    
    if (Cur2 == oAlways.MM_Cursor)
    {
        if (room == rIntro)
            RGB = rgb(255, 242, 0);
        else
            draw_sprite_ext(sTextHeads, 0, x - 24, y, 1, 1, 0, c_white, 1);
    }
}

if (oAlways.KeyX && Spez3 != "NUHKEY")
    StringAT = string_length(Text[AtText]);

if (FaceT[AtText] != "x")
{
    x += 120;
    draw_sprite_ext(sBoxFace, FaceT[AtText], 110, 400, 2, 2, 0, c_white, 1);
}

while (TexCounter < round(StringAT))
{
    TexCounter += 1;
    
    if (Spez3 == "Papu" && AtText == 14)
    {
        if (TexCounter >= 22 && TexCounter <= 30)
        {
            Font = 188;
            FontSpace = 12;
            Mono = true;
        }
        else
        {
            Font = sFont_Det;
            FontSpace = 8;
            Mono = false;
        }
    }
    
    CurrentLetter = string_char_at(Text[AtText], TexCounter);
    BetCount = 1;
    image_index = 0;
    
    if (CurrentLetter != " " && CurrentLetter != "_" && CurrentLetter != "@" && CurrentLetter != "£" && CurrentLetter != "€")
    {
        while (string_char_at(BET, BetCount) != CurrentLetter)
        {
            image_index += 1;
            BetCount += 1;
        }
        
        if ((Uppercase || (UppercaseNumb != 0 && UppercaseNumb <= TexCounter)) && (image_index > 26 && image_index < 53))
            image_index -= 26;
        
        if (BC)
        {
            if (col == "w" || col == "b")
                col = make_color_rgb(10, 10, 105);
            
            if (col == "y")
                col = make_color_rgb(76, 76, 0);
            
            if (col == "r")
                col = make_color_rgb(76, 0, 0);
            
            if (Spez3 == "BlackBC")
                draw_sprite_ext(Font, image_index, x + 1, y + 1, image_xscale, image_yscale, 0, c_black, AlphaT);
            else if (Spez3 == "Black2Back")
                draw_sprite_ext(Font, image_index, x + 2, y + 2, image_xscale, image_yscale, 0, c_black, AlphaT);
            else
                draw_sprite_ext(Font, image_index, x + 1, y + 1, image_xscale, image_yscale, 0, col, AlphaT);
        }
        
        if (Seed == "DW_Sha")
        {
            draw_sprite_ext(Font, image_index, x + 2, y, image_xscale, image_yscale, 0, c_black, AlphaT);
            draw_sprite_ext(Font, image_index, x, y + 2, image_xscale, image_yscale, 0, c_black, AlphaT);
            draw_sprite_ext(Font, image_index, x + 2, y + 2, image_xscale, image_yscale, 0, c_black, AlphaT);
        }
        
        if (Cur != 0)
        {
            if (Cur == oAlways.MM_Cursor)
                RGB = make_color_rgb(255, 242, 0);
            else
                RGB = make_color_rgb(255, 255, 255);
        }
        
        draw_sprite_ext(Font, image_index, x, y, image_xscale, image_yscale, 0, RGB, AlphaT);
    }
    
    if (CurrentLetter == "_")
    {
        if (string_char_at(Text[AtText], TexCounter + 1) == "i")
        {
            if (string_char_at(Text[AtText], TexCounter + 2) == "s")
                draw_sprite_ext(sTextHeads, 1, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "r")
                draw_sprite_ext(sTextHeads, 2, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "a")
                draw_sprite_ext(sTextHeads, 9, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "0")
                draw_sprite_ext(sTextHeads, 3, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "1")
                draw_sprite_ext(sTextHeads, 4, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "2")
                draw_sprite_ext(sTextHeads, 5, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "3")
                draw_sprite_ext(sTextHeads, 6, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "4")
                draw_sprite_ext(sTextHeads, 7, x, y, 1, 1, 0, c_white, 1);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "5")
                draw_sprite_ext(sTextHeads, 8, x, y, 1, 1, 0, RGB, 1);
            
            x += (14 * image_xscale);
        }
        
        if (string_char_at(Text[AtText], TexCounter + 1) == "c")
        {
            col = string_char_at(Text[AtText], TexCounter + 2);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "w")
                RGB = make_color_rgb(255, 255, 255);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "y")
                RGB = make_color_rgb(255, 242, 0);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "b")
                RGB = make_color_rgb(0, 0, 255);
            
            if (string_char_at(Text[AtText], TexCounter + 2) == "r")
                RGB = make_color_rgb(255, 0, 0);
            
            x -= (FontSpace * image_xscale);
        }
        
        if (string_char_at(Text[AtText], round(StringAT)) == "_")
            StringAT += 2;
        
        TexCounter += 2;
    }
    
    if (Mono)
    {
        with (instance_create_depth(x, y, 0, oTextBrick))
        {
            sprite_index = other.Font;
            image_index = other.image_index;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
        }
        
        image_index = 0;
        
        while (place_meeting(x, y, oTextBrick) || place_meeting(x, y - 1, oTextBrick) || place_meeting(x, y + 1, oTextBrick) || place_meeting(x, y - 2, oTextBrick) || place_meeting(x, y + 2, oTextBrick) || place_meeting(x, y - 3, oTextBrick) || place_meeting(x, y + 3, oTextBrick) || place_meeting(x, y - 4, oTextBrick) || place_meeting(x, y + 4, oTextBrick) || place_meeting(x, y - 5, oTextBrick) || place_meeting(x, y + 5, oTextBrick) || place_meeting(x, y - 6, oTextBrick) || place_meeting(x, y + 6, oTextBrick) || place_meeting(x, y - 7, oTextBrick) || place_meeting(x, y + 7, oTextBrick) || place_meeting(x, y - 8, oTextBrick) || place_meeting(x, y + 8, oTextBrick) || place_meeting(x, y - 9, oTextBrick) || place_meeting(x, y + 9, oTextBrick) || place_meeting(x, y - 10, oTextBrick) || place_meeting(x, y + 10, oTextBrick) || place_meeting(x, y - 11, oTextBrick) || place_meeting(x, y + 11, oTextBrick) || place_meeting(x, y - 12, oTextBrick) || place_meeting(x, y + 12, oTextBrick))
            x += 1;
        
        x += image_xscale;
        instance_destroy(oTextBrick);
    }
    else if (CurrentLetter != "€")
    {
        x += (FontSpace * image_xscale);
    }
    
    if (CurrentLetter == "@")
    {
        x = (StartX - BBxWithScale) + (FontSpace * 2 * image_xscale);
        
        if (Font == sFont_Det)
        {
            y += 30;
            
            if (StringContains(Seed, "(TB)"))
                y += 4;
        }
        
        if (Font == sFont_Sma)
        {
            y += 22;
            x = StartX - BBxWithScale;
        }
        
        if (FaceT[AtText] != "x")
            x += 120;
    }
    
    if (CurrentLetter == "£")
    {
        x = StartX - BBxWithScale;
        y += 30;
        
        if (StringContains(Seed, "(TB)"))
            y += 4;
        
        if (FaceT[AtText] != "x")
            x += 120;
    }
}

if (AllowKeys && Spez != "ADDR")
{
    if ((JustText || StringContains(Seed, "(TB)") || Seed == "TBub" || Seed == "FixCCtyme") && (StringAT == string_length(Text[AtText]) || (oAlways.KeyC && Tyme > 1)))
    {
        if ((oAlways.KeyZ && oAlways.Ztyme == 1) || StringContains(SkipLine, "(" + string(AtText) + ")") || (oAlways.KeyC && Tyme > 1))
        {
            if (Spez == "TheDiceText4")
            {
                instance_create_depth(0, 0, 0, oDice2);
                
                with (instance_create_depth(30, 382, -9999, oTextEngine))
                {
                    JustText = true;
                    Text[0] = "* Press [Z] to stop the dice.";
                    AllowKeys = false;
                    Spez = "DiceHelp";
                }
            }
            
            if (Spez == "TheDiceText2")
            {
                DicePep = iRan(0, 2);
                Dice = iRan(1, 6) + iRan(1, 6);
                
                with (instance_create_depth(0, 0, 0, oDice))
                {
                    D1 = other.Dice;
                    D2 = other.DicePep;
                }
                
                QQ = 1;
                DiceAllText();
            }
            
            if (Spez != "TheDiceText2")
            {
                with (oDice)
                    ja = true;
            }
            
            StringAT = 1;
            AtText += 1;
            
            if (Spez == "BIR" && AtText == 1)
            {
                if (Spez2 == "BIRD")
                {
                    scrNumber(425, 175, 272, make_color_rgb(255, 255, 255), "-", 4, 1);
                    oMakeUI.Spare -= 4;
                }
                else
                {
                    scrNumber(425, 175, 272, make_color_rgb(255, 255, 255), "-", 2, 1);
                    oMakeUI.Spare -= 2;
                }
            }
            
            if (oAlways.KeyC && Tyme > 1)
                Tyme = 0;
        }
        
        if (StringContains(Seed, "(TB)") || Seed == "TBub" || Seed == "FixCCtyme" || Spez == "BoxAfter")
        {
            if (AtText == array_length(Text))
            {
                if (Seed == "FixCCtyme")
                    oAlways.StopCCtyme = false;
                
                oAlways.Mesg = EndMesg;
                
                if (Spez == "BoxAfter")
                {
                    instance_create_depth(-50, -50, -2800, oDarkCov);
                    instance_create_depth(oMakeUI.Box_X, oMakeUI.Box_Y, oMakeUI.Box_Depth, oBox);
                    
                    with (instance_create_depth(80, 300, -9999, oSoul))
                        Seed = "Glide";
                    
                    with (instance_create_depth(0, 0, -9999, oEEF))
                        Seed = "SoulOutSpawner";
                }
                
                instance_destroy();
            }
        }
        
        if (JustText && !StringContains(Seed, "(TB)"))
        {
            if (AtText == array_length(Text) && oMakeUI.Stage == "ACTIONS")
            {
                if (Seed == "EndAction")
                {
                    oActionSET.Stop = true;
                }
                else if (oMakeUI.Spare >= 100 || oMakeUI.SpamtonHP <= 0)
                {
                    with (instance_create_depth(0, 0, 0, oCC2))
                        Seed = "BattleEnd";
                    
                    des(0);
                }
                else
                {
                    oActionSET.ActionFound = false;
                }
                
                if (StringContains(Seed, "(TB)"))
                    oAlways.Mesg = EndMesg;
                
                instance_destroy();
            }
        }
    }
}

if (Spez == "ADDR" && oAlways.KeyZ && oAlways.Ztyme == 1 && StringAT == string_length(Text[AtText]))
{
    oMakeUI._Last = true;
    oSoul.image_alpha = 0;
    scrEndPattern();
    instance_destroy();
}

if (Voice != 0 && (round(StringAT / 2) * 2) == StringAT && StringAT != string_length(Text[AtText]) && CurrentLetter != "€" && !StringContains(Seed, "Voicer"))
    sou(Voice);

if (StringContains(Seed, "Voicer") && (round(StringAT / 2) * 2) == StringAT && StringAT != string_length(Text[AtText]) && CurrentLetter != "€")
    sou(_Voice[AtText]);
