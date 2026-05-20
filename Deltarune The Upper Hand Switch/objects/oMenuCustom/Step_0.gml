if (op.superMode)
    title_color = 65535;
else if (title_color == 65535)
    title_color = 255;

if (room == rCustomMode)
{
    if (!(op.ty % 30))
    {
        if (title_color == 255)
            title_color = 65280;
        else if (title_color == 65280)
            title_color = 16711680;
        else if (title_color == 16711680)
            title_color = 255;
    }
}
else
{
    title_color = 16777215;
}

use_keys();

if (TapUP)
{
    snd(snd_menumove);
    cur--;
    
    if (cur < 0)
        cur = array_length(text) - 1;
}

if (TapDOWN)
{
    snd(snd_menumove);
    cur++;
    
    if (cur > (array_length(text) - 1))
        cur = 0;
}

if (TapZ)
{
    if (page == startPage)
        curSave = cur;
}

if (TapZ && func[cur] != -1)
{
    TapZ = false;
    TapX = false;
    func[cur]();
}

if (TapX)
{
    TapZ = false;
    TapX = false;
    
    if (page == startPage)
    {
        if (cur != 0)
        {
            snd(snd_menumove);
            cur = 0;
        }
    }
    else
    {
        snd(snd_menumove);
        updateText = true;
        page = startPage;
        cur = curSave;
    }
}

res_i();

if (special == "partySwap")
{
    i1 = true;
    
    if (TapLEFT)
    {
        op.superMode = false;
        snd(snd_menumove);
        
        if (op.party[val[0]] == "kris" && i1)
        {
            i1 = false;
            op.party[val[0]] = 0;
        }
        
        if (op.party[val[0]] == 0 && i1)
        {
            i1 = false;
            op.party[val[0]] = "ralsei";
        }
        
        if (op.party[val[0]] == "ralsei" && i1)
        {
            i1 = false;
            op.party[val[0]] = "susie";
        }
        
        if (op.party[val[0]] == "susie" && i1)
        {
            i1 = false;
            op.party[val[0]] = "kris";
        }
    }
    
    if (TapRIGHT)
    {
        op.superMode = false;
        snd(snd_menumove);
        
        if (op.party[val[0]] == "kris" && i1)
        {
            i1 = false;
            op.party[val[0]] = "susie";
        }
        
        if (op.party[val[0]] == "susie" && i1)
        {
            i1 = false;
            op.party[val[0]] = "ralsei";
        }
        
        if (op.party[val[0]] == "ralsei" && i1)
        {
            i1 = false;
            op.party[val[0]] = 0;
        }
        
        if (op.party[val[0]] == 0 && i1)
        {
            i1 = false;
            op.party[val[0]] = "kris";
        }
    }
    
    if (op.party[0] == 0 && op.party[1] == 0 && op.party[2] == 0)
        op.party = ["kris", 0, 0];
}

if (special == "itemSwap")
{
    if (TapLEFT)
    {
        op.superMode = false;
        op.custom_item[cur - 1]--;
        
        if (op.custom_item[cur - 1] < 0)
            op.custom_item[cur - 1] = 7;
    }
    
    if (TapRIGHT)
    {
        op.superMode = false;
        op.custom_item[cur - 1]++;
        
        if (op.custom_item[cur - 1] > 7)
            op.custom_item[cur - 1] = 0;
    }
}

if (special == "enemyATK" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_enemyATK > 0)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_enemyATK -= 0.1;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_enemyATK < 3)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_enemyATK += 0.1;
    }
}

if (special == "partyATK" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_partyATK > 0)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_partyATK -= 0.1;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_partyATK < 5)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_partyATK += 0.1;
    }
}

if (special == "sparePower" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_sparePower > -4)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_sparePower--;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_sparePower < 33)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_sparePower++;
    }
}

if (special == "airJumps" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_airJumps > 1)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_airJumps--;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_airJumps < 100)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_airJumps++;
    }
}

