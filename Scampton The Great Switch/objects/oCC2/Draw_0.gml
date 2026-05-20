Tyme++;

if (StringContains(Seed, "MenuPris"))
{
    if (Tyme == 1)
    {
        k1 = 500;
        i1 = 1;
        oAlways.MM_Cursor = "s_MM1";
        
        if (oP.JC)
        {
            oAlways.MM_Cursor = "s_MM3";
            oP.JC = false;
        }
    }
    
    if (Tyme == 2)
        saveGame();
    
    if (oP.PistonMode && oP.PT > 20)
        draw_sprite_ext(sPiston, 0, 176, 267 + round(sin(oP.Tyme * 0.025) * 10), 1, 1, 0, c_white, 1);
    else
        draw_sprite_ext(sMenu_1, 3, 0, 4 + round(sin(oP.Tyme * 0.025) * 10), 2, 2, 0, c_white, 1);
    
    draw_sprite_ext(sMenu_1, 2, 0, round(sin(oP.Tyme * 0.025) * 0), 2, 2, 0, c_white, 1);
    
    if (oP.PistonMode && oP.PT > 20)
    {
        draw_sprite_ext(sPiston_Title, 6, 440, 120, 1 + (sin(oP.PT * 0.1) * 0.1), 1 + (sin(oP.PT * 0.05) * 0.1), sin(oP.PT * 0.025) * 3, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sMenu_1, 6, 2, 2 + (sin(oP.Tyme * 0.05) * 2), 2, 2, 0, c_black, 1);
        draw_sprite_ext(sMenu_1, 6, 0, sin(oP.Tyme * 0.05) * 2, 2, 2, 0, c_white, 1);
    }
    
    if (oAlways.MM_Cursor == "s_MM_I2" || oAlways.MM_Cursor == "s_MM_I3" || oAlways.MM_Cursor == "s_MM_I4")
    {
        if (oP.setP)
            draw_sprite_ext(sTextHeads, 2, 326, 50, 1, 1, 0, c_white, 1);
        
        if (oP.setG)
            draw_sprite_ext(sTextHeads, 9, 284, 78, 1, 1, 0, c_white, 1);
    }
    
    if (i1 == 1)
    {
        i1 = 0;
        
        with (oTextEngine)
            des(0);
        
        with (instance_create_depth(474, 270, -9999, oTextEngine))
        {
            Text[0] = "START";
            Cur2 = "s_MM1";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(468, 298, -9999, oTextEngine))
        {
            Text[0] = "EXTRAS";
            Cur2 = "s_MM2";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(462, 326, -9999, oTextEngine))
        {
            Text[0] = "CREDITS";
            Cur2 = "s_MM3";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        if (oP.Win_P || oP.Win_G)
        {
            with (instance_create_depth(450, 354, -9999, oTextEngine))
            {
                Text[0] = "INVENTORY";
                Cur2 = "s_MM_I1";
                AllowKeys = false;
                Mono = true;
                StringAT = 999;
                Spez3 = "Black2Back";
            }
            
            with (instance_create_depth(482, 382, -9999, oTextEngine))
            {
                Text[0] = "QUIT";
                Cur2 = "s_MM4";
                AllowKeys = false;
                Mono = true;
                StringAT = 999;
                Spez3 = "Black2Back";
            }
        }
        else
        {
            with (instance_create_depth(482, 354, -9999, oTextEngine))
            {
                Text[0] = "QUIT";
                Cur2 = "s_MM4";
                AllowKeys = false;
                Mono = true;
                StringAT = 999;
                Spez3 = "Black2Back";
            }
        }
    }
    
    if (i1 == 2)
    {
        i1 = 0;
        
        with (instance_create_depth(120, 35, -9999, oTextEngine))
        {
            Text[0] = "Skip Intro";
            Cur2 = "s_MM5";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(120, 63, -9999, oTextEngine))
        {
            Text[0] = "No Hit";
            Cur2 = "s_MM6";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(120, 91, -9999, oTextEngine))
        {
            Text[0] = "Library";
            Cur2 = "s_MML";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(120, 119, -9999, oTextEngine))
        {
            Text[0] = "Return_i5";
            Cur2 = "s_MM7";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
    }
    
    if (i1 == 3)
    {
        i1 = 0;
        
        with (instance_create_depth(120, 50, -9999, oTextEngine))
        {
            if (oP.Win_P)
                Text[0] = "Big Shot Bow Tie";
            else
                Text[0] = "???";
            
            Cur2 = "s_MM_I2";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(120, 78, -9999, oTextEngine))
        {
            if (oP.Win_G)
                Text[0] = "Pipis Popper";
            else
                Text[0] = "???";
            
            Cur2 = "s_MM_I3";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(120, 106, -9999, oTextEngine))
        {
            Text[0] = "Return_i5";
            Cur2 = "s_MM_I4";
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
        }
    }
    
    if (k1 != 0 && Tyme >= 75)
        k1 -= 10;
    
    if (oP.Win_NoHit)
        draw_sprite_ext(sTrop, 1, 129, 379 - k1 - 25, 0.5 + (cos(Tyme * 0.025) * 0.025), 0.5 + (cos(Tyme * 0.025) * 0.025), cos(Tyme * 0.05) * 4, c_black, 1);
    
    if (oP.Win_P && oP.Win_G)
        draw_sprite_ext(sTrop, 1, 79, 379 - k1, 0.5 + (sin(Tyme * 0.025) * 0.025), 0.5 + (sin(Tyme * 0.025) * 0.025), sin(Tyme * 0.05) * 4, c_black, 1);
    
    if (oP.Win_NoHit)
    {
        draw_sprite_ext(sTrop, 1, 124, 375 - k1 - 25, 0.5 + (cos(Tyme * 0.025) * 0.025), 0.5 + (cos(Tyme * 0.025) * 0.025), cos(Tyme * 0.05) * 4, c_white, 1);
        draw_sprite_ext(sTrop, 1, 126, 375 - k1 - 25, 0.5 + (cos(Tyme * 0.025) * 0.025), 0.5 + (cos(Tyme * 0.025) * 0.025), cos(Tyme * 0.05) * 4, c_white, 1);
        draw_sprite_ext(sTrop, 1, 125, 374 - k1 - 25, 0.5 + (cos(Tyme * 0.025) * 0.025), 0.5 + (cos(Tyme * 0.025) * 0.025), cos(Tyme * 0.05) * 4, c_white, 1);
        draw_sprite_ext(sTrop, 1, 125, 376 - k1 - 25, 0.5 + (cos(Tyme * 0.025) * 0.025), 0.5 + (cos(Tyme * 0.025) * 0.025), cos(Tyme * 0.05) * 4, c_white, 1);
        
        if (rTyme(10, Tyme))
        {
            a1 = iRan(1, 360);
            a2 = iRan(1, 40);
            
            with (instance_create_depth(125 + RotMx(a1, a2), (350 - k1) + RotMy(a1, a2 * 2), -9999, oEEF))
            {
                Seed = "SparkelSpa";
                image_xscale = 0;
                image_yscale = 0;
            }
        }
    }
    
    if (oP.Win_P && oP.Win_G)
    {
        draw_sprite_ext(sTrop, 1, 74, 375 - k1, 0.5 + (sin(Tyme * 0.025) * 0.025), 0.5 + (sin(Tyme * 0.025) * 0.025), sin(Tyme * 0.05) * 4, c_white, 1);
        draw_sprite_ext(sTrop, 1, 76, 375 - k1, 0.5 + (sin(Tyme * 0.025) * 0.025), 0.5 + (sin(Tyme * 0.025) * 0.025), sin(Tyme * 0.05) * 4, c_white, 1);
        draw_sprite_ext(sTrop, 1, 75, 374 - k1, 0.5 + (sin(Tyme * 0.025) * 0.025), 0.5 + (sin(Tyme * 0.025) * 0.025), sin(Tyme * 0.05) * 4, c_white, 1);
        draw_sprite_ext(sTrop, 1, 75, 376 - k1, 0.5 + (sin(Tyme * 0.025) * 0.025), 0.5 + (sin(Tyme * 0.025) * 0.025), sin(Tyme * 0.05) * 4, c_white, 1);
        
        if (rTyme(10, Tyme))
        {
            a1 = iRan(1, 360);
            a2 = iRan(1, 40);
            
            with (instance_create_depth(75 + RotMx(a1, a2), (375 - k1) + RotMy(a1, a2 * 2), -9999, oEEF))
            {
                Seed = "SparkelSpa";
                image_xscale = 0;
                image_yscale = 0;
            }
        }
    }
    
    if (oP.Win_NoHit)
        draw_sprite_ext(sTrop, 2, 125, 375 - k1 - 25, 0.5 + (cos(Tyme * 0.025) * 0.025), 0.5 + (cos(Tyme * 0.025) * 0.025), cos(Tyme * 0.05) * 4, c_white, 1);
    
    if (oP.Win_P && oP.Win_G)
        draw_sprite_ext(sTrop, 0, 75, 375 - k1, 0.5 + (sin(Tyme * 0.025) * 0.025), 0.5 + (sin(Tyme * 0.025) * 0.025), sin(Tyme * 0.05) * 4, c_white, 1);
}

if (StringContains(Seed, "CredPlace"))
{
    if (Tyme == 1)
    {
        p = 0;
        a4[0] = 1;
        a4[1] = 1;
        cred("The Winterer", "AU Creator£Director£Lead Artist£Writer");
        cred("Sad Bread", "Game Creator");
        cred("Creepa-Bot Inc.", "Artist£Attack ideas£Playtester£Musician");
        cred("The Joker", "Voice actor£Musician");
        cred("Astromity", "Artist£Attack ideas");
        cred("Hodgepodge", "Musician");
        cred("Wobbuffet", "3D Clouds");
        cred("Bruhassass", "Rewritten team member");
        cred("axniety", "Rewritten team member");
        cred("condorcrest", "Rewritten team member");
        cred("Redd", "Rewritten team member");
        cred("randomguyed", "Rewritten team member");
        cred("taeskull27", "Rewritten team member");
        cred("dollyglot", "Rewritten team member");
        cred("Special Thanks!", "Drama Josh£TheAdvertisement£Evil Wizard£piston£JerryTerry£Nahg");
        cred("", " £ £ £ £ ");
        cred("Return_i5", "");
    }
    
    if (rTyme(15, Tyme))
    {
        if (a3 == 0)
            a3 = 1;
        else
            a3 = 0;
    }
    
    draw_sprite_ext(sArrow1, 0, 621, 21 + (a3 * 2), a4[0], a4[0], 0, c_black, 1);
    draw_sprite_ext(sArrow1, 0, 621, 41 - (a3 * 2), a4[1], a4[1], 180, c_black, 1);
    draw_sprite_ext(sArrow1, 0, 620, 20 + (a3 * 2), a4[0], a4[0], 0, c_white, 1);
    draw_sprite_ext(sArrow1, 0, 620, 40 - (a3 * 2), a4[1], a4[1], 180, c_white, 1);
    a4[0] += (1 - a4[0]) / 10;
    a4[1] += (1 - a4[1]) / 10;
    
    if (keyboard_check_pressed(vk_up))
    {
        a4[0] = 2;
        i2--;
        
        if (i2 == -1)
            i2 = array_length(i1) - 1;
        
        if (i2 == (array_length(i1) - 2))
            i2 = array_length(i1) - 3;
    }
    
    if (keyboard_check_pressed(vk_down))
    {
        a4[1] = 2;
        i2++;
        
        if (i2 == array_length(i1))
            i2 = 0;
        
        if (i2 == (array_length(i1) - 2))
            i2 = array_length(i1) - 1;
    }
    
    if (i2 != (array_length(i1) - 1))
    {
        if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift))
            i2 = array_length(i1) - 1;
    }
    else if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift))
    {
        oP.JC = true;
        room_goto(rMainu);
    }
    
    i3 += ((i2 - i3) / 3);
    k1 = 0;
    
    with (oTextEngine)
        des(0);
    
    with (instance_create_depth(242, 30, -9999, oTextEngine))
    {
        Text[0] = "- Credits -";
        AllowKeys = false;
        Mono = true;
        StringAT = 999;
        Spez3 = "Black2Back";
    }
    
    repeat (array_length(i1))
    {
        with (instance_create_depth(34, (229 + (28 * k1)) - (28 * i3), -9999, oTextEngine))
        {
            Text[0] = other.i1[other.k1][0];
            AllowKeys = false;
            Mono = true;
            StringAT = 999;
            Spez3 = "Black2Back";
            
            if (other.k1 == other.i2)
            {
                RGB = rgb(255, 255, 255);
                Text[0] = " > " + other.i1[other.k1][0];
            }
            else
            {
                RGB = rgb(85, 85, 127.5);
            }
        }
        
        k1++;
    }
    
    k1 = 0;
    k2 = 0;
    
    repeat (string_length(i1[i2][1]))
    {
        k1++;
        
        if (string_char_at(i1[i2][1], k1) == "£")
            k2++;
    }
    
    with (instance_create_depth(300, 229 - (15 * k2), -9999, oTextEngine))
    {
        Text[0] = other.i1[other.i2][1];
        AllowKeys = false;
        Mono = true;
        StringAT = 999;
        Spez3 = "Black2Back";
    }
    
    if (i1[i2][1] != "")
        draw_sprite_ext(sWhite4, 0, 290, 240, 10.5, k2 + 1.25, 0, rgb(0, 0, 25), 0.25);
    
    k1 = 0;
    
    repeat (array_length(i1))
    {
        k4 = 0;
        
        if (k1 == i2)
            k4 = 8;
        
        draw_sprite_ext(sCredCon, k1, 18 + k4, (242 + (28 * k1)) - (28 * i3), 1, 1, 0, c_black, 1);
        draw_sprite_ext(sCredCon, k1, 16 + k4, (240 + (28 * k1)) - (28 * i3), 1, 1, 0, c_white, 1);
        k1++;
    }
}

