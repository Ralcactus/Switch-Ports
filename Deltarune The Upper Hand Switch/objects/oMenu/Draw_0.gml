var _onf = function(arg0 = -1)
{
    if (arg0 == -1)
        array_push(i1, offOnText[0]);
    else
        array_push(i1, offOnText[1]);
};

if (page > 2 && page != 4)
{
    if (bcalpha < 1)
        bcalpha += 0.1;
    
    bcRGB = rgb((128 + (sin(0 + (op.ti / 60)) * 127)) / 1, (128 + (sin(2.0943951023931953 + (op.ti / 60)) * 127)) / 1, (128 + (sin(4.1887902047863905 + (op.ti / 60)) * 127)) / 1);
    op.pixelScale = 2;
}
else if (bcalpha > 0)
{
    bcalpha -= 0.1;
}

bcXY++;

if (bcXY > 320)
    bcXY -= 320;

var _spaceSprite = sSpaceM2;

if (op.challengeMode)
{
    _spaceSprite = sSpaceM3;
    ext(_spaceSprite, 0, 0, 0, 2, 2, undefined, 16777215, 1);
}

ext(_spaceSprite, 0, 0, 0, 2, 2, undefined, 16777215, bcalpha);

if (page == 0)
{
    libAt = 1;
    libXY = [0, 0];
    libCheck = -1;
}

if ((page == 1 || page == 2 || page == 3 || page == 5) || (page == 0 && cur == 2))
    subtractLight += 10;
else
    subtractLight -= 10;

subtractLight = clamp(subtractLight, 0, 128);
var titleSprite = sTitlescreenTitle;

if (op.alexMode)
{
    draw_sprite_tiled(sAlex_SpamtonMarioBG, 0, op.ty, op.ty);
    titleSprite = sAlex_Lyrics;
}

if (op.benMode)
{
    draw_sprite_tiled_ext(sBen_Meat, 0, op.ty, op.ty, 1, 1, c_white, 1 - (op.alexMode * 0.5));
    
    if (!op.alexMode)
        titleSprite = sNothing;
}

ext(titleSprite, op.language - 1, 157, 68 + (op.alexMode * dsin(op.ty * 3) * 10), 0.5, 0.5, undefined, undefined, (128 - subtractLight) / 128);
gpu_set_blendmode(bm_add);
print(g_st("cred_t"), 320, 460, undefined, undefined, ["prop", "xys_1", "alph0.5", "mid", "force_ENG"]);
gpu_set_blendmode(bm_normal);
gpu_set_blendmode(bm_add);
image_alpha = (0.5 * (128 - subtractLight)) / 128;
print("v" + op.versionNumber, 220 - (op.challengeMode * 30), 140, undefined, undefined, ["prop", "xys_1", "alph", "force_ENG"]);
gpu_set_blendmode(bm_normal);

if ((page != 1 && page != 2 && page != 3 && page != 5) && !(page == 0 && cur == 2))
{
    if (sockTime > 0 && sockMode[0] == -1)
    {
        sockTime--;
        sockXY = [0, 0];
    }
    
    if (page != 0)
        sockTime = 60;
    
    if (sockTime == 0)
    {
        sockMode[1] = 0;
        sockMode[2] = 0;
        sockMode[0] = irandom_range(1, 1);
        sockTime = 60;
    }
    
    if (sockMode[0] == 1)
    {
        sockMode[2] = 0;
        
        if (sockMode[2] == 0 && sockMode[1] == 5)
        {
            sockXY[1] = 0;
            sockXY[0] -= 2;
            
            if (sockXY[0] <= 0)
            {
                sockMode = [-1, 0, 0];
                sockXY = [0, 0];
            }
        }
        
        if (sockMode[2] == 0 && (sockMode[1] == 3 || sockMode[1] == 4))
        {
            sockXY[1] = 0;
            sockXY[0] += 4;
            
            if (sockXY[0] >= 10)
            {
                sockMode[2] = 1;
                sockMode[1]++;
            }
        }
        
        if (sockMode[2] == 0 && (sockMode[1] == 2 || sockMode[1] == 2))
        {
            sockXY[1] = 0;
            sockXY[0] -= 4;
            
            if (sockXY[0] <= -10)
            {
                sockMode[2] = 1;
                sockMode[1]++;
            }
        }
        
        if (sockMode[1] == 1)
        {
            sockXY[1] += 5;
            
            if (sockXY[1] >= 0)
            {
                sockMode[1] = 2;
                sockXY[1] = 0;
            }
        }
        
        if (sockMode[1] == 0)
        {
            sockXY[1] -= 5;
            
            if (sockXY[1] <= -50)
                sockMode[1] = 1;
        }
        
        if (sockMode[1] > 1 || sockMode[0] == -1)
            sockXY[1] = 0;
    }
}

