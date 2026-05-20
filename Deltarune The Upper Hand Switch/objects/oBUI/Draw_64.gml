pNamesT = false;
eNamesT = false;

if (!surface_exists(surf[0]))
    surf[0] = surface_create(640, 480);

if (!surface_exists(surf[1]))
    surf[1] = surface_create(200, 480);

res_i();

if (TP > 100)
    TP = 100;

if (drawUI)
{
    if (TP == 100)
        i = rgb(254, 206, 28);
    else
        i = rgb(255, 160, 64);
    
    showLine += (((1 + (TP - showTP)) - showLine) / 4);
    showTP += ((TP - showTP) / 4);
    surface_set_target(surf[1]);
    draw_clear_alpha(c_white, 0);
    ext(sTP, 1, 38, 238, 1, 1, 0, rgb(128, 0, 0), 1, 0);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    ext(sTP, 2, 41, 228, 1, 180 * (showTP / 100), 0, i, 1, 0);
    
    if (!(round(showLine) == 1 && TP == 100))
    {
        if (showLine < 0)
            i2 = 255;
        else
            i2 = 16777215;
        
        ext(sTP, 2, 41, 228 - (showTP * 1.8), 1, -180 * (showLine / 100), 0, i2, 1, 0);
    }
    
    ext(sTP, 2, 41, 228 - (showTP * 1.8), 1, -180 * (TPremove / 100), 0, 16777215, 0.5 + (sin(ti * 0.05) * 0.5), 0);
    gpu_set_colorwriteenable(1, 1, 1, 1);
    ext(sTP, 3 + (op.language - 1), 8, 475, 2, 2, 0, 16777215, 1, 0);
    ext(sTP, 0, 38, 238, 1, 1, 0, 16777215, 1, 0);
    draw_set_font(fFont);
    
    if (round(showTP) == 100)
    {
        print(maxText, 8 - ((op.language != 1) * 4), 116, undefined, 65535, ["jump10", "prop"]);
    }
    else
    {
        draw_text_ext_transformed(8, 110, string(round(showTP)), 10, 999, 2, 2, 0);
        ext(sFont1, 100, 13, 141, 2, 2, 0, 16777215, 1, 0);
    }
    
    surface_reset_target();
    draw_surface_ext(surf[1], -move_TP + move_TP2, 0, 1, 1, 0, c_white, 1);
    surface_set_target(surf[0]);
    draw_clear_alpha(c_white, 0);
    ext(sPixel, 0, 0, 325, 640, 155, 0, 0, 1, 0);
    ext(sPixel, 0, 0, 325, 640, 2, 0, rgb(51, 32, 51), 1, 0);
    res_i();
    
    repeat (array_length(op.party))
    {
        if (i == pep && stage == 0)
        {
            if (hudY[i] != 0)
            {
                if (hudY[i] <= 10)
                    hudY[i] -= 3;
                else
                    hudY[i] -= 8;
                
                if (hudY[i] < 0)
                    hudY[i] = 0;
            }
        }
        else if (hudY[i] != 32)
        {
            hudY[i] += 8;
            
            if (hudY[i] > 32)
                hudY[i] = 32;
        }
        
        i1 = array_length(op.party);
        get_stats(op.party[i]);
        
        if (i == pep && stage == 0)
        {
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 293 + hudY[i], 213, 200, 0, 0, 1, 0);
        }
        else
        {
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 293 + hudY[i], 213, 39, 0, rgb(51, 32, 51), 1, 0);
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 327, 213, 39, 0, 0, 1, 0);
        }
        
        i4 = 0;
        
        repeat (3)
        {
            ext(sPixel, 0, ((lines[i4] + 213) - (106 * (i1 - 1))) + (213 * i), 327, 2, 200, 0, jam[2], 1 - (lines[i4] / 30), 0);
            ext(sPixel, 0, ((-lines[i4] + 422) - (106 * (i1 - 1))) + (213 * i), 327, 2, 200, 0, jam[2], 1 - (lines[i4] / 30), 0);
            i4++;
        }
        
        i2 = 0;
        i3 = 0;
        
        repeat (array_length(jamOptions))
        {
            if (page == "s")
            {
                if (i == pep && i2 == cur)
                    i3 = sUI_Button2;
                else
                    i3 = sUI_Button;
            }
            
            if (page != "s")
            {
                if (i == pep && i2 == undo_tree[0])
                    i3 = sUI_Button2;
                else
                    i3 = sUI_Button;
            }
            
            ext(i3, real(jamOptions[i2]) + ((op.language != 1 && real(jamOptions[i2]) == 1) * ((5 + op.language) - 2)), ((((5 - array_length(jamOptions)) * 17) + 232 + (35 * i2)) - (106 * (i1 - 1))) + (213 * i), 334, 1, 1, 0, 16777215, 1, 0);
            i2++;
        }
        
        i2 = 0;
        i3 = 0;
        
        if (i == pep && stage == 0)
        {
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 293 + hudY[i], 213, 39, 0, 0, 1, 0);
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 293 + hudY[i], 213, 2, 0, jam[2], 1, 0);
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 330 + hudY[i], 213, 2, 0, jam[2], 1, 0);
            ext(sPixel, 0, (212 - (106 * (i1 - 1))) + (213 * i), 293 + hudY[i], 2, 200, 0, jam[2], 1, 0);
            ext(sPixel, 0, (423 - (106 * (i1 - 1))) + (213 * i), 293 + hudY[i], 2, 200, 0, jam[2], 1, 0);
        }
        else
        {
            ext(sPixel, 0, (214 - (106 * (i1 - 1))) + (213 * i), 295 + hudY[i], 209, 39, 0, 0, 1, 0);
        }
        
        ext(sSymb, 1 + ((op.language != 1) * (8 + ((op.language - 2) * 2))), (329 - (106 * (i1 - 1))) + (213 * i), 319 + hudY[i], 1, 1, 0, 16777215, 1, 0);
        ext(sPixel, 0, (340 - (106 * (i1 - 1))) + (213 * i), 315 + hudY[i], 76, 9, 0, rgb(128, 0, 0), 1, 0);
        
        if (op.hp[i] > 0)
            ext(sPixel, 0, (340 - (106 * (i1 - 1))) + (213 * i), 315 + hudY[i], 76 * (op.hp[i] / op.MAXhp[i]), 9, 0, jam[2], 1, 0);
        
        ext(sSlash, 0, (373 - (106 * (i1 - 1))) + (213 * i), 302 + hudY[i], 1, 1, 0, 16777215, 1, 0);
        i5 = rgb(255, 255, 255);
        
        if (op.hp[i] <= 30)
            i5 = rgb(255, 255, 0);
        
        if (op.hp[i] <= 0)
            i5 = rgb(255, 0, 0);
        
        draw_set_font(op.fontHP);
        draw_text_transformed_color((392 - (106 * (i1 - 1))) + (213 * i), 302 + hudY[i], string(op.MAXhp[i]), 2, 2, 0, i5, i5, i5, i5, 1);
        draw_text_transformed_color((371 - (string_length(op.hp[i]) * 8) - (106 * (i1 - 1))) + (213 * i), 302 + hudY[i], string(op.hp[i]), 2, 2, 0, i5, i5, i5, i5, 1);
        ext(jam[4], 0 + ((op.language != 1) * (9 + (op.language - 2))), (287 - (106 * (i1 - 1))) + (213 * i), 315 + hudY[i], 1, 1, 0, 16777215, 1, 0);
        
        if (i == 1 && oBUI.susieStuck)
            ext(jam[4], 5, (236 - (106 * (i1 - 1))) + (213 * i), 313 + hudY[i], 1, 1, 0, 16777215, 1, 0);
        else if ((pep > i || stage != 0) && op.hp[i] > 0)
            ext(jam[4], 3 + actions[i][3] + ((actions[i][3] > 5) * (op.languageAmount - 1)), (236 - (106 * (i1 - 1))) + (213 * i), 313 + hudY[i], 1, 1, 0, 16777215, 1, 0);
        else
            ext(jam[4], 1, (236 - (106 * (i1 - 1))) + (213 * i), 313 + hudY[i], 1, 1, 0, 16777215, 1, 0);
        
        i++;
    }
    
    if (susieAddon > 0)
        ext(sAddon, 0 + ((op.itemsON[1] == 1) * 2), 40, 288 + hudY[0] + (dsin(op.ty * 5) * 2), 1, 1, 0, 16777215, 1, 0);
    
    if (ralseiAddon > 0)
        ext(sAddon, 1 + ((op.itemsON[0] == 1) * 2), 40 + ((susieAddon > 0) * 15), 288 + hudY[0] + (dsin(180 + (op.ty * 5)) * 2), 1, 1, 0, 16777215, 1, 0);
    
    ext(sPixel, 0, 0, 362, 640, 118, 0, 0, 1, 0);
    ext(sPixel, 0, 0, 362, 640, 3, 0, rgb(51, 32, 51), 1, 0);
    get_stats(op.party[pep]);
    
    if (page == "s" && stage == 0)
        ext(sUI_ButtonText, ((op.language - 1) * 6) + real(jamOptions[cur]), ((((5 - array_length(jamOptions)) * 17) + 232 + (35 * cur)) - (106 * (i1 - 1))) + (213 * pep), 340, 1, 1, 0, 16777215, 1, 0);
    
    if (page != "s" && stage == 0)
        ext(sUI_ButtonText, ((op.language - 1) * 6) + real(jamOptions[undo_tree[0]]), ((((5 - array_length(jamOptions)) * 17) + 232 + (35 * undo_tree[0])) - (106 * (i1 - 1))) + (213 * pep), 340, 1, 1, 0, 16777215, 1, 0);
    
    if (pep == 0 && TP == 100 && array_length(op.party) == 3)
    {
        var specialActWhite = 127.5 + (127.5 * dsin(op.ty * 8));
        gpu_set_blendmode(bm_add);
        ext(sUI_Button3, op.language - 1, 55, 334, 1, 1, 0, rgb(specialActWhite, specialActWhite, specialActWhite), 1, 0);
        gpu_set_blendmode(bm_normal);
    }
    
    if (page == "act")
    {
        res_i();
        get_enemieStats(tot_enemies[actions[pep][2]]);
        
        repeat (array_length(jam_movesStore))
        {
            get_stats(op.party[pep]);
            i1 = jam[3];
            get_moves(jam_movesStore[i]);
            
            if (jam[1] == 0)
                i1 = rgb(255, 255, 255);
            
            if ((i % 2) == 1)
            {
                i2 = 230;
            }
            else
            {
                i2 = 0;
                
                if (i != 0)
                    i3 += 30;
            }
            
            if (TP < jam[3])
                i1 = rgb(85, 85, 85);
            
            if ((arrayContains(jamSeed, "needsEveryone") && (op.hp[0] < 1 || op.hp[1] < 1 || op.hp[2] < 1)) || (arrayContains(jamSeed, "needsNotSusie") && (op.hp[0] < 1 || op.hp[2] < 1)))
                i1 = rgb(85, 85, 85);
            
            print(jam[0], 30 + i2, 382 + i3, undefined, i1, ["prop"]);
            
            if (cur == i)
            {
                ext(sSymb, 0, 18 + i2, 394 + i3, 1, 1, 0, 16777215, 1, 0);
                print(jam[2], 500, 382, undefined, undefined, ["prop"]);
            }
            
            i++;
        }
    }
    
    if (page == "names" || page == "names_AA" || page == "names_EP")
    {
        eNamesT = true;
        print(otherText[0], 424, 367, undefined, undefined, ["ys_1", "prop"]);
        print(otherText[1], 524, 367, undefined, undefined, ["ys_1", "prop"]);
        res_i();
        
        repeat (array_length(tot_enemies))
        {
            get_stats(op.party[pep]);
            i1 = jam[3];
            get_enemieStats(tot_enemies[i]);
            print(jam[1], 78, 382 + (i * 30), undefined, undefined, ["prop"]);
            
            if (page == "names_AA")
            {
                print_length(jam[1], sFont1, 3);
                
                if (jam[2] == 0)
                    print(AAsave, 126 + (printLength * 2 * (op.language != 3)), 382 + (i * 30) + ((op.language == 3) * 30), undefined, i1, ["prop"]);
                else
                    print(jam[2], 126 + (printLength * 2 * (op.language != 3)), 382 + (i * 30) + ((op.language == 3) * 30), undefined, i1, ["prop"]);
            }
            
            ext(sPixel, 0, 420, 380 + (i * 30), 80, 16, 0, rgb(128, 0, 0), 1, 0);
            ext(sPixel, 0, 420, 380 + (i * 30), 80 * (jam[4] / jam[3]), 16, 0, rgb(0, 255, 0), 1, 0);
            print(string(ceil((jam[4] / jam[3]) * 100)) + "%", 424, 383 + (i * 30), undefined, undefined, ["ys_1", "prop"]);
            ext(sPixel, 0, 520, 380 + (i * 30), 80, 16, 0, rgb(255, 80, 32), 1, 0);
            ext(sPixel, 0, 520, 380 + (i * 30), 80 * (jam[5] / 100), 16, 0, rgb(255, 255, 0), 1, 0);
            print(string(jam[5]) + "%", 524, 383 + (i * 30), undefined, rgb(128, 0, 0), ["ys_1", "prop"]);
            
            if (cur == i)
                ext(sSymb, 0, 58, 394 + (i * 30), 1, 1, 0, 16777215, 1, 0);
            
            i++;
        }
    }
    
    if (page == "names_PP")
    {
        pNamesT = true;
        res_i();
        
        repeat (array_length(op.party))
        {
            get_stats(op.party[i]);
            print(jam[0], 78, 382 + (i * 30), undefined, undefined, ["prop"]);
            ext(sPixel, 0, 400, 380 + (i * 30), 100, 16, 0, rgb(128, 0, 0), 1, 0);
            ext(sPixel, 0, 400, 380 + (i * 30), 100 * (op.hp[i] / op.MAXhp[i]), 16, 0, rgb(0, 255, 0), 1, 0);
            
            if (cur == i)
                ext(sSymb, 0, 58, 394 + (i * 30), 1, 1, 0, 16777215, 1, 0);
            
            i++;
        }
    }
    
    if (page == "item")
    {
        res_i();
        
        if (cur > 5)
            i4 = 1;
        else
            i4 = 0;
        
        repeat (array_length(op.item))
        {
            get_items(op.item[i]);
            
            if ((i % 2) == 1)
            {
                i2 = 230;
            }
            else
            {
                i2 = 0;
                
                if (i != 0)
                    i3 += 30;
            }
            
            if ((i4 == 0 && i3 < 90) || (i4 == 1 && i3 >= 90))
                print(jam[0], 30 + i2, (382 + i3) - (i4 * 90), undefined, undefined, ["prop"]);
            
            if (cur == i)
            {
                ext(sSymb, 0, 18 + i2, (394 + i3) - (i4 * 90), 1, 1, 0, 16777215, 1, 0);
                print(jam[2], 500, 382, undefined, undefined, ["prop"]);
            }
            
            i++;
        }
        
        if (array_length(op.item) > 6)
        {
            if (cur < 6)
                ext(sSymb, 5, 480, 460 + round(sin(ti * 0.05) * 3), 1, -1, 0, 16777215, 1, 0);
            else
                ext(sSymb, 5, 480, 385 + round(sin(ti * 0.05) * 3), 1, 1, 0, 16777215, 1, 0);
        }
    }
    
    surface_reset_target();
    draw_surface_ext(surf[0], 0, move_UI, 1, 1, 0, c_white, 1);
}

if (op.camMode != "soul")
{
    ext(sPixel, 0, 0, 0, -999, 999, 0, 0, 1);
    ext(sPixel, 0, 640, 0, 999, 999, 0, 0, 1);
}

if ((op.alexMode || op.challengeMode) && stage != 0 && op.custom_dt)
{
    res_i();
    i1 = 16777215;
    
    if (alexTimeShow <= 10)
        i1 = 255;
    
    image_alpha = deathTimerAlpha;
    print(otherText[2] + " " + string(alexTimeShow), 320, 410, undefined, i1, ["mid", "alph"]);
}
