if (escape > 0 && escape < 40 && room != rTest)
    lang_quit();

if (escape == 40)
{
    if (room == rMainMenu)
    {
        game_end();
    }
    else if (debug)
    {
        room_goto(rTest);
        oPlayer.x = 400;
        oPlayer.y = 240;
    }
    else if (customMode && room != rCustomMode)
    {
        room_goto(rCustomMode);
    }
    else
    {
        room_goto(rMainMenu);
    }
}

if (fade > 0)
{
    ext(sPixel, 0, 0, 0, 640, 480, undefined, 0, fade / 10);
    fade--;
}

if (st_keystrokes == 1)
{
    use_keys();
    ext(sPixel, undefined, 40, 400, 40, 40, undefined, undefined, 0.2 + (KeyUP * 0.1));
    ext(sSymb, 8, 61, 420, undefined, undefined, 90, 0, 0.5);
    ext(sPixel, undefined, 40, 440, 40, 40, undefined, undefined, 0.2 + (KeyDOWN * 0.1));
    ext(sSymb, 8, 60, 459, undefined, undefined, -90, 0, 0.5);
    ext(sPixel, undefined, 0, 440, 40, 40, undefined, undefined, 0.2 + (KeyLEFT * 0.1));
    ext(sSymb, 8, 21, 459, undefined, undefined, 180, 0, 0.5);
    ext(sPixel, undefined, 80, 440, 40, 40, undefined, undefined, 0.2 + (KeyRIGHT * 0.1));
    ext(sSymb, 8, 100, 460, undefined, undefined, undefined, 0, 0.5);
    temp = g_t("s_3");
    ext(sPixel, undefined, 120, 400, 60, 26.666666666666668, undefined, undefined, 0.2 + (KeyZ * 0.1));
    print(temp[0], 150, 407.3333333333333, undefined, 0, ["prop", "mid", "xys_1", "alph0.5"]);
    ext(sPixel, undefined, 120, 426.6666666666667, 60, 26.666666666666668, undefined, undefined, 0.2 + (KeyX * 0.1));
    print(temp[1], 150, 434, undefined, 0, ["prop", "mid", "xys_1", "alph0.5"]);
    ext(sPixel, undefined, 120, 453.3333333333333, 60, 26.666666666666668, undefined, undefined, 0.2 + (KeyC * 0.1));
    print(temp[2], 150, 460.66666666666663, undefined, 0, ["prop", "mid", "xys_1", "alph0.5"]);
}

if (st_speedrunTimer == 1)
{
    res_i();
    i = string(srt_min) + ":";
    
    if (srt_sec < 10)
        i += "0";
    
    i += (string(srt_sec) + ":");
    
    if (round(60 * (srt_msec / 30)) < 10)
        i += "0";
    
    i += string(round(60 * (srt_msec / 30)));
    image_alpha = 1 - escape;
    print(i, 2, 1, undefined, undefined, ["prop", "xys_1", "alph"]);
}