if (StringContains(Seed, "Library"))
{
    if (Tyme == 1)
    {
        i = 0;
        i1 = 1;
        a1 = 0;
        a2 = 0;
        a5 = 19;
        CC2_a1t("Press [escape] at any time to go back to the main menu.", "Use the left and right keys to switch page.", "[Spoiler Warning]");
        CC2_a1t("''This is the first piece of concept art for the attacks.''", "Use [W,A,S,D] to move the image around.", "");
        CC2_a1t("", "- Early Scampton sprites -", " ");
        CC2_a1t(" ", "- Early pipis cannon attack -", " ");
        CC2_a1t("", "''I don't remember what happened here.''", " ");
        CC2_a1t("", "- Early train attack -", " ");
        CC2_a1t("", "- Early dummy attack -", " ");
        CC2_a1t("- Scraped slapstick attack -", "''This attack was replaced by the anvil attack.''", "");
        CC2_a1t("", "- Early anvil attack -", " ");
        CC2_a1t("", "- Early final attack -", " ");
        CC2_a1t("- Final attack concept art -", "''made by Astromity.''", "");
        CC2_a1t(" ", "- Early development drawing -", " ");
        CC2_a1t("- Early development screenshot -", "''Originally the parryable attacks were going to be orange.''", "");
        CC2_a1t(" ", "- Animation -", " ");
        CC2_a1t(" ", "- Early main menu -", " ");
        CC2_a1t(" ", "- Early development drawing -", " ");
        CC2_a1t("''There was once an idea for the UI to be placed", "on the right because of the limited spacing", "with the new perspective.''");
        CC2_a1t(" ", "- Old Menu -", " ");
        CC2_a1t("- Communication -", " ", "Use [W,A,S,D] to move the image around.");
        CC2_a1t(" ", "Press [Space] to play a failed Scampton sound", " ");
    }
    
    if (keyboard_check_pressed(vk_left) && i != 0)
    {
        i1 = 1;
        i--;
    }
    
    if (keyboard_check_pressed(vk_right) && i != a5)
    {
        i1 = 1;
        i++;
    }
    
    if (i1 == 1)
    {
        i1 = 0;
        k1 = 0;
        k2 = 0;
        k3 = 0;
        k4 = 0;
        k5 = 0;
    }
    
    if (i == 0)
    {
    }
    
    if (i == 1)
    {
        k5 = 1;
        
        if (keyboard_check(ord("A")))
            k1 += 10;
        
        if (keyboard_check(ord("D")))
            k1 -= 10;
        
        if (keyboard_check(ord("W")))
            k2 += 10;
        
        if (keyboard_check(ord("S")))
            k2 -= 10;
        
        k3 = 0;
        k4 = 0;
        
        repeat (4)
        {
            k3 = 0;
            
            repeat (5)
            {
                draw_sprite_ext(sArt3, k3 + (k4 * 5), k1 + (640 * k3 * k5), k2 + (480 * k4 * k5), k5, k5, 0, c_white, 1);
                k3++;
            }
            
            k4++;
        }
    }
    
    if (i == 2)
    {
        draw_sprite_ext(sScampt_Jump, round(Tyme / 5), 222, 263, 2, 2, 0, c_black, 0.5);
        draw_sprite_ext(sScampt_Jump3, round(Tyme / 5), 422, 263, 2, 2, 0, c_black, 0.5);
        draw_sprite_ext(Spam, 0, 322, 332, 2, 2, 0, c_black, 0.5);
        draw_sprite_ext(sScampt_Jump, round(Tyme / 5), 220, 261, 2, 2, 0, c_white, 1);
        draw_sprite_ext(sScampt_Jump3, round(Tyme / 5), 420, 261, 2, 2, 0, c_white, 1);
        draw_sprite_ext(Spam, 0, 320, 330, 2, 2, 0, c_white, 1);
    }
    
    if (i == 3)
        draw_sprite_ext(sScren, 1, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 4)
        draw_sprite_ext(sScren, 3, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 5)
        draw_sprite_ext(sScren, 4, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 6)
        draw_sprite_ext(sScren, 5, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 7)
        draw_sprite_ext(sScren, 6, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 8)
        draw_sprite_ext(sScren, 7, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 9)
        draw_sprite_ext(sScren, 8, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 10)
        draw_sprite_ext(sScrebn, 1, 0, 0, 1, 1, 0, c_white, 1);
    
    if (i == 11)
        draw_sprite_ext(sScrebn, 0, 0, 0, 1, 1, 0, c_white, 1);
    
    if (i == 12)
        draw_sprite_ext(sScren, 0, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 13)
        draw_sprite_ext(sScren, 2, -107, 0, 0.89, 0.89, 0, c_white, 1);
    
    if (i == 14)
        draw_sprite_ext(sScrebn, 2, 0, 0, 1, 1, 0, c_white, 1);
    
    if (i == 15)
        draw_sprite_ext(sScrebn, 3, 0, 0, 1, 1, 0, c_white, 1);
    
    if (i == 16)
        draw_sprite_ext(sScrebn, 4, 0, 0, 1, 1, 0, c_white, 1);
    
    if (i == 17)
    {
        if (rTyme(80, Tyme))
            k1++;
        
        if (rTyme(2, k1))
            draw_sprite_ext(sMenu_1, 0, 0, 0, 2, 2, 0, c_white, 1);
        else
            draw_sprite_ext(sMenu_1, 8, 0, 0, 2, 2, 0, c_white, 1);
    }
    
    if (i == 18)
    {
        if (keyboard_check(ord("A")))
            k1 += 5;
        
        if (keyboard_check(ord("D")))
            k1 -= 5;
        
        if (keyboard_check(ord("W")))
            k2 += 5;
        
        if (keyboard_check(ord("S")))
            k2 -= 5;
        
        draw_sprite_ext(sScreenshot, 0, -289 + k1, k2, 1, 1, 0, c_white, 1);
    }
    
    if (i == 19)
    {
        audio_pause_sound(mus_lib);
        
        if (keyboard_check(vk_space))
            a7++;
        else
            a7 = 0;
        
        if (a7 == 1)
        {
            audio_stop_sound(tlk_fail);
            sou(tlk_fail);
        }
        
        draw_sprite_ext(sScampt_Jump3, round(Tyme / 5), 322, 263, 2, 2, 0, c_black, 0.5);
        draw_sprite_ext(sScampt_Jump3, round(Tyme / 5), 320, 261, 2, 2, 0, c_white, 1);
    }
    else
    {
        audio_resume_sound(mus_lib);
    }
    
    draw_sprite_ext(sWhite3, 0, 320, 440, 18, 2, 0, rgb(0, 0, 25), 0.75);
    
    if (rTyme(15, Tyme))
    {
        if (a3 == 0)
            a3 = 1;
        else
            a3 = 0;
    }
    
    if (i != a5)
        draw_sprite_ext(sArrow1, 0, 600 - (a3 * 2), 442, 2, 2, -90, c_black, 1);
    
    if (i != 0)
        draw_sprite_ext(sArrow1, 0, 44 + (a3 * 2), 442, 2, 2, 90, c_black, 1);
    
    if (i != a5)
        draw_sprite_ext(sArrow1, 0, 598 - (a3 * 2), 440, 2, 2, -90, c_white, 1);
    
    if (i != 0)
        draw_sprite_ext(sArrow1, 0, 42 + (a3 * 2), 440, 2, 2, 90, c_white, 1);
    
    with (oTextEngine)
        des(0);
    
    with (instance_create_depth(5, 7, -9999, oTextEngine))
    {
        Text[0] = "Page " + string(other.i + 1) + " of " + string(other.a5 + 1);
        Font = sFont_Sma;
        AllowKeys = false;
        StringAT = 999;
        image_xscale = 1;
        image_yscale = 1;
        Spez3 = "Black2Back";
    }
    
    if (a1[i][2] == "")
    {
        with (instance_create_depth(320 - round(string_length(a1[i][0]) * 4.5), 420, -9999, oTextEngine))
        {
            Text[0] = other.a1[other.i][0];
            font = sFont_Sma;
            AllowKeys = false;
            StringAT = 999;
            image_xscale = 1;
            image_yscale = 1;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(320 - round(string_length(a1[i][1]) * 4.5), 448, -9999, oTextEngine))
        {
            Text[0] = other.a1[other.i][1];
            font = sFont_Sma;
            AllowKeys = false;
            StringAT = 999;
            image_xscale = 1;
            image_yscale = 1;
            Spez3 = "Black2Back";
        }
    }
    else
    {
        with (instance_create_depth(320 - round(string_length(a1[i][0]) * 4.5), 416, -9999, oTextEngine))
        {
            Text[0] = other.a1[other.i][0];
            font = sFont_Sma;
            AllowKeys = false;
            StringAT = 999;
            image_xscale = 1;
            image_yscale = 1;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(320 - round(string_length(a1[i][1]) * 4.5), 434, -9999, oTextEngine))
        {
            Text[0] = other.a1[other.i][1];
            font = sFont_Sma;
            AllowKeys = false;
            StringAT = 999;
            image_xscale = 1;
            image_yscale = 1;
            Spez3 = "Black2Back";
        }
        
        with (instance_create_depth(320 - round(string_length(a1[i][2]) * 4.5), 452, -9999, oTextEngine))
        {
            Text[0] = other.a1[other.i][2];
            font = sFont_Sma;
            AllowKeys = false;
            StringAT = 999;
            image_xscale = 1;
            image_yscale = 1;
            Spez3 = "Black2Back";
        }
    }
}

