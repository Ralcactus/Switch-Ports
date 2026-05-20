function startBattle(arg0, arg1, arg2, arg3, arg4, arg5)
{
    op.statsText = g_t("text_stats");
    op.itemsText = g_t("text_items");
    oPlayer.draw = false;
    oPlayer.move = false;
    audio_stop_all();
    op.musicOW = -1;
    op.camMode = 0;
    op.camX = 0;
    op.camY = 0;
    op.noHitWin = true;
    op.attackSel = -1;
    audio_play_sound(op.music_battle[op.musicStyle], 0, true);
    
    if (keyboard_check(ord("1")))
    {
        audio_stop_all();
        audio_play_sound(op.meme_music[op.language - 1], 0, true);
    }
    
    if (op.benMode)
    {
        audio_stop_all();
        audio_play_sound(mus_hickcore, 0, true);
    }
    
    if (op.alexMode)
    {
        if (!op.benMode)
            audio_stop_all();
        
        var _alexSong = [mus_fentbuster, mus_delta2018buster, mus_retrobuster2, mus_horrorbuster, mus_boredbuster, mus_chapterbuster, mus_lukas_cant_make_up_his_mind_buster_bensorship, mus_memoryleakbuster, mus_tomorrowbuster, mus_theorybuster, mus_arguebuster, mus_tobybuster_r, mus_interloperbuster, mus_sweepstakesbuster];
        audio_play_sound(_alexSong[irandom_range(0, array_length(_alexSong) - 1)], 0, true);
    }
    
    if (op.challengeMode)
    {
        audio_stop_all();
        audio_play_sound(mus_path_to_nowhere, 0, true);
    }
    
    if (op.customMode)
    {
        audio_stop_all();
        audio_play_sound(mus_dead_lock, 0, true);
    }
    
    if (op.superMode)
    {
        audio_stop_all();
        audio_play_sound(mus_backwaters, 0, true);
    }
    
    op.susieStuck = true;
    op.srt_msec = 0;
    op.srt_sec = 0;
    op.srt_min = 0;
    
    if (op.st_noHit == 1)
        op.MAXhp = [1, 1, 1];
    
    op.hp = [op.MAXhp[0], op.MAXhp[1], op.MAXhp[2]];
    var enemies = string_split(arg0, ",");
    var i = 0;
    ePos = 0;
    ePos = string_split(arg2, ",");
    i = 0;
    
    repeat (array_length(ePos))
    {
        ePos[i] = real(ePos[i]);
        i++;
    }
    
    i = 0;
    
    repeat (array_length(enemies))
    {
        with (instance_create_depth(ePos[i * 2], ePos[1 + (i * 2)], -9999, oEnemie))
        {
            numb = i;
            set_enemieStats(enemies[i]);
        }
        
        i++;
    }
    
    i = 0;
    
    with (instance_create_depth(0, 0, -9999, oBUI))
    {
        tot_enemies = 0;
        tot_enemies = string_split(arg0, ",");
        pPos = 0;
        pPos = string_split(arg1, ",");
        i = 0;
        
        repeat (array_length(pPos))
        {
            pPos[i] = real(pPos[i]);
            i++;
        }
        
        ePos = 0;
        ePos = string_split(arg2, ",");
        i = 0;
        
        repeat (array_length(ePos))
        {
            ePos[i] = real(ePos[i]);
            i++;
        }
        
        pDamage = 0;
        pDamage = string_split(arg3, ",");
        i = 0;
        
        repeat (array_length(pDamage))
        {
            pDamage[i] = real(pDamage[i]);
            i++;
        }
        
        pTakedamage = 0;
        pTakedamage = string_split(arg4, ",");
        i = 0;
        
        repeat (array_length(pTakedamage))
        {
            pTakedamage[i] = real(pTakedamage[i]);
            i++;
        }
        
        healUp = 0;
        healUp = string_split(arg5, ",");
        i = 0;
        
        repeat (array_length(healUp))
        {
            healUp[i] = real(healUp[i]);
            i++;
        }
        
        i = 0;
        
        repeat (array_length(op.party))
        {
            with (instance_create_depth(pPos[i * 2], pPos[1 + (i * 2)], 0, oPep))
                numb = i;
            
            i++;
        }
    }
    
    var _iuse = 0;
    op.saveItem = [];
    
    repeat (array_length(op.item))
    {
        array_push(op.saveItem, op.item[_iuse]);
        _iuse++;
    }
    
    if (!op.customMode)
    {
        var _pushItems = ["podCake", "bonemeal", "brakPot", "brakPot", "amperSand", "amperSand", "amperSand", "amperSand", "amperSand", "amperSand", "amperSand", "amperSand"];
        
        while (array_length(op.item) != 12)
        {
            array_push(op.item, _pushItems[0]);
            array_delete(_pushItems, 0, 1);
        }
    }
}