var titleGuySprite = sMenu_Sock;

if (op.benMode)
    titleGuySprite = sNothing;

if (op.alexMode)
    titleGuySprite = sAlex_SpamtonMario;

if (!op.alexMode && !op.benMode)
    ext(sMenu_Gang, 1, 207, 82, 0.16, 0.16, undefined, undefined, (128 - subtractLight) / 128);

ext(titleGuySprite, 1, 424 + sockXY[0], (472 + sockXY[1]) - (op.alexMode * 100), 0.16 + (op.alexMode * 0.84), 0.16 + (op.alexMode * 0.84), undefined, undefined, (128 - subtractLight) / 128);

if (op.alexMode)
{
    spawnEEF(50, 50, sAlex_SpamtonMario, 0, "ending_star,drawENDEND,scale0.1,specialFIX");
    spawnEEF(590, 50, sAlex_SpamtonMario, 0, "ending_star,drawENDEND,scale0.1,specialFIX");
}

gpu_set_blendmode(bm_subtract);
ext(sPixel, 0, 0, 0, 640, 480, 0, make_color_rgb(subtractLight, subtractLight, subtractLight), 1);
gpu_set_blendmode(bm_normal);

if (page == 0 && cur == 2)
{
    res_i();
    i2 = 7;
    
    if (TapLEFT)
    {
        credits--;
        snd(snd_menumove);
    }
    
    if (TapRIGHT)
    {
        credits++;
        snd(snd_menumove);
    }
    
    if (credits == -1)
        credits = i2 - 1;
    
    if (credits == i2)
        credits = 0;
    
    i1 = g_t("cred_" + string(credits + 1));
    
    if (op.benMode || op.alexMode)
    {
        if (credits == 3)
            i1[0] = "Classic Lukas theme:";
    }
    
    if (op.challengeMode)
        i1[0] = g_st("cred_t2");
    
    print(i1[0], 440, 250 - ((array_length(i1) > 3) * (array_length(i1) - 3) * 30), sFont2, undefined, ["mid", "bc2"]);
    i = 1;
    
    repeat (array_length(i1) - 1)
    {
        if (op.alexMode)
        {
            i1[i] = "Alex";
            
            if (credits == 0)
                i1[1] = "Lukas";
        }
        
        if (op.benMode)
            i1[i] = "Ben";
        
        if (op.challengeMode)
            i1[i] = "Anvil - Path to Nowhere";
        
        print(i1[i], 440, (250 + (30 * i) + (15 * (3 - array_length(i1)))) - ((array_length(i1) > 3) * (array_length(i1) - 3) * 15), undefined, undefined, ["mid", "bc2", "force_ENG"]);
        i++;
    }
    
    print(g_st("m_4e2") + " " + string(credits + 1) + "/" + string(i2), 440, 350, sFont2, undefined, ["mid", "bc2"]);
}
else
{
    credits = 0;
}