if (StringContains(Seed, "DarkOut"))
{
    if (oAlways.Marselo >= 1 && oAlways.Marselo < 21)
        draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, 0.25);
    
    if (oAlways.Marselo >= 21 && oAlways.Marselo < 41)
        draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, 0.5);
    
    if (oAlways.Marselo >= 41 && oAlways.Marselo < 61)
        draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, 0.75);
    
    if (oAlways.Marselo >= 61)
        draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, 1);
}

if (StringContains(Seed, "(Ghi)"))
{
    if (Tyme == 1)
        image_alpha = 0;
    
    if (Tyme <= 10)
        image_alpha += 0.1;
}

if (StringContains(Seed, "(Ghi3)"))
{
    if (Tyme == 1)
        image_alpha = 0;
    
    if (Tyme <= 50)
        image_alpha += 0.02;
}

if (StringContains(Seed, "Ghi2"))
{
    if (Tyme > (100 - Hje) && Tyme <= Hje)
        image_alpha -= 0.01;
}

if (StringContains(Seed, "(Ghi4)"))
{
    if (Tyme <= 20)
        image_alpha -= 0.05;
}

if (StringContains(Seed, "(AnimatorScampton)"))
{
    if (oAlways.Mesg != "Sca_3" && oAlways.Mesg != "Sca_4" && oAlways.Mesg != "Sca_5" && oAlways.Mesg != "Sca_6" && oAlways.Mesg != "Sca_7")
    {
        if (tymeEQ(Tyme, 4, Hje, 0))
        {
            draw_sprite_ext(sScamp_FaceINT, 8, 300, 176, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 9, 340, 176, 2, 2, 0, c_white, 1);
        }
        
        if (tymeEQ(Tyme, 4, Hje, 1))
        {
            draw_sprite_ext(sScamp_FaceINT, 8, 300, 172, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 9, 340, 172, 2, 2, 0, c_white, 1);
        }
        
        if (tymeEQ(Tyme, 4, Hje, 2) || tymeEQ(Tyme, 4, Hje, 4))
        {
            draw_sprite_ext(sScamp_FaceINT, 8, 300, 166, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 9, 340, 166, 2, 2, 0, c_white, 1);
        }
        
        if (tymeEQ(Tyme, 4, Hje, 3))
        {
            draw_sprite_ext(sScamp_FaceINT, 8, 300, 156, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 9, 340, 156, 2, 2, 0, c_white, 1);
        }
        
        if (tymeEQ(Tyme, 4, Hje, 5) || tymeEQ(Tyme, 4, Hje, 7) || Tyme > (Hje + 28))
        {
            depth = -9999;
            draw_sprite_ext(sScamp_FaceINT, 6, 308, 162, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 7, 330, 164, 2, 2, 0, c_white, 1);
        }
        
        if (tymeEQ(Tyme, 4, Hje, 6) || tymeEQ(Tyme, 4, Hje, 8))
        {
            draw_sprite_ext(sScamp_FaceINT, 6, 306, 162, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 7, 328, 164, 2, 2, 0, c_white, 1);
        }
        
        if (Tyme == (Hje + 20))
            sou(96);
        
        if (Tyme == (Hje + 56))
        {
            with (instance_create_depth(100, 100, -9999, oTextEngine))
            {
                JustText = true;
                Seed = "(TB)@Voicer";
                EndMesg = "Sca_1";
                Text[0] = "* HELLO HELLO [[Valued Players]]!";
                _Voice[0] = snd_scampton_voice;
            }
        }
    }
    
    if (oAlways.Mesg == "Sca_2")
    {
        if (oAlways.MM_Cursor == "scaI_0")
            draw_sprite_ext(sScamp_FaceINT, 10, 320, 402, 2, 2, 0, c_white, 1);
        
        if (oAlways.MM_Cursor == "scaI_1")
            draw_sprite_ext(sScamp_FaceINT, 10, 70, 402, 2, 2, 0, c_white, 1);
        
        if (oAlways.MM_Cursor == "scaI_2")
            draw_sprite_ext(sScamp_FaceINT, 10, 480, 402, 2, 2, 0, c_white, 1);
    }
    
    if (oAlways.Mesg == "Sca_3" || oAlways.Mesg == "Sca_4")
    {
        if (i1 == 0)
        {
            i1 = 1;
            Tyme = 1;
        }
        
        if (tymeEQ(Tyme, 4, 0, 0))
        {
            draw_sprite_ext(sScamp_FaceINT, 6, 308, 162, 2, 2, 0, c_white, 1);
            draw_sprite_ext(sScamp_FaceINT, 7, 330, 164, 2, 2, 0, c_white, 1);
        }
        
        if (tymeEQ(Tyme, 4, 0, 1))
        {
            draw_sprite_ext(sScamp_FaceINT, 6, 308, 162, 2, 2, 0, c_white, 0.75);
            draw_sprite_ext(sScamp_FaceINT, 7, 330, 164, 2, 2, 0, c_white, 0.75);
        }
        
        if (tymeEQ(Tyme, 4, 0, 2))
        {
            draw_sprite_ext(sScamp_FaceINT, 6, 308, 162, 2, 2, 0, c_white, 0.5);
            draw_sprite_ext(sScamp_FaceINT, 7, 330, 164, 2, 2, 0, c_white, 0.5);
        }
        
        if (tymeEQ(Tyme, 4, 0, 3))
        {
            draw_sprite_ext(sScamp_FaceINT, 6, 308, 162, 2, 2, 0, c_white, 0.25);
            draw_sprite_ext(sScamp_FaceINT, 7, 330, 164, 2, 2, 0, c_white, 0.25);
        }
    }
}