if (code == 1)
{
    res_i();
    
    repeat (10)
    {
        if (keyboard_check_pressed(ord(string(i))) && !codeCheck)
            codeString += string(i);
        
        i++;
    }
    
    res_i();
    i1 = false;
    
    if (op.keys[5][0] == 0)
        i1 = keyboard_check_pressed(op.keys[5][1]);
    else
        i1 = keyboard_check_pressed(ord(op.keys[5][1]));
    
    if (i1 || keyboard_check_pressed(vk_backspace))
    {
        if (string_length(codeString) == 0)
        {
            i1 = false;
            code = 0;
        }
        
        res_i();
        i1 = "";
        
        repeat (string_length(codeString) - 1)
        {
            i++;
            i1 += string_char_at(codeString, i);
        }
        
        codeString = i1;
    }
    
    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
        codeString = clipboard_get_text();
    
    if (string_length(codeString) == 8)
    {
        res_i();
        i = sGraze2;
        code = 0;
        
        if (codeString == "00000000")
        {
            oPlayer.x = 300;
            oPlayer.y = 300;
            room_goto(rTest);
            i = sSock_PersonalSpace;
        }
        
        if (codeString == "20202020")
        {
            if (dateText)
                dateText = false;
            else
                dateText = true;
            
            i = sFont1;
        }
        
        if (codeString == "99999999")
        {
            if (wowBoxes)
                wowBoxes = false;
            else
                wowBoxes = true;
            
            i = sWowBox;
        }
        
        if (codeString == "88888888")
        {
            if (starBoxes)
                starBoxes = false;
            else
                starBoxes = true;
            
            i = sSoul;
        }
        
        if (codeString == "18151513")
            room_goto(rCodes);
        
        if (codeString == "12345678")
        {
            if (challengeMode)
                challengeMode = false;
            else
                challengeMode = true;
            
            i = sBBGglow2nd;
        }
        
        if (codeString == "55555555")
        {
            if (room == rBattle)
            {
                des(oAttackSelector);
                instance_create_depth(0, 0, -9999, oAttackSelector);
            }
        }
        
        if (codeString == "80085455")
        {
            if (benAlways)
            {
                benAlways = false;
                benMode = false;
            }
            else
            {
                benAlways = true;
                benMode = true;
            }
            
            if (room == rMusicPlayer)
                oMenuCustom.updateText = true;
            
            i = sGnome;
        }
        
        if (codeString == "15621311")
        {
            if (alexAlways)
            {
                alexAlways = false;
                alexMode = false;
            }
            else
            {
                alexAlways = true;
                alexMode = true;
            }
            
            if (room == rMusicPlayer)
                oMenuCustom.updateText = true;
            
            if (room == rCodes)
                op.parameter = [0, 9999, 0, 9999];
            
            des(oWall);
            i = sAlex_MySuperFuckingCooolDarwawing;
        }
        
        if (codeString == "50205020")
        {
            if (allowSuper)
                allowSuper = false;
            else
                allowSuper = true;
            
            if (room == rCustomMode)
                oMenuCustom.updateText = true;
            
            i = sBBGglow3rd;
        }
        
        spawnEEF(200 + camX, 200 + camY, i, 0, "rude,drawN,scale2");
    }
    else
    {
        if (!(op.ty % 10))
        {
            if (codeStar == "")
                codeStar = "*";
            else
                codeStar = "";
        }
        
        ext(sBox2, 1, 320, 240, 10, 5);
        print(codeString, 320, 231, undefined, undefined, ["mid"]);
        print(codeStar, 320, 260, undefined, undefined, ["mid"]);
        print(codeStar, 320, 202, undefined, undefined, ["mid"]);
    }
}

if (gamepadTimer > 0)
{
    gamepadTimer--;
    gamepadY = lerp(gamepadY, 26, 0.25);
}
else
{
    gamepadY = lerp(gamepadY, -20, 0.25);
}

if (gamepadY > -19)
{
    draw_sprite_ext(sControler, 0, 36, gamepadY * 1.4, 2, 2, dsin(ty * 8) * 6, c_white, 0.5 + (dsin(ty * 4) * 0.5));
    
    if (array_length(global.gamepads) == 0)
        draw_sprite_ext(sControler, 1, 36, gamepadY * 1.4, 2 + (dsin(ty * 8) * 0.1), 2 + (dsin(ty * 8) * 0.1), 0, c_white, 0.5);
}

if (dateText)
{
    res_i();
    i1 = string(current_year);
    
    if (current_month < 10)
        i2 = "0" + string(current_month);
    else
        i2 = string(current_month);
    
    if (current_day < 10)
        i3 = "0" + string(current_day);
    else
        i3 = string(current_day);
    
    d_text(5, 1, i1 + "-" + i2 + "-" + i3 + " fps:" + string(fps));
    d_text(5, 16, "Complete v" + op.versionNumber);
    d_text(mouse_x - camX, mouse_y - camY, string(mouse_x) + "," + string(mouse_y));
}

res_i();

if (room == rMainMenu)
{
    if (op.alexMode)
    {
        if (!(op.ty % 60))
        {
            if (alexAlpha == 0)
                alexAlpha = 1;
            else
                alexAlpha = 0;
        }
        
        image_alpha = alexAlpha;
        print("CONGRATULATIONS AND£WELCOME PLEASE ENTER£WITH CAUTION YOU ARE£NOT WELCOME HERE", 320, 10, undefined, undefined, ["bc3", "alph"]);
    }
}