if (page == 1)
{
    controlsKey = -1;
    controlsSet = -1;
    controls01 = -1;
    
    if (cur == 0)
    {
        var _langMax = op.languageAmount;
        var _langChange = false;
        
        if (TapLEFT)
        {
            snd(snd_menumove);
            op.language--;
            
            if (op.language == 0)
                op.language = _langMax;
            
            _langChange = true;
        }
        
        if (TapRIGHT || TapZ)
        {
            snd(snd_menumove);
            op.language++;
            
            if (op.language > _langMax)
                op.language = 1;
            
            _langChange = true;
        }
        
        if (_langChange)
        {
            menu[0][2] = g_t("m_1");
            menu[1][2] = g_t("m_2");
            menu[2][2] = g_t("m_3");
            menu[3][2] = g_t("m_4");
            menu[4][2] = g_t("m_5");
            menu[5][2] = g_t("m_6");
            offOnText = g_t("m_1e");
            file_save();
        }
    }
    
    temp = g_t("m_2e");
    var _volChange = false;
    
    if (cur == 1 && !(KeyLEFT && KeyRIGHT))
    {
        if (KeyLEFT)
        {
            if (op.ty % 2 && op.st_musicVOL > 0)
                snd(snd_noise);
            
            if ((tymeLEFT + tymeRIGHT) > 20)
                op.st_musicVOL -= 2 - (op.alexMode * 3);
            else
                op.st_musicVOL -= 1 - (op.alexMode * 2);
            
            _volChange = true;
        }
        
        if (KeyRIGHT)
        {
            if (op.ty % 2 && op.st_musicVOL < 100)
                snd(snd_noise);
            
            if ((tymeLEFT + tymeRIGHT) > 20)
                op.st_musicVOL += 2;
            else
                op.st_musicVOL++;
            
            _volChange = true;
        }
        
        if (!op.alexMode)
            op.st_musicVOL = clamp(op.st_musicVOL, 0, 100);
        
        audio_group_set_gain(mus_ASCENSION_old, op.st_musicVOL / 100, 0);
    }
    
    if (cur == 2 && !(KeyLEFT && KeyRIGHT))
    {
        if (KeyLEFT)
        {
            if (op.ty % 2 && op.st_soundVOL > 0)
                snd(snd_noise);
            
            if ((tymeLEFT + tymeRIGHT) > 20)
                op.st_soundVOL -= 2;
            else
                op.st_soundVOL -= 1;
            
            _volChange = true;
        }
        
        if (KeyRIGHT)
        {
            if (op.ty % 2 && op.st_soundVOL < 100)
                snd(snd_noise);
            
            if ((tymeLEFT + tymeRIGHT) > 20)
                op.st_soundVOL += 2;
            else
                op.st_soundVOL++;
            
            _volChange = true;
        }
        
        op.st_soundVOL = clamp(op.st_soundVOL, 0, 100);
        audio_group_set_gain(mus_ASCENSION, op.st_soundVOL / 100, 0);
    }
    
    if (_volChange)
        file_save();
    
    repeat (0)
        ext(sBox2, 0, 320, 240, 20, 20);
    
    res_i();
    i1 = [];
    array_push(i1, temp[1]);
    array_push(i1, string(op.st_musicVOL) + "%");
    array_push(i1, string(op.st_soundVOL) + "%");
    array_push(i1, -1);
    _onf(op.st_simplifyVFX);
    
    if (op.F4state == 0)
        array_push(i1, offOnText[0]);
    else
        array_push(i1, offOnText[1]);
    
    _onf(op.st_keystrokes);
    _onf(op.st_speedrunTimer);
    _onf(op.st_noHit);
    array_push(i1, -1);
    
    repeat (array_length(i1))
    {
        if (i1[i] != -1)
            print(i1[i], 420, (244 - (15 * array_length(i1))) + (i * 30), undefined, undefined, ["cur", "prop", "bc2", "noXYcur"]);
        
        i++;
    }
    
    print(temp[0], 320, 62, undefined, 16776960, ["prop", "bc2", "mid"]);
}