if (StringContains(Seed, "(AnimatorScampton_2)"))
{
    if (oAlways.Mesg == "Sca_1")
    {
        if (i1 == 0)
        {
            i1 = 1;
            Tyme = 0;
            i2[0] = 320;
            i2[1] = 163;
            i2[2] = 0;
        }
        
        with (oTextEngine)
        {
            if (Spez == "HeadBJE")
                other.i3 = AtText;
        }
        
        if (tymeEQ(Tyme, 16, 40, 0))
            draw_sprite_ext(sScamp_FaceINT, 0, 320, 163 + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 0.25);
        
        if (tymeEQ(Tyme, 16, 40, 1))
            draw_sprite_ext(sScamp_FaceINT, 0, 320, 163 + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 0.5);
        
        if (tymeEQ(Tyme, 16, 40, 2))
            draw_sprite_ext(sScamp_FaceINT, 0, 320, 163 + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 0.75);
        
        if (tymeEQ(Tyme, 16, 40, 3) || Tyme > 88)
            draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 1);
        
        if (i3 == 1)
        {
            i2[0] += (296 - i2[0]) / 3;
            i2[1] += (151 - i2[1]) / 3;
            i2[2] = 1;
        }
        
        if (i3 == 2)
        {
            i2[0] += (320 - i2[0]) / 3;
            i2[1] += (163 - i2[1]) / 3;
            i2[2] = 0;
        }
        
        if (i3 == 3 && i4 == 0)
        {
            i4 = 1;
            audio_play_sound(snd_laughs, -999, true);
        }
        
        if ((i3 == 3 || i3 == 4) && rTyme(3, Tyme))
        {
            i2[0] += ((320 + (cos(oP.Tyme * 0.25) * 5)) - i2[0]) / 1.5;
            i2[1] += ((153 + (sin(oP.Tyme * 0.5) * 10)) - i2[1]) / 1.5;
            i2[2] = 3;
        }
        
        if (Tyme == 110)
        {
            with (instance_create_depth(100, 100, -9999, oTextEngine))
            {
                JustText = true;
                Seed = "(TB)@Voicer";
                Spez = "HeadBJE";
                EndMesg = "Sca_2";
                SkipLine = "(0)";
                Text[0] = "* WOULD YOU LIKE TO [[Continue@from Save File]] OR";
                _Voice[0] = snd_scampton_voice;
                Text[1] = "* We got your color things,@€€€€€€€€€mister.";
                _Voice[1] = 98;
                Text[2] = "* HOLLY [[Hungry Hippos]] YOU@ACTUALLY [[Objective@Completed]]?!!";
                _Voice[2] = snd_scampton_voice;
                Text[3] = "* [[Good!]]€€€€€€€€€£* [[GREAT!!]]€€€€€€€€€£* [[AMAZING!!!!]]";
                _Voice[3] = snd_scampton_voice;
                Text[4] = "* WHAT'RE YOU [[High Ping]]@[[Galoombas]] WAITING FOR?!!€€€€€€€€€£* [[Recieve your free prize]]!!";
                _Voice[4] = snd_scampton_voice;
            }
        }
    }
    
    if (oAlways.Mesg == "Sca_2")
    {
        if (i1 == 1)
        {
            i1 = 2;
            oAlways.MM_Cursor = "scaI_0";
            audio_stop_sound(snd_laughs);
            
            with (instance_create_depth(500, 352, -7777, oTextEngine))
            {
                Text[0] = "£Do not";
                Cur2 = "scaI_2";
                AllowKeys = false;
                Mono = true;
                BC = false;
                StringAT = 999;
            }
            
            with (instance_create_depth(100, 348, -7777, oTextEngine))
            {
                Text[0] = "£     Use Key";
                Cur2 = "scaI_1";
                AllowKeys = false;
                Mono = true;
                BC = false;
                StringAT = 999;
                Seed = "(TB)";
            }
        }
        
        i2[0] += (320 - i2[0]) / 3;
        i2[1] += (163 - i2[1]) / 3;
        i2[2] = 0;
        
        if (tymeEQ(Tyme, 16, 40, 3) || Tyme > 88)
            draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 1);
    }
    
    if (oAlways.Mesg == "Sca_2w")
    {
        if (oAlways.MM_Cursor == "jaja_1")
        {
            if (i1 == 2)
            {
                i1 = 3;
                Tyme = 0;
                audio_play_sound(snd_laughs, -999, true);
            }
            
            if (rTyme(3, Tyme))
            {
                i2[0] += ((320 + (cos(oP.Tyme * 0.25) * 5)) - i2[0]) / 1.5;
                i2[1] += ((153 + (sin(oP.Tyme * 0.5) * 10)) - i2[1]) / 1.5;
                i2[2] = 3;
            }
        }
        
        if (oAlways.MM_Cursor == "jaja_2")
        {
            if (i1 == 2)
                i1 = 3;
        }
        
        draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 1);
    }
    
    if (oAlways.Mesg == "Sca_3")
    {
        if (i1 == 3)
        {
            i1 = 4;
            Tyme = 1;
            audio_stop_sound(snd_laughs);
        }
        
        if (rTyme(3, Tyme))
        {
            i2[0] += ((320 + (cos(oP.Tyme * 0.25) * 5)) - i2[0]) / 1.5;
            i2[1] += ((153 + (sin(oP.Tyme * 0.5) * 10)) - i2[1]) / 1.5;
            i2[2] = 3;
        }
    }
    
    if (oAlways.Mesg == "Sca_4")
    {
        if (i1 == 3)
        {
            i1 = 4;
            Tyme = 1;
        }
    }
    
    if (oAlways.Mesg == "Sca_3" || oAlways.Mesg == "Sca_4")
    {
        if (tymeEQ(Tyme, 4, 0, 0))
            draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 1);
        
        if (tymeEQ(Tyme, 4, 0, 1))
            draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 0.75);
        
        if (tymeEQ(Tyme, 4, 0, 2))
            draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 0.5);
        
        if (tymeEQ(Tyme, 4, 0, 3))
            draw_sprite_ext(sScamp_FaceINT, i2[2], i2[0], i2[1] + (sin(oP.Tyme * 0.05) * 3), 2, 2, 0, c_white, 0.25);
        
        if (Tyme == 64)
        {
            with (instance_create_depth(100, 100, -9999, oTextEngine))
            {
                JustText = true;
                Seed = "(TB)";
                Spez = "HeadBJE";
                EndMesg = "Sca_5";
                
                if (oAlways.MM_Cursor == "jaja_1")
                    Text[0] = "* You used the ChromaKey.";
                else
                    Text[0] = "* You used the ChromaKey@for some reason.";
            }
        }
    }
    
    if (oAlways.Mesg == "Sca_5")
    {
        if (i1 == 4)
        {
            i1 = 5;
            Tyme = 0;
        }
        
        if (Tyme == 16)
        {
            with (instance_create_depth(-6, -6, -9999, oCC2))
            {
                sprite_index = SC_2;
                image_index = 1;
                image_xscale = 2;
                image_yscale = 2;
                Seed = "DrawSelf@KeyPart@(Ghi)@ScaTimeDie";
            }
        }
        
        if (Tyme == 32)
        {
            with (instance_create_depth(6, -6, -9999, oCC2))
            {
                sprite_index = SC_2;
                image_index = 2;
                image_xscale = 2;
                image_yscale = 2;
                Seed = "DrawSelf@KeyPart@(Ghi)@ScaTimeDie";
            }
        }
        
        if (Tyme == 48)
        {
            with (instance_create_depth(0, 6, -9999, oCC2))
            {
                sprite_index = SC_2;
                image_index = 3;
                image_xscale = 2;
                image_yscale = 2;
                Seed = "DrawSelf@KeyPart@(Ghi)@ScaTimeDie";
            }
        }
        
        if (Tyme == 96)
        {
            audio_sound_pitch(snd_chargeshot_charge, 0);
            sou(86);
            
            with (instance_create_depth(0, 0, -12000, oCC2))
            {
                sprite_index = SC_3;
                image_index = 1;
                image_xscale = 2;
                image_yscale = 2;
                Seed = "DrawSelf@(Ghi3)@ScaTimeDie";
            }
        }
        
        if (Tyme >= 96)
        {
            i9 += 0.05;
            
            if (i9 > 1)
                i9 = 1;
            
            audio_sound_pitch(snd_chargeshot_charge, i9);
        }
        
        if (Tyme == 146)
        {
            sou(78);
            
            with (instance_create_depth(0, 0, -15000, oCC2))
            {
                sprite_index = sWhite;
                image_index = 0;
                image_xscale = 100;
                image_yscale = 100;
                Seed = "DrawSelf@(Ghi)@KeyGlow";
            }
            
            des(0);
        }
    }
}

if (StringContains(Seed, "KeyPart"))
{
    if (Tyme > 5 && rTyme(4, Tyme))
    {
        i1 += 1;
        
        if (image_index == 1)
        {
            if (y != 0)
            {
                if (i1 <= 2)
                {
                    x += 1;
                    y += 1;
                }
                else
                {
                    x += 2;
                    y += 2;
                }
            }
        }
        
        if (image_index == 2)
        {
            if (y != 0)
            {
                if (i1 <= 2)
                {
                    x -= 1;
                    y += 1;
                }
                else
                {
                    x -= 2;
                    y += 2;
                }
            }
        }
        
        if (image_index == 3)
        {
            if (y != 0)
            {
                if (i1 <= 2)
                    y -= 1;
                else
                    y -= 2;
            }
        }
        
        if (i1 == 4)
            sou(10);
    }
}

