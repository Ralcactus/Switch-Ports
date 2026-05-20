if (sp == 0)
{
    font_fixer();
    voiceTy = 0;
    rowCount = 0;
    
    if (use_font[in] == sFont1 || use_font[in] == sFont1_rus)
    {
        letters_allow = 33;
        
        if (op.face[in] != -1)
            letters_allow -= 7;
    }
    
    if (use_font[in] == sFontPapyrus)
        letters_allow = 21;
    
    if (use_font[in] == sFontPapyrus_rus)
        letters_allow = 20;
    
    if (use_font[in] == sFontSans || use_font[in] == sFontSans_rus)
        letters_allow = 25;
    
    if (use_font[in] == sFontSock || use_font[in] == sFontSock_rus)
    {
        letters_allow = 27;
        
        if (array_contains(obj_seed, "shop"))
            letters_allow = 30;
        
        if (array_contains(obj_seed, "shopSide1"))
            letters_allow = 18;
        
        if (array_contains(obj_seed, "shopSide2"))
            letters_allow = 10;
        
        if (op.face[in] != -1)
            letters_allow -= 6;
    }
    
    if (array_contains(obj_seed, "la_-1") && op.language == 1)
        letters_allow -= 1;
    
    if (room == rBattle)
        letters_allow += 4;
    
    if (array_length(op.face) == 0)
    {
        repeat (30)
            array_push(op.face, -1);
    }
    
    if (use_function[in] != -1)
        use_function[in]();
    
    split = string_split(use_text[in], " ");
    useText = "";
    useLnegth = 0;
    
    for (useC = 0; useC < array_length(split); useC++)
    {
        res_i();
        i2 = 0;
        
        repeat (string_length(split[useC]))
        {
            i++;
            i1 = string_char_at(split[useC], i);
            
            if (i1 == "€")
                useLnegth--;
            
            if (i1 == "_")
                useLnegth -= 3;
            
            if (i1 == "@")
            {
                useLnegth = 2;
                i2 = 1;
            }
            
            if (i1 == "£")
            {
                useLnegth = 0;
                i2 = 1;
            }
            
            if (use_font[in] == sFontPapyrus && (i1 == "I" || i1 == "'"))
                useLnegth -= 1;
        }
        
        if ((string_length(split[useC]) + useLnegth) > letters_allow && (rowCount != 2 || arrayContains(obj_seed, "shop")))
        {
            rowCount++;
            
            if (string_char_at(use_text[in], 1) == "*")
            {
                useText += "@";
                useLnegth = 2;
            }
            else
            {
                useText += "£";
                useLnegth = 0;
            }
            
            useText += split[useC];
        }
        else
        {
            if (useC > 0 && split[useC - 1] != "£")
                useText += " ";
            
            useText += split[useC];
        }
        
        if (split[useC] != "£")
        {
            if (i2 == 0)
                useLnegth += (string_length(split[useC]) + 1);
        }
        else
        {
            useLnegth = 0;
        }
    }
    
    use_text[in] = useText;
}

if (op.twait == 0 || sp == 0)
{
    sp++;
    
    if (arrayContains(obj_seed, "done"))
        spell = use_text[in];
    
    if (spell != use_text[in])
    {
        voiceTy++;
        
        if (string_char_at(use_text[in], sp) == " " || string_char_at(use_text[in], sp) == "€")
            voiceTy = 0;
        
        voiceDelay = 1;
        
        if (use_voice[in] == snd_txtSock || use_voice[in] == snd_txtSans)
            voiceDelay = 2;
        
        if ((!KeyC && op.twait == 0 && !array_contains(noVoice, string_char_at(use_text[in], sp))) && (voiceTy % voiceDelay || voiceDelay == 1) && (use_voice[in] != 0 && use_voice[in] != -1))
            snd(use_voice[in], -999);
        
        if (!((ty + 4) % 5))
        {
            if (op.talkN == 0)
                op.talkN = 1;
            else
                op.talkN = 0;
        }
        
        spell += string_char_at(use_text[in], sp);
        
        if (string_char_at(use_text[in], sp) == "_")
        {
            repeat (2)
            {
                sp++;
                spell += string_char_at(use_text[in], sp);
            }
        }
        
        if (arrayContains(obj_seed, "bb") && (sp % 2) == 1)
        {
            if (use_voice[in] != 0 && use_voice[in] != -1 && !KeyC)
                snd(use_voice[in]);
        }
    }
    else
    {
        op.talkN = 0;
    }
}

if (op.twait > 0)
{
    op.twait--;
    
    if (arrayContains(obj_seed, "privilegeCskip"))
    {
        if (op.twait > 1 && KeyC)
            op.twait = 1;
    }
    
    if (op.twait == 0 && op.twaitFunc != -1)
    {
        op.twaitFunc();
        op.twaitFunc = -1;
    }
    
    if (op.twait == 0 && op.twaitFunc2 != -1)
    {
        op.twaitFunc2();
        op.twaitFunc2 = -1;
    }
}

if (arrayContains(obj_seed, "bb"))
{
    ext(sTB, 0, -10 + use_x[in], -9 + use_y[in], use_bXscale[in], use_bYscale[in], 0, 16777215, 1, 0);
    ext(sTB, 1, -10 + use_x[in] + (use_bXscale[in] * 30), -14 + use_y[in] + round(use_bYscale[in] * 7.5), 1, 1, 0, 16777215, 1, 0);
}

if ((array_contains(obj_seed, "ow") && !array_contains(obj_seed, "shop")) && (op.twait == 0 || room == rSockShop))
{
    if (op.drawBox)
        ext(sBoxOW, ty / 10, 24, use_y[in] - 34);
}

if (op.twait == 0)
    print(spell, use_x[in] + ((op.face[in] != -1) * 120), use_y[in], use_font[in], use_rgb[in], use_printSeed[in]);

if (shakeHeadTime > 0)
{
    shakeHeadTime--;
    shakeHeadPos = [irandom_range(-1, 1) * 2, irandom_range(-1, 1) * 2];
}
else
{
    shakeHeadPos = [0, 0];
}

if (op.face[in] != -1 && op.twait == 0)
{
    var extraFaceX = 0;
    var extraFaceY = 0;
    var faceSprite = sFaces;
    
    if (room == rBattle)
        extraFaceY = -6;
    
    if (op.benMode)
    {
        faceSprite = sBen;
        extraFaceX = 59;
        extraFaceY = 83;
    }
    
    ext(faceSprite, op.face[in], (use_x[in] - 8) + shakeHeadPos[0] + extraFaceX, (use_y[in] - 10) + shakeHeadPos[1] + extraFaceY);
}