if (page == 2)
{
    if (TapZ && cur < 7)
    {
        TapZ = false;
        TapX = false;
        controlsKey = cur;
        controlsSet = -1;
        controls01 = -1;
    }
    
    if (keyboard_check_pressed(vk_shift))
        controlsKey = -1;
    
    if (controlsKey != -1)
    {
        res_i();
        
        repeat (41)
        {
            if (keyboard_check_pressed(ord(string_char_at(op.alphabet_[0], i + 28))) && controlsSet == -1 && tymeZ == 2)
            {
                controls01 = 1;
                controlsSet = string_char_at(op.alphabet_[0], i + 28);
            }
            
            i++;
        }
        
        if (keyboard_check_pressed(vk_up) && controlsSet == -1 && tymeZ == 2)
        {
            controls01 = 0;
            controlsSet = 38;
        }
        
        if (keyboard_check_pressed(vk_down) && controlsSet == -1 && tymeZ == 2)
        {
            controls01 = 0;
            controlsSet = 40;
        }
        
        if (keyboard_check_pressed(vk_left) && controlsSet == -1 && tymeZ == 2)
        {
            controls01 = 0;
            controlsSet = 37;
        }
        
        if (keyboard_check_pressed(vk_right) && controlsSet == -1 && tymeZ == 2)
        {
            controls01 = 0;
            controlsSet = 39;
        }
        
        if (controlsSet != -1)
        {
            controlsKey = -1;
            res_j();
            j1 = -1;
            
            repeat (7)
            {
                if (op.keys[j][1] == controlsSet)
                    j1 = j;
                
                j++;
            }
            
            if (j1 == -1)
            {
                op.keys[cur] = [controls01, controlsSet];
            }
            else
            {
                op.keys[j1] = op.keys[cur];
                op.keys[cur] = [controls01, controlsSet];
            }
            
            file_save();
        }
    }
    
    repeat (0)
        ext(sBox2, 0, 320, 240, 20, 20);
    
    res_i();
    i1 = [];
    i2 = "";
    keysText(op.keys[0][1]);
    keysText(op.keys[1][1]);
    keysText(op.keys[2][1]);
    keysText(op.keys[3][1]);
    keysText(op.keys[4][1]);
    keysText(op.keys[5][1]);
    keysText(op.keys[6][1]);
    
    repeat (2)
        array_push(i1, -1);
    
    repeat (array_length(i1))
    {
        if (i1[i] != -1)
        {
            op.useLang = op.language;
            i2 = "A";
            
            if (op.keys[i][0] == 1)
                i2 = "force_ENG";
            
            print(i1[i], 420, (229 - (15 * array_length(i1))) + (i * 30), undefined, undefined, ["cur", "prop", "bc2", "noXYcur", "controlsKey", i2]);
        }
        
        i++;
    }
    
    temp = g_t("m_3e");
    print(temp[0], 168, 62, undefined, 16776960, ["prop", "bc2"]);
    print(temp[1], 420, 62, undefined, 16776960, ["prop", "bc2"]);
}