if (StringContains(Seed, "KeyGlow"))
{
    if (Tyme == 50)
    {
        with (oCC2)
        {
            if (StringContains(Seed, "Bars"))
                image_index += 2;
            
            if (StringContains(Seed, "ScaTimeDie"))
                des(0);
        }
    }
    
    if (Tyme > 50)
        image_alpha -= 0.05;
    
    if (Tyme == 150)
    {
        audio_sound_pitch(snd_chain_extend, 0.75);
        audio_play_sound(snd_chain_extend, -999, true);
    }
    
    if (Tyme > 150 && rTyme(2, Tyme))
    {
        i1 += 1;
        
        with (oCC2)
        {
            if (StringContains(Seed, "Bars"))
            {
                if (image_index == 2)
                {
                    if (i1 <= 2)
                        x -= 1;
                    else
                        x -= 2;
                }
                else if (i1 <= 2)
                {
                    x += 1;
                }
                else
                {
                    x += 2;
                }
            }
        }
    }
    
    if (Tyme == 323)
    {
        audio_stop_sound(snd_chain_extend);
        audio_sound_pitch(snd_chain_extend, 1);
    }
    
    if (Tyme == 400)
    {
        with (instance_create_depth(300, 440, 75, oCC2))
        {
            image_xscale = 2;
            image_yscale = 2;
            Seed = "PepWalkCC2";
            sprite_index = sNo_Walk1;
        }
    }
    
    if (Tyme == 400)
    {
        with (instance_create_depth(340, 480, 75, oCC2))
        {
            image_xscale = 2;
            image_yscale = 2;
            Seed = "PepWalkCC3";
            sprite_index = sCh_Walk1;
        }
    }
    
    if (Tyme == 400)
    {
        with (instance_create_depth(320, 400, 75, oCC2))
        {
            image_xscale = 2;
            image_yscale = 2;
            Seed = "PepWalkCC1";
            sprite_index = sAs_Walk1;
        }
    }
    
    if (Tyme == 575)
    {
        with (instance_create_depth(100, 100, -9999, oTextEngine))
        {
            JustText = true;
            Seed = "(TB)@Voicer";
            Spez = "BeefEnter";
            EndMesg = "Sca_7";
            Text[0] = "* Do you think it's safe?";
            _Voice[0] = 98;
            FaceT[0] = 0;
            Text[1] = "* Are you scared?";
            _Voice[1] = 90;
            FaceT[1] = 6;
            Text[2] = "* Of course I am,€€€€€€€€€@he's a weird gremlin@guy in jail.";
            _Voice[2] = 98;
            FaceT[2] = 2;
            Text[3] = "* Are you NOT scared?";
            _Voice[3] = 98;
            FaceT[3] = 10;
            Text[4] = "* ...";
            _Voice[4] = 58;
            FaceT[4] = 8;
            Text[5] = "* Maybe a little...";
            _Voice[5] = 90;
            FaceT[5] = 9;
            Text[6] = "* Azz,€€€€€€€€€ what do we do?";
            _Voice[6] = 90;
            FaceT[6] = 7;
        }
    }
    
    if (oAlways.Mesg == "Sca_6")
    {
        with (instance_create_depth(0, 0, -9999, oCC2))
            Seed = "Intro1Fade";
        
        des(0);
    }
}

if (StringContains(Seed, "PepWalkCC1"))
{
    with (oTextEngine)
    {
        if (Spez == "BeefEnter")
            other.a = AtText;
    }
    
    if (Tyme == 1)
    {
        a = -1;
        i1 = (320 - x) / 75;
        i2 = (240 - y) / 75;
    }
    
    if (Tyme >= 1 && Tyme <= 75)
    {
        if (Tyme == 75)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        x += i1;
        y += i2;
    }
    
    if (oAlways.Mesg == "Sca_7")
    {
        a1++;
        
        if (a1 == 1)
        {
            sprite_index = sAs_Stand1;
            image_index = 1;
        }
        
        if (a1 == 75)
            image_index = 2;
        
        if (a1 == 200)
        {
            image_index = 3;
            sou(44);
        }
        
        if (a1 >= 200)
        {
            if (rTyme(8, a1))
            {
                if (image_index == 3)
                    image_index = 4;
                else
                    image_index = 3;
            }
        }
        
        if (a1 == 300)
        {
            with (instance_create_depth(100, 100, -9999, oTextEngine))
            {
                JustText = true;
                Seed = "(TB)@Voicer";
                Spez = "BeefEnter2";
                EndMesg = "Sca_6";
                Text[0] = "* Works for me!";
                _Voice[0] = 90;
                FaceT[0] = 4;
            }
        }
    }
    
    if (oAlways.Mesg == "Sca_6" && rTyme(2, Tyme))
    {
        sprite_index = sAs_Walk2;
        a = -1;
        y--;
        image_speed = 1;
    }
    
    draw_self();
}

if (StringContains(Seed, "PepWalkCC2"))
{
    with (oTextEngine)
    {
        if (Spez == "BeefEnter")
            other.a = AtText;
    }
    
    if (Tyme == 1)
    {
        a = -1;
        i1 = (260 - x) / 75;
        i2 = (260 - y) / 75;
    }
    
    if (Tyme >= 1 && Tyme <= 75)
    {
        if (Tyme == 75)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        x += i1;
        y += i2;
    }
    
    if (a == 0)
    {
        sprite_index = sNo_Walk2;
        image_index = 0;
    }
    
    if (a == 1)
    {
        sprite_index = sNo_Walk2;
        image_index = 0;
    }
    
    if (a == 2)
    {
        sprite_index = sNo_Walk1;
        image_index = 0;
    }
    
    if (a == 3)
    {
        sprite_index = sNo_Walk2;
        image_index = 0;
    }
    
    if (a == 4)
    {
        sprite_index = sNo_Walk2;
        image_index = 0;
    }
    
    if (a == 5)
    {
        sprite_index = sNo_Walk2;
        image_index = 0;
    }
    
    if (a == 6)
    {
        sprite_index = sNo_Walk1;
        image_index = 0;
    }
    
    if (oAlways.Mesg == "Sca_6" && rTyme(2, Tyme))
    {
        a = -1;
        y--;
        image_speed = 1;
    }
    
    draw_self();
}

if (StringContains(Seed, "PepWalkCC3"))
{
    with (oTextEngine)
    {
        if (Spez == "BeefEnter")
            other.a = AtText;
    }
    
    if (Tyme == 1)
    {
        a = -1;
        i1 = (380 - x) / 75;
        i2 = (260 - y) / 75;
    }
    
    if (Tyme >= 1 && Tyme <= 75)
    {
        if (Tyme == 75)
        {
            image_speed = 0;
            image_index = 0;
        }
        
        x += i1;
        y += i2;
    }
    
    if (oAlways.Mesg == "Sca_6" && rTyme(2, Tyme))
    {
        a = -1;
        y--;
        image_speed = 1;
    }
    
    draw_self();
}

if (StringContains(Seed, "Intro1Fade"))
{
    i1 += 0.02;
    draw_sprite_ext(sGreen, 0, 0, 0, 100, 100, 0, c_black, i1);
    
    if (i1 >= 1)
    {
        room_goto(rIntro_2);
        des(0);
    }
}