if (special == "dtSec" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_dtSec > 0)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_dtSec--;
        
        if (op.custom_dtPenalty > op.custom_dtSec)
            op.custom_dtPenalty = op.custom_dtSec;
        
        if (op.custom_dtDamage > op.custom_dtSec)
            op.custom_dtDamage = op.custom_dtSec;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_dtSec < 999)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_dtSec++;
    }
}

if (special == "dtDamage" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_dtDamage > 0)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_dtDamage--;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_dtDamage < op.custom_dtSec)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_dtDamage++;
    }
}

if (special == "dtPenalty" && !(KeyLEFT && KeyRIGHT))
{
    if ((KeyLEFT && tymeLEFT % 2) && op.custom_dtPenalty > 0)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_dtPenalty--;
    }
    
    if ((KeyRIGHT && tymeRIGHT % 2) && op.custom_dtPenalty < op.custom_dtSec)
    {
        snd(snd_noise);
        op.superMode = false;
        op.custom_dtPenalty++;
    }
}

special = -1;

if (updateText)
{
    updateText = false;
    text = [];
    run = [];
    func = [];
    
    if (page == 0)
    {
        add_option(gt_mainMenu, undefined, function()
        {
            room_goto(rMainMenu);
        });
        add_option(gt_cm[0], function()
        {
            sep_color = title_color;
            image_alpha = 0.25;
            print(text[i], use_x + spinX(), use_y + spinY(), undefined, sep_color, ["alph"]);
        }, function()
        {
            room_goto(rBattle);
        });
        add_option(gt_cm[1], function()
        {
            print(gt_offOn[op.st_noHit == 1], 540, use_y, undefined, undefined, ["left"]);
        }, function()
        {
            snd(snd_select);
            
            if (op.st_noHit == 1)
                op.st_noHit = -1;
            else
                op.st_noHit = 1;
        });
        add_option(gt_cm[2], function()
        {
            sep_text += " ";
            sep_text += getFace(op.party[0]);
            sep_text += getFace(op.party[1]);
            sep_text += getFace(op.party[2]);
        }, function()
        {
            snd(snd_select);
            updateText = true;
            page = 1;
            cur = 0;
        });
        add_option(gt_cm[3], function()
        {
            res_j();
            
            repeat (12)
            {
                ext(sPixel3, 0, use_x + 90 + extras_smallTextOffset(5) + (j * 16), use_y + 11, 4, 4, undefined, 16777215 * (op.custom_item[j] != 0));
                j++;
            }
        }, function()
        {
            snd(snd_select);
            updateText = true;
            page = 2;
            cur = 0;
        });
        add_option(gt_cm[4], function()
        {
            drawArrows();
            print(string(op.custom_enemyATK) + "x", 540, use_y, undefined, undefined, ["left", "force_ENG"]);
            
            if (cur == i)
                special = "enemyATK";
        });
        add_option(gt_cm[5], function()
        {
            drawArrows();
            print(string(op.custom_partyATK) + "x", 540, use_y, undefined, undefined, ["left", "force_ENG"]);
            
            if (cur == i)
                special = "partyATK";
        });
        add_option(gt_cm[6], function()
        {
            drawArrows();
            j1 = "";
            
            if (op.custom_sparePower > -1)
                j1 = "Å";
            
            print(j1 + string(op.custom_sparePower) + "%", 540, use_y, undefined, undefined, ["left"]);
            
            if (cur == i)
                special = "sparePower";
        });
        add_option(gt_cm[7], function()
        {
            drawArrows();
            print(op.custom_airJumps, 540, use_y, undefined, undefined, ["left"]);
            
            if (cur == i)
                special = "airJumps";
        });
        add_option(gt_cm[8], function()
        {
            print(gt_offOn[op.itemsON[1] != 0], 540, use_y, undefined, undefined, ["left"]);
        }, function()
        {
            snd(snd_select);
            op.superMode = false;
            
            if (op.itemsON[1] == 0)
                op.itemsON[1] = 1;
            else
                op.itemsON[1] = 0;
        });
        add_option(gt_cm[9], function()
        {
            print(gt_offOn[op.custom_susieScared], 540, use_y, undefined, undefined, ["left"]);
        }, function()
        {
            snd(snd_select);
            op.superMode = false;
            
            if (op.custom_susieScared)
                op.custom_susieScared = false;
            else
                op.custom_susieScared = true;
        });
        add_option(gt_cm[10], function()
        {
            print(gt_offOn[op.challengeMode], 540, use_y, undefined, undefined, ["left"]);
        }, function()
        {
            snd(snd_select);
            updateText = true;
            op.superMode = false;
            
            if (op.challengeMode)
                op.challengeMode = false;
            else
                op.challengeMode = true;
        });
        
        if (op.challengeMode)
        {
            add_option(gt_cm[11], function()
            {
                print(gt_offOn[op.custom_dt], 540, use_y, undefined, undefined, ["left"]);
            }, function()
            {
                snd(snd_select);
                op.superMode = false;
                
                if (op.custom_dt)
                    op.custom_dt = false;
                else
                    op.custom_dt = true;
            });
            add_option(gt_cm[12], function()
            {
                drawArrows();
                print(op.custom_dtSec, 540, use_y, undefined, undefined, ["left"]);
                
                if (cur == i)
                    special = "dtSec";
            });
            add_option(gt_cm[13], function()
            {
                drawArrows();
                print(op.custom_dtDamage, 540, use_y, undefined, undefined, ["left"]);
                
                if (cur == i)
                    special = "dtDamage";
            });
            add_option(gt_cm[14], function()
            {
                drawArrows();
                print(op.custom_dtPenalty, 540, use_y, undefined, undefined, ["left"]);
                
                if (cur == i)
                    special = "dtPenalty";
            });
            
            if (op.allowSuper)
            {
                add_option("SUPER Challenge Mode", function()
                {
                    sep_color = title_color;
                    image_alpha = 0.25;
                    print(text[i], use_x + spinX(), use_y + spinY(), undefined, sep_color, ["alph"]);
                    print(gt_offOn[op.superMode], 540 + spinX(), use_y + spinY(), undefined, sep_color, ["left", "alph"]);
                    print(gt_offOn[op.superMode], 540, use_y, undefined, sep_color, ["left"]);
                }, function()
                {
                    snd(snd_select);
                    
                    if (op.superMode)
                    {
                        op.superMode = false;
                    }
                    else
                    {
                        op.superMode = true;
                        op.itemsON = [0, 0];
                        op.party = ["kris", "susie", "ralsei"];
                        op.custom_item = [3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                        op.custom_enemyATK = 1;
                        op.custom_partyATK = 3;
                        op.custom_sparePower = -2;
                        op.custom_airJumps = 1;
                        op.custom_susieScared = false;
                        op.custom_dt = true;
                        op.custom_dtSec = 70;
                        op.custom_dtDamage = 3;
                        op.custom_dtPenalty = 3;
                    }
                });
            }
        }
        
        add_option(gt_cm[15], undefined, function()
        {
            snd(snd_select);
            reset_to_default_all();
            op.itemsON = [0, 0];
            
            if (op.challengeMode)
                cur = 1;
            
            op.challengeMode = false;
            updateText = true;
        });
    }
    
    if (page == 1)
    {
        add_option(gt_back, undefined, function()
        {
            snd(snd_menumove);
            updateText = true;
            page = 0;
            cur = curSave;
        });
        add_option(gt_party + " #1", function()
        {
            if (cur == i)
            {
                special = "partySwap";
                val[0] = 0;
            }
            
            drawArrows(-280 + extras_smallTextOffset(4));
            sep_text += (" " + getFace(op.party[0]));
        });
        add_option(gt_party + " #2", function()
        {
            if (cur == i)
            {
                special = "partySwap";
                val[0] = 1;
            }
            
            drawArrows(-280 + extras_smallTextOffset(4));
            sep_text += (" " + getFace(op.party[1]));
        });
        add_option(gt_party + " #3", function()
        {
            if (cur == i)
            {
                special = "partySwap";
                val[0] = 2;
            }
            
            drawArrows(-280 + extras_smallTextOffset(4));
            sep_text += (" " + getFace(op.party[2]));
        });
    }
    
    if (page == 2)
    {
        add_option(gt_back, undefined, function()
        {
            snd(snd_menumove);
            updateText = true;
            page = 0;
            cur = curSave;
        });
        op.___itemNumber = 0;
        
        repeat (12)
        {
            add_option(gt_item + " #" + string(op.___itemNumber + 1), function()
            {
                if (cur == i)
                {
                    special = "itemSwap";
                    
                    if (op.custom_item[i - 1] != 0)
                    {
                        get_items(op.allItems[op.custom_item[i - 1]]);
                        print(jam[2], 470, 18, sFont2);
                    }
                }
                
                drawArrows();
                
                if (op.custom_item[i - 1] == 0)
                {
                    j1 = "---";
                }
                else
                {
                    get_items(op.allItems[op.custom_item[i - 1]]);
                    j1 = jam[0];
                }
                
                print(j1, 540, use_y, undefined, undefined, ["left"]);
            }, function()
            {
            });
            op.___itemNumber++;
        }
    }
    
    if (page == 3)
    {
        add_option(gt_mainMenu, undefined, function()
        {
            room_goto(rMainMenu);
        });
        add_option(gt_mp[0], undefined, function()
        {
            snd(snd_select);
            updateText = true;
            page = 4;
            cur = 0;
        });
        add_option(gt_mp[1], undefined, function()
        {
            snd(snd_select);
            updateText = true;
            page = 5;
            cur = 0;
        });
        add_option(gt_mp[2], undefined, function()
        {
            snd(snd_select);
            updateText = true;
            page = 6;
            cur = 0;
        });
        
        if (op.alexMode)
        {
            add_option("Alex Mode", undefined, function()
            {
                snd(snd_select);
                updateText = true;
                page = 7;
                cur = 0;
            });
        }
        
        if (op.benMode)
        {
            add_option("Ben Mode", undefined, function()
            {
                snd(snd_select);
                updateText = true;
                page = 8;
                cur = 0;
            });
        }
    }
    
    if (page == 4 || page == 5 || page == 6 || page == 7 || page == 8)
    {
        if (page == 4)
        {
            mus_use = mus_tuh;
            cre_use = cre_tuh;
        }
        
        if (page == 5)
        {
            mus_use = mus_cm;
            cre_use = cre_cm;
        }
        
        if (page == 6)
        {
            mus_use = mus_m;
            cre_use = cre_m;
        }
        
        if (page == 7)
        {
            mus_use = mus_alex;
            cre_use = cre_alex;
        }
        
        if (page == 8)
        {
            mus_use = mus_ben;
            cre_use = cre_ben;
        }
        
        add_option(gt_back, undefined, function()
        {
            snd(snd_menumove);
            updateText = true;
            page = 3;
            cur = curSave;
        });
        res_i();
        
        repeat (array_length(mus_use))
        {
            i1 = audio_get_name(mus_use[i]);
            
            repeat (10)
                i1 = string_replace(i1, "_", "Ä");
            
            add_option(i1, function()
            {
                sep_seed = ["force_ENG"];
                
                if (mus_use == mus_alex && i == 4)
                {
                    sep_seed = ["force_ENG", "xs_1"];
                    ext(sAlex_SRB, 0, 640, 0, 1, 1, 0, 16777215, 0.75);
                }
                
                if (cur == i)
                    print(cre_use[i - 1], 470, 18, sFont2, undefined, ["force_ENG"]);
            });
            i++;
        }
    }
}

if (page == 4 || page == 5 || page == 6 || page == 7 || page == 8)
{
    if (TapZ)
    {
        audio_stop_all();
        audio_sound_gain(mus_use[cur - 1], 1, 0);
        ow_music(mus_use[cur - 1], true);
    }
}