if (page == 3)
{
    musicStyle = g_t("m_4e3");
    
    if (cur == 1)
        textColor = 16777215;
    else
        textColor = rgb(154, 154, 177);
    
    print(musicStyle[op.musicStyle], 202 + extras_smallTextOffset(0), 220, sFont2, textColor, ["bc2"]);
    
    if (cur == 4)
        textColor = 16777215;
    else
        textColor = rgb(154, 154, 177);
    
    print(musicStyle[3 - op.challengeMode], 242 + extras_smallTextOffset(1), 310, sFont2, textColor, ["bc2"]);
    
    if (cur == 3)
        ext(sFile, op.ty / 5, 320 + fileShake, 240);
    else
        fileDelete = 0;
    
    if (cur == 1 && false)
    {
        if (TapZ || TapX)
        {
            if (holdZ == 0)
                holdZ = 1;
            else
                holdZ = 0;
        }
        
        if (holdZ == 0)
        {
            if (TapLEFT && libAt != 1)
            {
                libAt--;
                libXY = [0, 0];
            }
            
            if (TapRIGHT && libAt != 100)
            {
                libAt++;
                libXY = [0, 0];
            }
        }
        
        ext(sBox2, 0, 430, 240, 20, 20);
        
        if (holdZ > 0)
        {
            if (KeyUP)
                libXY[1] += 20;
            
            if (KeyDOWN)
                libXY[1] -= 20;
            
            if (KeyLEFT)
                libXY[0] += 20;
            
            if (KeyRIGHT)
                libXY[0] -= 20;
        }
        
        if (!surface_exists(libSurf))
            libSurf = surface_create(1552, 1552);
        
        surface_set_target(libSurf);
        draw_clear_alpha(c_white, 0);
        draw_line_width(libXY[0], libXY[1], 776, 776, 4);
        
        if (libAt == 1)
            ext(sArt4, 0, libXY[0], libXY[1]);
        
        if (libAt == 2)
            ext(sConcept1, 0, libXY[0], libXY[1]);
        
        if (libAt == 3)
            ext(sArt7, 0, libXY[0], libXY[1]);
        
        surface_reset_target();
        draw_surface_ext(libSurf, 236, 46, 0.25, 0.25, 0, c_white, 1);
        
        if (holdZ == 0)
        {
            i1 = [];
            keysText(op.keys[4][1]);
            keysText(op.keys[5][1]);
            
            repeat (1)
                ext(sBox2, 0, 430, 240, 20, 20);
            
            temp = g_t("m_4e");
            print(temp[0] + string(libAt) + " / 20", 430, 229, undefined, bcRGB, ["prop", "bc2", "mid"]);
            
            if (op.gamepad == 0)
            {
                print(temp[1] + "(" + i1[0] + ")" + temp[2], 430, 180, sFont2, 16777215, ["prop", "bc2", "mid"]);
                print(temp[3] + "(" + i1[1] + ")" + temp[4], 430, 200, sFont2, 16777215, ["prop", "bc2", "mid"]);
            }
            
            if (op.gamepad != 0)
            {
                print(temp[1] + op.gp1 + temp[2], 430, 180, sFont2, 16777215, ["prop", "bc2", "mid"]);
                print(temp[3] + op.gp3 + temp[4], 430, 200, sFont2, 16777215, ["prop", "bc2", "mid"]);
            }
        }
        
        if (holdZ > 0)
        {
            ext_ol(sSymb, 5, 430, 60 - round(sin(op.ti / 15) * 2), 1, 1, undefined, bcRGB);
            ext_ol(sSymb, 5, 430, 420 + round(sin(op.ti / 15) * 2), 1, 1, 180, bcRGB);
        }
        
        if (!(holdZ == 0 && libAt == 1))
            ext_ol(sSymb, 5, (250 + ((1 - holdZ) * 80)) - round(sin(op.ti / 15) * 2), 240, 1, 1, 90, bcRGB);
        
        if (!(holdZ == 0 && libAt == 100))
            ext_ol(sSymb, 5, (610 - ((1 - holdZ) * 80)) + round(sin(op.ti / 15) * 2), 240, 1, 1, -90, bcRGB);
    }
}

if (page == 5)
{
    temp = g_t("m_6e");
    menu[page][2][0] = temp[0];
    menu[page][2][1] = temp[0];
    
    if (array_contains(op.save, "win1"))
    {
        menu[page][2][0] = temp[1];
        
        if (op.alexMode)
            temp[3] = "yeah buddy im sure it does";
        
        if (cur == 0)
        {
            ext(sBox2, 0, 320, 58, 30, 3);
            print(temp[3], 320, 50, sFont2, undefined, ["mid", "bc2"]);
        }
    }
    
    if (array_contains(op.save, "win2"))
    {
        menu[page][2][1] = temp[2];
        
        if (op.alexMode)
            temp[4] = "mike";
        
        if (cur == 1)
        {
            ext(sBox2, 0, 320, 58, 30, 3);
            print(temp[4], 320, 50, sFont2, undefined, ["mid", "bc2"]);
        }
    }
    
    if (op.itemsON[0] == 1)
        ext(sTS, 2, 180 + extras_smallTextOffset(2), 190, 1, 1);
    
    if (op.itemsON[1] == 1)
        ext(sTS, 1, 180 + extras_smallTextOffset(3), 220, 1, 1);
}