if (StringContains(Seed, "(PepIn2)"))
{
    if (Tyme == 1)
    {
        a4 = 1;
        i3[0] = 0;
        i3[1] = 0;
        i3[2] = 0;
        i3[3] = 0;
        i3[4] = 0;
        i3[5] = 0;
        a3[0] = 0;
        a3[1] = 0;
        a3[2] = 0;
        a3[3] = 0;
        a3[4] = 0;
    }
    
    if (Tyme < 46 && rTyme(2, Tyme))
        i1 += 2;
    
    if (Tyme < 46)
    {
        draw_sprite_ext(sAs_Walk3, round(oP.Tyme / 8), 100 + i1, 266 - i3[3], 2, 2, 0, c_white, 1);
        draw_sprite_ext(sNo_Walk2, round(oP.Tyme / 8), 50 + i1, 221 - i3[3], 2, 2, 0, c_white, 1);
        draw_sprite_ext(sCh_Walk2, round(oP.Tyme / 8), 50 + i1, 311 - i3[3], 2, 2, 0, c_white, 1);
    }
    else if (oAlways.Mesg == "Mesg_1")
    {
        draw_sprite_ext(sOWdown, 3, 100 + i1, 266 - i3[3], 2, 2, 0, c_white, 1);
        draw_sprite_ext(sOWdown, 1, 50 + i1, 221 - i3[3], 2, 2, 0, c_white, 1);
        draw_sprite_ext(sOWdown, 4, 50 + i1, 311 - i3[3], 2, 2, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sAs_Stand2, round(oP.Tyme / 8), 100 + i1, 266 - i3[3], 2, 2, 0, c_white, 1);
        draw_sprite_ext(sNo_Walk2, 0, 50 + i1, 221 - i3[3], 2, 2, 0, c_white, 1);
        draw_sprite_ext(sCh_Walk2, 0, 50 + i1, 311 - i3[3], 2, 2, 0, c_white, 1);
    }
    
    if (a6 == 0)
        draw_sprite_ext(sShadow, 0, 430, 260, 62, 33, 0, c_black, i3[0] * 0.05);
    
    i2[0] = 400;
    i2[1] = 250;
    
    if (a2 == 2)
        i2[2] = sin(Tyme * 0.25);
    else
        i2[2] = sin(Tyme * 0.05);
    
    with (oTextEngine)
    {
        if (Spez == "BeefEnter")
            other.a1 = AtText;
        
        if (Spez == "BeefEnter2")
            other.a1 = AtText;
    }
    
    draw_sprite_ext(sShadow, 0, i2[0] - 2, i2[1] + 10, 4 + (i2[2] * 2), 3, 0, c_black, 1);
    
    if (a == 0)
    {
        if (a1 == 1)
            a2 = 1;
    }
    else
    {
        if (a1 == 0)
            a2 = 0;
        
        if (a1 == 4)
            a4 = -1;
        
        if (a1 == 5)
        {
            a2 = 1;
            a4 = 1;
        }
        
        if (a1 == 7)
            a2 = 0;
        
        if (a1 == 8)
            a2 = 1;
        
        if (a1 == 9)
            a2 = 0;
        
        if (a1 == 10)
            a2 = 2;
        
        if (a1 == 11)
            a2 = 0;
        
        if (a1 == 13)
        {
            a2 = 2;
            a4 = -1;
        }
        
        if (a1 == 15)
            a4 = 1;
        
        if (a1 == 17)
            a2 = 3;
        
        if (a1 == 19)
            a2 = 0;
        
        if (a1 == 20)
            a2 = 2;
    }
    
    if (a2 == 0)
        draw_sprite_ext(sScams, 2, i2[0], ((i2[1] - 4) + (i2[2] * 10)) - i3[1], 2 * a4, 2, 0, c_white, 1);
    
    if (a2 == 1)
        draw_sprite_ext(sScamDance, round(Tyme / 5), i2[0], ((i2[1] - 4) + (i2[2] * 10)) - i3[1], 2 * a4, 2, 0, c_white, 1);
    
    if (a2 == 2)
    {
        if (rTyme(2, Tyme))
        {
            a3[1] = iRan(-1, 1) * 2;
            a3[2] = iRan(-1, 1) * 2;
        }
        
        if (rTyme(8, Tyme))
        {
            if (a3[0] == 0)
                a3[0] = 1;
            else
                a3[0] = 0;
        }
        
        draw_sprite_ext(sScams, 15 + a3[0], i2[0] + a3[1], (((i2[1] - 4) + (i2[2] * 10)) - i3[1]) + a3[2], 2 * a4, 2, 0, c_white, 1);
    }
    
    if (a2 == 3)
        draw_sprite_ext(sScams, 17, i2[0], ((i2[1] - 4) + (i2[2] * 10)) - i3[1], 2 * a4, 2, 0, c_white, 1);
    
    if (Tyme == 46)
    {
        with (instance_create_depth(100, 100, -9999, oTextEngine))
        {
            JustText = true;
            Seed = "(TB)@Voicer";
            Spez = "BeefEnter";
            EndMesg = "Mesg_2";
            textAtri(0, "* [[Lightbringers!]]€€€€€€€€€£* YOU'RE HERE!", snd_scampton_voice, "x");
            textAtri(1, "* I'M SO EXCITED,€€€€€€€€€ I COULD [Die]!!", snd_scampton_voice, "x");
        }
    }
    
    if (oAlways.Mesg == "Mesg_2")
    {
        a++;
        
        if (a == 1)
        {
            sou(22);
            a2 = 2;
        }
        
        if (a == 100)
        {
            with (instance_create_depth(100, 100, -9999, oTextEngine))
            {
                JustText = true;
                Seed = "(TB)@Voicer";
                Spez = "BeefEnter2";
                EndMesg = "Mesg_1";
                Spez3 = "Papu";
                textAtri(0, "* Can I go home now?", snd_scampton_voice, "x");
                textAtri(1, "* Not before you give@us that prize.", 90, 11);
                textAtri(2, "* And what's your@deal anyway?", 90, 9);
                textAtri(3, "* Why are you here?", 90, 12);
                textAtri(4, "* YOU'RE...€€€€€€€€€ ASKING WHAT MY...", snd_scampton_voice, "x");
                textAtri(5, "* [[DEAL]]?...€€€€€€   IS?", snd_scampton_voice, "x");
                textAtri(6, "* WHY,€€€€€€€€€ [[I'm nothing but a@simple servant...]]", snd_scampton_voice, "x");
                textAtri(7, "* A [[connoisseur]]€€€€€€€€€ OF@[[mindless entertainment.]]", snd_scampton_voice, "x");
                textAtri(8, "* [[Imprisoned...]]€€€€€€€€€ FOR BEING@WAY TOO FUNNY!!!", snd_scampton_voice, "x");
                textAtri(9, "* And your...€€€€€€   PRIZE???", snd_scampton_voice, "x");
                textAtri(10, "* WHY SHOULD I GIVE IT TO YOU?", snd_scampton_voice, "x");
                textAtri(11, "* We broke you out@of prison...", 98, 0);
                textAtri(12, "* We had a whole fetch@quest and everything...", 98, 0);
                textAtri(13, "* [[Child's play!]]€€€£* [[CHILD'S PLAY!!]]€€€£* [[CHILDREN'S GAME!!!]]", snd_scampton_voice, "x");
                textAtri(14, "* SCAMPTON€€€€€€€€€ [THE GREAT] €€€€€€€€€DOESN'T@OWE ANYONE€€€€€€€€€ ANYTHING!!!", snd_scampton_voice, "x");
                textAtri(15, "* YOU CALL YOURSELVES HEROES?£€€€€€€€€€* YOU'RE JUST A BUNCH OF CLOWNS!", snd_scampton_voice, "x");
                textAtri(16, "* [Big] CLOWNS!€€€€€€€€€£* WITH [Big] HATS!€€€€€€€€€£* THE WHOLE SHABANG!", snd_scampton_voice, "x");
                textAtri(17, "* Clowns that need to be caged!!!€€€€€€€€€£* Jailed!!!€€€€€€€€€£* Discarded...", snd_scampton_voice, "x");
                textAtri(18, "* I see where this@is going.", 90, 11);
                textAtri(19, "* YOU MIGHT€€€€€€€€€ [[See]]€€€€€€€€€ WHERE THIS@IS GOING...", snd_scampton_voice, "x");
                textAtri(20, "* BUT HAVE NOT YET SEEN,€€€€€€€€€@FOR WHAT IS COMING!!!", snd_scampton_voice, "x");
            }
        }
    }
    
    if (oAlways.Mesg == "Mesg_1")
    {
        a2 = 0;
        i3[1] += i3[0] * 0.5;
        audio_stop_sound(circus);
        audio_stop_sound(M);
        
        if (rTyme(2, i3[0]) && (i3[2] / 20) != 34)
        {
            if (rTyme(3, i3[2] / 20))
            {
                sou(96);
                oAlways.ShakePower = 2;
                oAlways.ShakeTyme = 5;
            }
            
            with (instance_create_depth(650 - i3[2], 220, -1000, oCC2))
            {
                Seed = "(DSDS1)@(RailAp)";
                sprite_index = sRail2;
                image_index = iRan(0, 5);
                image_xscale = 2;
                image_yscale = 2;
            }
            
            i3[2] += 20;
        }
        
        i3[0]++;
    }
    
    if ((i3[2] / 20) == 23)
    {
        sou(69);
        oAlways.ShakePower = 20;
        oAlways.ShakeTyme = 20;
    }
    
    if ((i3[2] / 20) >= 23)
        i3[3] += 20;
    
    if ((i3[3] / 20) >= 75 && i3[4] < 25)
    {
        if (rTyme(2, i3[3] / 20))
            i3[4] += 1;
        
        oAlways.view_y -= i3[4];
    }
    
    if (i3[4] == 25)
    {
        a6 = 1;
        draw_sprite_ext(sTempPepRoll, 1, 320, -650 + (i3[5] * 15), 2, 2, 0, c_white, 1);
        draw_sprite_ext(sWhite3, 0, 320, -700 + (i3[5] * 15), 2, 10, 0, c_black, i5 * 0.1);
        sprite_index = sSymb2;
        image_index = 4;
        image_xscale = 1;
        image_yscale = 1;
        image_angle = 90;
        GlowSiz = 0.5;
        
        if (i8 < 70)
        {
            drawPulse(320, -75 - (i3[5] * 15));
            draw_sprite_ext(sSymb2, 4, 320, -75 - (i3[5] * 15), 1, 1, 90, rgb(0, 255, 255), 1);
        }
        
        if (i8 < 120)
        {
            drawPulse(320, -25 - (i3[5] * 15));
            draw_sprite_ext(sSymb2, 4, 320, -25 - (i3[5] * 15), 1, 1, 90, rgb(0, 255, 255), 1);
        }
        
        if (i8 < 170)
        {
            drawPulse(320, 25 - (i3[5] * 15));
            draw_sprite_ext(sSymb2, 4, 320, 25 - (i3[5] * 15), 1, 1, 90, rgb(0, 255, 255), 1);
        }
        
        if (i8 == 60)
        {
            sou(snd_Parry);
            
            with (instance_create_depth(320, -75 - (i3[5] * 15), -20000, oEEF))
                Seed = "ParrySmoke";
        }
        
        if (i8 == 110)
        {
            sou(snd_Parry);
            
            with (instance_create_depth(320, -25 - (i3[5] * 15), -20000, oEEF))
                Seed = "ParrySmoke";
        }
        
        if (i8 == 160)
        {
            sou(snd_Parry);
            
            with (instance_create_depth(320, 25 - (i3[5] * 15), -20000, oEEF))
                Seed = "ParrySmoke";
        }
        
        if (i3[5] < 17)
        {
            if (rTyme(2, i3[5] - 1))
            {
                with (instance_create_depth(320, -650 + (i3[5] * 15), -200 - (i3[5] * 10), oEEF))
                {
                    Seed = "BallBallBall";
                    sprite_index = sTempPepRoll;
                    image_speed = 0;
                    image_index = other.i3[5] / 2;
                }
            }
            
            i3[5]++;
        }
        
        if (i3[5] >= 17)
        {
            i4++;
            
            if (i4 == 1)
                sou(10);
            
            if (i4 == 1 || i4 == 2)
                draw_sprite_ext(sSoul, 1, 320, -650 + (i3[5] * 15), 1, 1, -90, c_white, 1);
            
            if (i4 > 2)
            {
                if (i4 >= 100)
                {
                    if (i4 == 100)
                    {
                        oAlways.ShakePower = 4;
                        oAlways.ShakeTyme = 10;
                        sou(snd_soul_mode);
                        sou(snd_soul_mode);
                    }
                    
                    if (i4 == 200 && i6 == 0)
                    {
                        oAlways.ShakePower = 2;
                        oAlways.ShakeTyme = 5;
                        sou(96);
                        
                        with (instance_create_depth(250, -425, -9999, oTextEngine))
                        {
                            Text[0] = "Press [Z] to Parry";
                            image_xscale = 1;
                            image_yscale = 1;
                            BC = false;
                            StringAT = 999;
                            Spez = "pop";
                        }
                    }
                    
                    i5 += 0.2;
                    
                    if (keyboard_check(ord("Z")) || keyboard_check(vk_enter))
                        i7++;
                    else
                        i7 = 0;
                    
                    if (i7 == 1)
                    {
                        i6++;
                        i9 = 1.5;
                        
                        if (rTyme(2, i6))
                            k2 -= 360;
                        else
                            k2 += 360;
                        
                        with (oTextEngine)
                        {
                            if (Spez == "pop")
                                des(0);
                        }
                    }
                    
                    k1 += ((k2 - k1) / 10);
                    
                    if (i6 == 1 && i8 < 70)
                        i8 += 10;
                    
                    if (i6 == 2 && i8 < 120)
                        i8 += 10;
                    
                    if (i6 > 2)
                        i8 += 10;
                    
                    draw_sprite_ext(sSoul, 7, 320, -650 + i8 + (i3[5] * 15), 1 + i5, 1 + i5, -90 + k1, c_white, 1 - (i5 * 0.1));
                    draw_sprite_ext(sSoul, 7, 320, -650 + i8 + (i3[5] * 15), i9, i9, -90 + k1, c_white, 1);
                    i9 += ((1 - i9) / 10);
                    
                    if (i8 == 425)
                        sou(96);
                    
                    if (i8 == 500)
                    {
                        audio_play_sound(shinkansen, -999, true);
                        
                        with (instance_create_depth(100, -575, -9999, oCC2))
                            Seed = "(CamBack)";
                    }
                }
                else
                {
                    draw_sprite_ext(sSoul, 6, 320, -650 + (i3[5] * 15), 1, 1, -90, c_white, 1);
                }
            }
        }
    }
}