function nextPep()
{
    pastTP[pep] = TP;
    pepBack[array_length(pepBack)] = pep;
    
    if (actions[pep][3] == 0)
        pepAn(pep, 4, "wait");
    
    if (actions[pep][3] == 1)
        pepAn(pep, 5, "wait");
    
    if (actions[pep][3] == 2 || actions[pep][3] == 3)
    {
        get_stats(op.party[pep]);
        
        if (arrayContains(jamSeed, "opt_ACT"))
            pepAn(pep, 8, "wait");
        
        if (arrayContains(jamSeed, "opt_MAG"))
            pepAn(pep, 7, "idle");
    }
    
    if (actions[pep][3] == 4)
        pepAn(pep, 3, "wait");
    
    if (actions[pep][3] == 5)
        pepAn(pep, 6, "stop");
    
    pep++;
    
    if (pep >= array_length(op.party))
    {
        pep--;
        stage = 1;
        instance_create_depth(0, 0, 0, oAActor);
    }
    
    while ((op.hp[pep] < 1 && stage == 0) || (pep == 1 && oBUI.susieStuck))
    {
        pep++;
        
        if (pep >= array_length(op.party))
        {
            pep--;
            stage = 1;
            instance_create_depth(0, 0, 0, oAActor);
        }
    }
    
    page = "s";
    cur = pm_faim[pep];
    undo_tree = 0;
    undo_tree[0] = 0;
    array_delete(undo_tree, 0, 1);
    TP -= TPremove;
}

function setAction(arg0, arg1)
{
    actions[pep][arg0] = arg1;
}

function setPattern(arg0, arg1, arg2, arg3, arg4)
{
    oBUI.e_pattern[numb] = arg0;
    oBUI.e_x[numb] = 320 + arg1;
    oBUI.e_y[numb] = 171 + arg2;
    
    if (arg3 == 0)
        oBUI.e_xScl[numb] = 12.5;
    else
        oBUI.e_xScl[numb] = arg3;
    
    if (arg4 == 0)
        oBUI.e_yScl[numb] = 12.5;
    else
        oBUI.e_yScl[numb] = arg4;
}

function endPattern()
{
    oSoul.an_ty = 0;
    oSoul.sX = oSoul.x;
    oSoul.sY = oSoul.y;
    oSoul.goX = oBUI.pPos[0];
    oSoul.goY = oBUI.pPos[1] - 30;
    oSoul._end = true;
    oBox._end = true;
    oShadow.state = 1;
    oSoul.mode = "r";
    oGround.over = true;
    des(oPattern);
    des(oAttack);
}

function pepAn(arg0, arg1, arg2, arg3 = -1)
{
    with (oPep)
    {
        if (arg0 == numb)
        {
            get_stats(realName);
            anMode = arg2;
            image_speed = 0;
            
            if (arg3 == -1)
                sprite_index = jam2[arg1];
            else
                sprite_index = arg3;
            
            if (arg1 != 2)
                image_index = 0;
            
            if (arg2 != "wait")
                image_speed = 1;
            
            if (arg2 == "dead")
                image_index = 1;
            
            imageCount = -1;
            
            if (arg3 == sKris_Pray)
            {
                spawnEEF(getPep(0).x, getPep(0).y, sKris_Pray, 0, "MSU_walk2,draw");
                spawnEEF(getPep(0).x, getPep(0).y, sKris_Pray, 0, "MSU_walk1,draw");
            }
            
            if (arg3 == sSusie_Pray)
            {
                spawnEEF(getPep(1).x, getPep(1).y, sSusie_Pray, 0, "MSU_walk2,draw");
                spawnEEF(getPep(1).x, getPep(1).y, sSusie_Pray, 0, "MSU_walk1,draw");
            }
            
            if (arg3 == sRalsei_Pray)
            {
                spawnEEF(getPep(2).x, getPep(2).y, sRalsei_Pray, 0, "MSU_walk2,draw");
                spawnEEF(getPep(2).x, getPep(2).y, sRalsei_Pray, 0, "MSU_walk1,draw");
            }
        }
    }
}
