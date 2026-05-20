function print(arg0, arg1, arg2, arg3 = sFont1, arg4 = 16777215, arg5 = [])
{
    var scaleX = 2;
    var scaleY = 2;
    var t_alpha = 1;
    var __eX = 0;
    var __eY = 0;
    var jumpX = 12;
    var jumpY = 15;
    
    if (arg3 == sFont2)
    {
        scaleX = 1;
        scaleY = 1;
    }
    
    if (array_contains(arg5, "force_ENG"))
        op.useLang = 1;
    
    op.getAlphabet = op.alphabet_[op.useLang - 1];
    
    if (op.useLang == 2)
    {
        if (arg3 == sFont1)
            arg3 = sFont1_rus;
        
        if (arg3 == sFont2)
            arg3 = sFont2_rus;
        
        if (arg3 == sFontSock)
            arg3 = sFontSock_rus;
        
        if (arg3 == sFontSans)
            arg3 = sFontSans_rus;
        
        if (arg3 == sFontPapyrus)
            arg3 = sFontPapyrus_rus;
    }
    
    var alphabet = op.getAlphabet;
    var at = 0;
    var currentLetter = "";
    var bet = 0;
    var setRGB = arg4;
    var setRGB_BC = rgb(0, 0, 108);
    var movedX = 0;
    var movedY = 0;
    textSeed = arg5;
    var i1 = 0;
    var fontNumb = -1;
    
    while (fontNumb == -1)
    {
        if (op.FONTspaceStore[0][i1] == arg3)
            fontNumb = i1;
        
        i1++;
    }
    
    i1 = 0;
    
    if (ts("xys_1"))
    {
        scaleX = 1;
        scaleY = 1;
    }
    
    if (ts("xs_1"))
        scaleX = 1;
    
    if (ts("ys_1"))
        scaleY = 1;
    
    if (ts("mid"))
        movedX -= (print_length(arg0, arg3, 2) * scaleX);
    
    if (ts("left"))
        movedX -= (print_length(arg0, arg3, 1) * scaleX);
    
    if (ts("jump10"))
        jumpY = 10;
    
    if (ts("ow"))
    {
        jumpX = 16;
        jumpY = 18;
    }
    
    if (ts("alph0.5"))
        t_alpha = 0.5;
    
    if (ts("alph0.75"))
        t_alpha = 0.75;
    
    if (ts("alph"))
        t_alpha = image_alpha;
    
    if (ts("cur"))
    {
        if (ts("controlsKey") && controlsKey == i)
            setRGB = 255;
        
        if (cur == i)
        {
            if (!ts("noXYcur"))
            {
                curPos[0] += ((arg1 + movedX) - 20 - curPos[0]) / 2;
                curPos[1] += ((arg2 + movedY + 10) - curPos[1]) / 2;
            }
        }
        else
        {
            setRGB = rgb(154, 154, 177);
            
            if (ts("extras"))
            {
            }
        }
    }
    
    while (at < string_length(arg0))
    {
        at++;
        currentLetter = string_char_at(arg0, at);
        
        if (currentLetter != " " && currentLetter != "_" && currentLetter != "@" && currentLetter != "£" && currentLetter != "€")
        {
            bet = 0;
            
            while (currentLetter != string_char_at(alphabet, bet + 1))
                bet++;
            
            if (ts("bc"))
                ext(arg3, bet, arg1 + movedX + 1, arg2 + movedY + 1, scaleX, scaleY, 0, setRGB_BC, t_alpha, 0);
            
            if (ts("bc2"))
                ext(arg3, bet, arg1 + movedX + scaleX, arg2 + movedY + scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
            
            if (ts("bc3"))
            {
                ext(arg3, bet, arg1 + movedX + scaleX, arg2 + movedY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, (arg1 + movedX) - scaleX, arg2 + movedY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, arg1 + movedX, (arg2 + movedY) - scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, arg1 + movedX, arg2 + movedY + scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, arg1 + movedX + scaleX, arg2 + movedY + scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, (arg1 + movedX) - scaleX, arg2 + movedY + scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, arg1 + movedX + scaleX, (arg2 + movedY) - scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
                ext(arg3, bet, (arg1 + movedX) - scaleX, (arg2 + movedY) - scaleY, scaleX, scaleY, 0, 0, t_alpha, 0);
            }
            
            if (setRGB == 16777215 || !ts("bc"))
            {
                ext(arg3, bet, arg1 + movedX, arg2 + movedY, scaleX, scaleY, 0, setRGB, t_alpha, 0);
            }
            else
            {
                __eY = 0;
                
                if (arg3 == sFont1)
                    __eY = -2;
                
                if (arg3 == sFontSock)
                    __eY = -4;
                
                if (arg3 == sFont1_rus)
                    __eY = -2;
                
                if (arg3 == sFontSock_rus)
                    __eY = -4;
                
                draw_sprite_general(arg3, bet, 0, 0, 99, 99, arg1 + movedX + __eX, (arg2 + movedY + __eY) - 2, scaleX, scaleY, 0, c_white, c_white, setRGB, setRGB, 1);
            }
            
            if (!ts("mono"))
                movedX += ((real(op.FONTspace[fontNumb][bet]) + 1) * scaleX);
            else
                movedX += ((real(op.FONTspace[fontNumb][0]) + 2) * scaleX);
            
            if (arg3 == sFontSock && (currentLetter == "M" || currentLetter == "W"))
                movedX += 4;
            
            if (arg3 == sFontPapyrus && (currentLetter == "I" || currentLetter == "'" || currentLetter == "Ì"))
                movedX -= 12;
            
            if (arg3 == sFontSock_rus && (currentLetter == "Ж" || currentLetter == "М" || currentLetter == "Ш" || currentLetter == "Щ" || currentLetter == "Ъ" || currentLetter == "Ы" || currentLetter == "Ю"))
                movedX += 4;
            
            if (arg3 == sFontSans_rus && currentLetter == "щ")
                movedX += 4;
            
            if (arg3 == sFontPapyrus_rus && (currentLetter == "Д" || currentLetter == "О"))
                movedX += 2;
        }
        else
        {
            if (currentLetter == " ")
            {
                if (!ts("mono"))
                {
                    movedX += (3 * scaleX);
                    
                    if (arg3 == sFont2)
                        movedX += (2 * scaleX);
                }
                else
                {
                    movedX += ((real(op.FONTspace[fontNumb][0]) + 2) * scaleX);
                }
                
                if (arg3 == sFontPapyrus)
                    movedX -= 6;
            }
            
            if (currentLetter == "@")
            {
                movedX = jumpX * scaleX;
                movedY += (jumpY * scaleY);
                
                if (room == rBattle)
                    movedX += (4 * scaleX);
            }
            
            if (currentLetter == "£")
            {
                movedX = 0;
                movedY += (jumpY * scaleY);
            }
            
            if (currentLetter == "_")
            {
                if (string_char_at(arg0, at + 1) == "c")
                {
                    if (string_char_at(arg0, at + 2) == "w")
                    {
                        setRGB = rgb(255, 255, 255);
                        setRGB_BC = rgb(0, 0, 108);
                    }
                    
                    if (string_char_at(arg0, at + 2) == "y")
                    {
                        setRGB = rgb(255, 255, 0);
                        setRGB_BC = rgb(76.5, 49.5, 25);
                    }
                    
                    if (string_char_at(arg0, at + 2) == "b")
                        setRGB = rgb(0, 0, 255);
                    
                    if (string_char_at(arg0, at + 2) == "g")
                        setRGB = rgb(85, 85, 85);
                    
                    if (string_char_at(arg0, at + 2) == "p")
                    {
                        setRGB = rgb(128, 0, 255);
                        setRGB_BC = rgb(51.2, 0, 127.5);
                    }
                    
                    if (string_char_at(arg0, at + 2) == "o")
                        setRGB = rgb(255, 160, 64);
                }
                
                if (string_char_at(arg0, at + 1) == "s")
                {
                    if (string_char_at(arg0, at + 2) == "a")
                        ext(sTS, 0, -6 + arg1 + movedX, -8 + arg2 + movedY, 1, 1, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "b")
                        ext(sTS, 1, -6 + arg1 + movedX, -8 + arg2 + movedY, 1, 1, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "c")
                        ext(sTS, 2, -6 + arg1 + movedX, -8 + arg2 + movedY, 1, 1, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "d")
                        ext(sTS, 3, -6 + arg1 + movedX, -8 + arg2 + movedY, 1, 1, 0, setRGB, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "g")
                        ext(sTS, 16, -6 + arg1 + movedX, -8 + arg2 + movedY, 1, 1, 0, setRGB, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "1")
                        ext(sTS, 4, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "2")
                        ext(sTS, 5, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "3")
                        ext(sTS, 6, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "4")
                        ext(sTS, 7, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "5")
                        ext(sTS, 8, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "6")
                        ext(sTS, 9, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "7")
                        ext(sTS, 10, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "8")
                        ext(sTS, 11, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "9")
                        ext(sTS, 12, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "0")
                        ext(sTS, 13, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "e")
                        ext(sTS, 14, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    if (string_char_at(arg0, at + 2) == "f")
                        ext(sTS, 15, (-3 * scaleX) + arg1 + movedX, (-4 * scaleY) + arg2 + movedY, scaleX / 2, scaleY / 2, 0, 16777215, 1, 0);
                    
                    movedX += (34 * (scaleX / 2));
                }
                
                at += 2;
            }
        }
    }
}

function ts(arg0)
{
    if (array_contains(textSeed, arg0))
        return true;
    else
        return false;
}

function print_length(arg0, arg1, arg2)
{
    printLength = 0;
    var alphabet = op.getAlphabet;
    var at = 0;
    var bet = 0;
    var movedX = 0;
    var i1 = 0;
    var fontNumb = -1;
    
    while (fontNumb == -1)
    {
        if (op.FONTspaceStore[0][i1] == arg1)
            fontNumb = i1;
        
        i1++;
    }
    
    i1 = 0;
    
    while (at < string_length(arg0))
    {
        at++;
        
        if (string_char_at(arg0, at) == "_")
        {
            if (string_char_at(arg0, at + 1) == "c")
            {
            }
            
            if (string_char_at(arg0, at + 1) == "s")
            {
                if (string_char_at(arg0, at + 2) == "a")
                    movedX += 17;
                
                if (string_char_at(arg0, at + 2) == "b")
                    movedX += 17;
                
                if (string_char_at(arg0, at + 2) == "c")
                    movedX += 17;
                
                if (string_char_at(arg0, at + 2) == "d")
                    movedX += 7;
            }
            
            at += 2;
        }
        else if (string_char_at(arg0, at) == " ")
        {
            movedX += 3;
            
            if (arg1 == sFont2)
                movedX += 2;
        }
        else
        {
            bet = 0;
            
            while (string_char_at(arg0, at) != string_char_at(alphabet, bet + 1))
                bet++;
            
            movedX += (real(op.FONTspace[fontNumb][bet]) + 1);
            
            if (at == string_length(arg0))
                movedX--;
        }
    }
    
    if (arg2 == 1)
        return movedX;
    
    if (arg2 == 2)
        return round(movedX / 2);
    
    if (arg2 == 3)
        printLength = movedX;
    
    if (arg2 == 4)
        printLength = round(movedX / 2);
}

function popText(arg0, arg1, arg2, arg3, arg4)
{
    with (instance_create_depth(arg1 - 40, arg2, -15000, oPopText))
    {
        text = arg0;
        sprite = arg3;
        color = arg4;
    }
}