if (StringContains(Seed, "(RailAp)"))
{
    if (Tyme == 1)
        i1 = 13 + iRan(-3, 3);
    
    if (rTyme(2, Tyme - 1))
    {
        y -= i1;
        i1--;
    }
    
    if (y > 220)
    {
        y = 220;
        i1 *= -0.5;
    }
    
    i1 -= 1;
    
    if ((oAlways.Mesg == "Mesg_2" || oAlways.Mesg == "Mesg_3") && rTyme(2, oP.Tyme))
    {
        x -= 20;
        
        if (x == -10)
            x = 650;
    }
}

if (StringContains(Seed, "(CamBack)"))
{
    layer_set_visible(layer_get_id("BC_Rail"), true);
    oAlways.i1 += 2;
    
    if (oAlways.i1 == 20)
        oAlways.i1 = 0;
    
    with (oCC2)
    {
        if (StringContains(Seed, "(RailAp)"))
            des(0);
    }
    
    if (Tyme == 1)
    {
        i2[3] = 0;
        i1 = (0 - oAlways.view_y) / 80;
    }
    
    if (oAlways.view_y != 0)
        oAlways.view_y += i1;
    else if (oAlways.Mesg == "Mesg_1")
        oAlways.Mesg = "Mesg_2";
    
    if (rTyme(40, Tyme - 1))
    {
        with (instance_create_depth(640, 0, -9999, oCC2))
        {
            Seed = "DrawSelf@BlueBack";
            sprite_index = sBC_5;
        }
    }
    
    if (Tyme == 80)
    {
        oAlways.ShakePower = 4;
        oAlways.ShakeTyme = 10;
        sou(96);
        
        with (instance_create_depth(100, 100, -9999, oTextEngine))
        {
            JustText = true;
            Seed = "(TB)@Voicer";
            Spez = "BeefEnter";
            EndMesg = "Mesg_3";
            Text[0] = "* [Buckle up chumps],€€€€€€€€€£* YOU'RE IN FOR A RIDE!";
            _Voice[0] = snd_scampton_voice;
            Text[1] = "* A RIDE €€€€€€[[Around the bend]]€€€€€€€€€€@ON MY [[Specil]]€€€€€€ LITTLE RAILWAY.€€€€€€€€€";
            _Voice[1] = snd_scampton_voice;
        }
    }
    
    i2[0] = 400;
    i2[1] = 210;
    i5[0] = 0;
    i5[1] = 0;
    
    if (oAlways.Mesg == "Mesg_3")
    {
        i5[0] = iRan(-1, 1) * 2;
        i5[1] = iRan(-1, 1) * 2;
        i2[2] = sin(Tyme * 0.25);
        
        if (rTyme(4, Tyme))
        {
            i2[3]++;
            
            if (i2[3] >= 2)
                i2[3] = 0;
        }
        
        draw_sprite_ext(sScams, 15 + i2[3], i5[0] + i2[0], ((i5[0] + i2[1]) - 4) + (i2[2] * 10), 2, 2, 0, c_white, 1);
        
        if (i3 == 0)
        {
            i3 = 1;
            audio_stop_sound(shinkansen);
            
            with (instance_create_depth(0, 0, -9999, oEEF))
            {
                Seed = "BattleToFade";
                image_alpha = 0;
            }
        }
        
        if (rTyme(6, i4) && i4 <= 150)
        {
            audio_sound_pitch(snd_scampton_voice, 0.5 + ((i4 / 7) * 0.05));
            sou(snd_scampton_voice);
        }
        
        i4++;
    }
    else
    {
        i2[2] = sin(Tyme * 0.05);
        draw_sprite_ext(sScamDance, round(Tyme / 5), i2[0], (i2[1] - 4) + (i2[2] * 10), 2, 2, 0, c_white, 1);
    }
    
    draw_sprite_ext(sShadow, 0, (i5[0] + i2[0]) - 2, i5[1] + i2[1] + 10, 4 + (i2[2] * 2), 3, 0, c_black, 1);
    draw_sprite_ext(sOWcart, 1, 176 + (sin(Tyme * 0.05) * 14), 152, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWdown, 0, 164 + (sin(Tyme * 0.05) * 14), 140, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWcart, 0, 176 + (sin(Tyme * 0.05) * 14), 152, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWcart, 1, 176 + (sin((Tyme + 40) * 0.05) * 14), 234, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWdown, 1, 164 + (sin((Tyme + 40) * 0.05) * 14), 222, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWcart, 0, 176 + (sin((Tyme + 40) * 0.05) * 14), 234, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWcart, 1, 176 + (sin((Tyme + 80) * 0.05) * 14), 316, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWdown, 2, 164 + (sin((Tyme + 80) * 0.05) * 14), 306, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sOWcart, 0, 176 + (sin((Tyme + 80) * 0.05) * 14), 316, 2, 2, 0, c_white, 1);
}

if (StringContains(Seed, "BlueBack"))
{
    x -= 3;
    
    if (x < -283)
        des(0);
}

if (StringContains(Seed, "BattleEnd"))
{
    oMakeUI.EndGame = true;
    audio_stop_sound(oAlways.BattleMusic);
    
    if (Tyme == 50)
    {
        if (oMakeUI.Spare >= 100)
            oP.WayWin = 1;
        else
            oP.WayWin = 2;
        
        if (oP.WayWin == 1)
            oP.Win_P = true;
        
        if (oP.WayWin == 2)
            oP.Win_G = true;
        
        saveGame();
        i1 = oSpamtonRig.BodX;
        i2 = oSpamtonRig.BodY;
        oSpamtonRig.image_speed = 0;
        audio_stop_all();
    }
    
    if (Tyme >= 75 && Tyme < 125)
    {
        if (rTyme(6, Tyme) && oP.WayWin == 1)
            sou(54);
        
        if (rTyme(6, Tyme) && oP.WayWin == 2)
            sou(67);
        
        oSpamtonRig.BodX = i1 + (iRan(-1, 1) * 2);
        oSpamtonRig.BodY = i2 + (iRan(-1, 1) * 2);
    }
    
    if (Tyme == 125)
    {
        sou(31);
        oSpamtonRig.BodX = i1;
        oSpamtonRig.BodY = i2;
        oAlways.CamWait = 99999;
    }
    
    if (Tyme >= 125)
    {
        oSpamtonRig.BodY -= 10;
        
        if (rTyme(2, Tyme))
            i3++;
        
        oAlways.CameraY -= i3;
    }
    
    if (Tyme == 200)
    {
        if (oP.HaveHit == 0)
        {
            oP.Win_NoHit = true;
            saveGame();
            room_goto(rNoHit);
        }
        else
        {
            room_goto(rOutro);
        }
    }
}

if (StringContains(Seed, "OutroScamp"))
{
    oAlways.CameraY += ((0 - oAlways.CameraY) / 12);
    i2 = 50;
    
    if (Tyme > i2 && Tyme < (26 + i2))
    {
        i1++;
        draw_sprite_ext(sOsko, 0, 400, i1 * 10, 2, 2, 0, c_white, 1);
    }
    
    if (Tyme == (26 + i2))
    {
        sou(31);
        oAlways.ShakePower = 4;
        oAlways.ShakeTyme = 5;
    }
    
    if (Tyme == (26 + i2) || Tyme == (27 + i2))
    {
        i1 = 26;
        draw_sprite_ext(sOsko, 0, 400, i1 * 10, 3, 1, 0, c_white, 1);
    }
    
    if (Tyme == (28 + i2) || Tyme == (29 + i2))
        draw_sprite_ext(sOsko, 0, 400, i1 * 10, 3.5, 0.5, 0, c_white, 1);
    
    if (Tyme == (30 + i2) || Tyme == (31 + i2))
        draw_sprite_ext(sOsko, 0, 400, i1 * 10, 2.5, 1.5, 0, c_white, 1);
    
    if (oAlways.Mesg == "Wide")
    {
        i4++;
        
        if (i4 == 1)
            audio_stop_sound(circus);
        
        if (i4 == 100)
            i5 = 1;
        
        if (i5 == 0)
        {
            k1 += 0.05;
            k2 = 0;
            k3 = 10;
        }
        
        if (i5 == 1)
        {
            k4 += 0.015;
            k1 -= k4;
            
            if ((2 * k1) < 0)
            {
                i5 = 2;
                sou(31);
                oAlways.ShakePower = 4;
                oAlways.ShakeTyme = 5;
                
                with (instance_create_depth(400, 240, -9999, oCC2))
                {
                    Seed = "OutroWeapon";
                    i1 = 2;
                }
                
                with (instance_create_depth(100, 100, -9999, oTextEngine))
                {
                    JustText = true;
                    Seed = "(TB)";
                    Spez = "BeefEnter";
                    EndMesg = "Give";
                    
                    if (oP.WayWin == 1)
                    {
                        Text[0] = "* You got the Big Shot Bow Tie.";
                        _Voice[0] = snd_scampton_voice;
                    }
                    
                    if (oP.WayWin == 2)
                    {
                        Text[0] = "* You got the Pipis Popper.";
                        _Voice[0] = snd_scampton_voice;
                    }
                }
            }
        }
    }
    
    with (oTextEngine)
    {
        if (Spez2 == "EndIn Spare" && AtText > 4)
        {
            with (oTextEngine)
            {
                if (Spez == "AYS")
                    des(0);
            }
        }
        
        if (Spez2 == "EndIn Spare" && AtText == 4)
        {
            other.a6 = 1;
            
            if (Buh == 0 && StringAT >= string_length(Text[AtText]))
            {
                Buh = 1;
                
                with (instance_create_depth(470, 434, -20000, oTextEngine))
                {
                    image_xscale = 1;
                    image_yscale = 1;
                    Text[0] = "Are you serious?";
                    Spez = "AYS";
                    BC = false;
                    StringAT = 999;
                    Mono = true;
                }
            }
        }
    }
    
    with (oTextEngine)
    {
        if (Spez2 == "EndIn Fight" && AtText == 3)
            other.a6 = 1;
    }
    
    if (Tyme > (31 + i2))
    {
        if (Tyme == (32 + i2))
        {
            i3[0] = 0;
            i3[1] = 0;
            i3[2] = 0;
            k2 = 1;
            k1 = 1;
        }
        
        if (i5 < 2)
        {
            draw_sprite_ext(sShadow, 0, 400, 260, (4 * k1) + (sin(Tyme * 0.05) * 2 * k2), 3, 0, c_black, k3 + 0.5 + (cos(Tyme * 0.075) * 0.5));
            draw_sprite_ext(sScams, 0, 400, 240 + (sin(Tyme * 0.05) * 6 * k2), 2 * k1, 2, 0, c_white, k3 + 0.5 + (cos(Tyme * 0.075) * 0.5));
        }
        
        if (i3[0] != 14 && Tyme > (i2 + 35 + 25))
        {
            i3[0]++;
            
            if (i3[0] == 14)
            {
                sou(96);
                oAlways.ShakePower = 4;
                oAlways.ShakeTyme = 5;
            }
        }
        
        if (i3[1] != 14 && Tyme > (i2 + 50 + 25))
        {
            i3[1]++;
            
            if (i3[1] == 14)
            {
                sou(96);
                oAlways.ShakePower = 4;
                oAlways.ShakeTyme = 5;
            }
        }
        
        if (i3[2] != 14 && Tyme > (i2 + 65 + 25))
        {
            i3[2]++;
            
            if (i3[2] == 14)
            {
                sou(96);
                oAlways.ShakePower = 4;
                oAlways.ShakeTyme = 5;
            }
        }
        
        if (i3[2] == 14)
        {
            if (a6 == 0)
                draw_sprite_ext(sOWdown, 2, 40, 0 + (i3[2] * 20), 2, 2, 0, c_white, 1);
            else
                draw_sprite_ext(sCh_Walk2, 0, 40, 0 + (i3[2] * 20), 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sOWdown, 7, 40, 0 + (i3[2] * 20), 2, 2, 0, c_white, 1);
        }
        
        if (i3[0] == 14)
        {
            if (a6 == 0)
                draw_sprite_ext(sOWdown, 0, 100, -24 + (i3[0] * 20), 2, 2, 0, c_white, 1);
            else
                draw_sprite_ext(sAs_Stand1, 1, 100, -24 + (i3[0] * 20), 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sOWdown, 6, 100, -24 + (i3[0] * 20), 2, 2, 0, c_white, 1);
        }
        
        if (i3[1] == 14)
        {
            if (a6 == 0)
                draw_sprite_ext(sOWdown, 5, 160, -40 + (i3[1] * 20), 2, 2, 0, c_white, 1);
            else
                draw_sprite_ext(sNo_Walk2, 0, 160, -40 + (i3[1] * 20), 2, 2, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sOWdown, 8, 160, -40 + (i3[1] * 20), 2, 2, 0, c_white, 1);
        }
    }
    
    if (Tyme == (i2 + 104))
    {
        audio_sound_pitch(circus, 0.8);
        audio_play_sound(circus, -999, true);
        
        with (instance_create_depth(100, 100, -9999, oTextEngine))
        {
            JustText = true;
            Seed = "(TB)@Voicer";
            Spez = "BeefEnter";
            EndMesg = "Wide";
            
            if (oP.WayWin == 1)
            {
                Spez2 = "EndIn Spare";
                
                if ((oP.HaveHit == 0 || oP.NoHit != "Disabled") && false)
                {
                    Text[0] = "* Spare NO HIT 1";
                    _Voice[0] = snd_scampton_voice;
                }
                else
                {
                    textAtri(0, "* WAWAWOWWIE!!€€€€€€€€€ WHAT A [Knockout!]", snd_scampton_voice, "x");
                    textAtri(1, "* YOU [Loseners] ACTUALLY [WON]???", snd_scampton_voice, "x");
                    textAtri(2, "* [Despicable]€€€€€€€€€£* [Despicable!]€€€€€€€€€£* [DESPICABLE!!!]", snd_scampton_voice, "x");
                    textAtri(3, "* I JUST WANTED TO@[Get out of jail for free]", snd_scampton_voice, "x");
                    textAtri(4, "* Calm down man,€€€€€€€€€ you can@always join us if you@want.", 90, 11);
                    textAtri(5, "* [Join]€€€€€€€€€ [the party?]€€€€€€€€€@[Guess That'll Have To Do!]", snd_scampton_voice, "x");
                    textAtri(6, "* BUT I'LL BE BACK,€€€€€€€€€ JUST YOU WAIT!", snd_scampton_voice, "x");
                    textAtri(7, "* THEN THE WHOLE WORLD WILL SEE@[Fury]€€€€€€€€€ FROM THE@[[GREAT SCAMPTON!!]]", snd_scampton_voice, "x");
                }
            }
            
            if (oP.WayWin == 2)
            {
                Spez2 = "EndIn Fight";
                
                if ((oP.HaveHit == 0 || oP.NoHit != "Disabled") && false)
                {
                    Text[0] = "* Fight NO HIT 1";
                    _Voice[0] = snd_scampton_voice;
                }
                else
                {
                    textAtri(0, "* YOU CHEATING [Cats],€€€€€€€€€@WHAT IS THIS!?€€€€€€€€€ MURDER ON THE@[[BIG SHOT]] EXPRESS??", snd_scampton_voice, "x");
                    textAtri(1, "* [That combo was lame] AS@[.... . .-.. .-..] COULD BE!!", snd_scampton_voice, "x");
                    textAtri(2, "* REMINDS ME OF SOMEONE,€€€€€€€€€ BUT I@CAN'T QUITE PUT MY [Chopsticks]@ON IT.", snd_scampton_voice, "x");
                    textAtri(3, "* Hey guys...€€€€€€€€€ we can't let@this guy out,€€€€€€€€€ can we?€€€€€€€€€£* He's completely insane!", 98, 1);
                    textAtri(4, "* I like him actually,€€€€€€€€€@let's keep him.", 90, 13);
                    textAtri(5, "* [A Keepsake]??€€€€€€€€€ FINE THEN!€€€€€€€€€@TAKE ME TO [Heaven's Door],€€€€€€€€€ FOR@IT'S APPROACH IS INEVITABLE!!", snd_scampton_voice, "x");
                    textAtri(6, "* But you better keep my [eggs]@safe", snd_scampton_voice, "x");
                    textAtri(7, "* You ruffians", snd_scampton_voice, "x");
                }
            }
        }
    }
}

if (StringContains(Seed, "OutroWeapon"))
{
    if (oP.WayWin == 1)
        k1 = 0;
    
    if (oP.WayWin == 2)
        k1 = 1;
    
    if (i2 != 0)
    {
        x += i2;
        y += i3;
        i4 += 0.01;
        i3 += i4;
    }
    
    if (y <= StartY)
    {
        draw_sprite_ext(sWeaponWin, k1, x, y, -2 * sin(Tyme * 0.075) * i1, 2 * i1, 0, c_white, 1);
    }
    else if (a1 == 0)
    {
        a1 = 1;
        sou(84);
    }
    
    i1 += ((1 - i1) / 10);
    
    if (oAlways.Mesg == "Give" && i2 == 0)
    {
        i2 = -5;
        i3 = -5;
    }
    
    if (oAlways.Mesg == "Give")
        k2++;
    
    if (k2 >= 100)
        draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, (k2 - 100) / 200);
    
    if (k2 == 400)
        room_goto(rMainu);
}

if (StringContains(Seed, "DrawSelf"))
    draw_self();

if (StringContains(Seed, "(DSDS1)"))
    draw_sprite_ext(sprite_index, image_index, x - oAlways.i1, y, 2, 2, 0, c_white, image_alpha);

if (StringContains(Seed, "NoHitWIN"))
{
    if (Tyme == 1)
        i3 = 1;
    
    if (rTyme(2, Tyme))
    {
        i1 = iRan(-1, 1) * 2;
        i2 = iRan(-1, 1) * 2;
    }
    
    draw_sprite_ext(sNH_Text, 0, 384 + i1, 32 + i2, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sWhite, 0, 0, 0, 100, 100, 0, c_black, i3);
    
    if (Tyme == 100)
        audio_play_sound(snd_junkilpede, -999, false);
    
    if (Tyme >= 100 && Tyme < 110)
        i3 -= 0.1;
    
    if (Tyme >= 750)
        i3 += 0.01;
    
    if (Tyme == 950)
        room_goto(rMainu);
}
