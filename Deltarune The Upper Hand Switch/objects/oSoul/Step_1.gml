if (mode == "r")
    image_index = 0;

if (mode == "b")
    image_index = 1;

if (wow)
    spawnEEF(x + irandom_range(-6, 6), y + irandom_range(-6, 6), sEEF_star1, irandom_range(0, 2), "healStar,draw,randomScale");

pastX = x;
pastY = y;

if (invis > 0)
    invis--;

jumps = op.custom_airJumps + 1;

if (room != rSoulTutorial)
{
    if (oBUI.ralseiAddon > 0)
        jumps++;
    
    if (op.challengeMode)
        oBUI.deathTimerAlpha = lerp(oBUI.deathTimerAlpha, 1, 0.5);
}

if (iframes == iframes_max)
{
    iframesAn = 4;
    wow = false;
    
    if (op.st_noHit == 1)
        room_goto(rBattle);
    else
        op.noHitWin = false;
    
    array = 0;
    a_i = 0;
    left = 0;
    damage = 0;
    
    repeat (array_length(op.party))
    {
        array[a_i] = 1;
        
        if (op.hp[a_i] < 1 || lastHit == a_i)
            array[a_i] = 0;
        
        if (array[a_i] == 1)
            left = 1;
        
        damage[a_i] = oBUI.pTakedamage[a_i];
        
        if (oBUI.actions[a_i][3] == 5)
            damage[a_i] = round(damage[a_i] * 0.75);
        
        if (oBUI.extraDEF[a_i] > 0)
            damage[a_i] = round(damage[a_i] * 0.75);
        
        damage[a_i] = round(damage[a_i] * oBUI.damageTimes);
        damage[a_i] = round(damage[a_i] * groundMult);
        damage[a_i] = round(damage[a_i] * op.custom_enemyATK);
        a_i++;
    }
    
    groundMult = 1;
    
    if (left == 1)
    {
        a_i = irandom_range(0, array_length(op.party) - 1);
        
        while (array[a_i] == 0)
            a_i = irandom_range(0, array_length(op.party) - 1);
        
        lastHit = a_i;
        
        with (oPep)
        {
            if (numb == other.a_i)
                knockX = -8;
        }
        
        if (oBUI.actions[a_i][3] != 5)
            pepAn(a_i, 9, "idle");
        
        op.hp[a_i] -= damage[a_i];
        
        if (op.hp[a_i] < 1)
            op.hp[a_i] = -round(op.MAXhp[a_i] / 3);
        
        if (op.hp[a_i] < 1)
            popText("1", oBUI.pPos[a_i * 2], oBUI.pPos[1 + (a_i * 2)], sPopWords, rgb(255, 0, 0));
        else
            popText(string(damage[a_i]), oBUI.pPos[a_i * 2], oBUI.pPos[1 + (a_i * 2)], sPopWhite, 16777215);
    }
    else
    {
        a_i = 0;
        left = 0;
        
        repeat (array_length(op.party))
        {
            if (op.hp[a_i] > 0)
                left = a_i;
            
            a_i++;
        }
        
        damage[left] = round(damage[left] * 0.75);
        
        with (oPep)
        {
            if (numb == other.left)
                knockX = -8;
        }
        
        if (oBUI.actions[left][3] != 5)
            pepAn(left, 9, "idle");
        
        op.hp[left] -= damage[left];
        popText(string(damage[left]), oBUI.pPos[left * 2], oBUI.pPos[1 + (left * 2)], sPopWhite, 16777215);
    }
    
    a_i = 0;
    left = 0;
    
    repeat (array_length(op.party))
    {
        if (op.hp[a_i] > 0)
            left = 1;
        else
            pepAn(a_i, 9, "dead");
        
        a_i++;
    }
    
    if (left == 0 && op.st_noHit == -1)
    {
        op.deadRoom = room;
        room_goto(rGameOver);
    }
    
    if (op.alexMode)
        oPattern.alex_timer -= 10;
    
    if (op.challengeMode)
    {
        oPattern.alex_timer -= op.custom_dtDamage;
        oBUI.alexTimerTrack -= op.custom_dtPenalty;
    }
}

if (iframes > 0)
    iframes--;

if (iframes != 0)
{
    iframesAn++;
    
    if (iframesAn == 5)
    {
        iframesAn = 0;
        
        if (color == 16777215)
        {
            if (mode == "r")
                color = rgb(128, 128, 255);
            
            if (mode == "b")
                color = rgb(128, 128, 128);
        }
        else
        {
            color = 16777215;
        }
    }
}
else
{
    color = 16777215;
    iframesAn = 0;
}

flash += ((0 - flash) / 5);

if (an || _end)
{
    oSoul.grazeAlpha = 0;
    
    if (_end)
    {
        des(oAttack);
        des(oWow);
    }
    
    x += ((goX - sX) / 10);
    y += ((goY - sY) / 10);
    an_ty++;
    
    if (an_ty == 10)
    {
        an = false;
        
        if (_end)
        {
            oBUI.comeBack = true;
            spawnEEF(oBUI.pPos[0], oBUI.pPos[1] - 30, sSymb, 4, "heartOut");
            
            if (oBUI.susieAddon > 0)
                oBUI.susieAddon--;
            
            if (oBUI.ralseiAddon > 0)
                oBUI.ralseiAddon--;
            
            if (!array_contains(oBUI.battleProgress, "breather"))
            {
                if (oEnemie.armSprites[0] != sHand_IdleMini)
                {
                    squashHand(0, undefined, undefined, [sHand_IdleMini, sHand_IdleMiniM], function()
                    {
                        oEnemie.image_xscale = 2;
                        oEnemie.image_yscale = 2;
                    });
                }
                
                if (oEnemie.armSprites[2] != sHand_Idle2)
                    squashHand(1, undefined, undefined, [sHand_Idle2, sHand_IdleM2]);
            }
            
            if (oBUI.attackSave != -1)
            {
                oBUI.attack = oBUI.attackSave;
                oBUI.attackSave = -1;
            }
            
            des(0);
        }
    }
}

use_keys(1);

if (!move)
    res_keys();

if (an || _end)
    res_keys();

if (KeyX)
    walk = 2;
else
    walk = 4;

if (walk == 4 && (tymeUP + tymeDOWN + tymeLEFT + tymeRIGHT) == 1)
{
    if (mode == "r")
    {
        if (TapUP)
            y -= 1;
        
        if (TapDOWN)
            y += 1;
        
        if (TapLEFT)
            x -= 1;
        
        if (TapRIGHT)
            x += 1;
    }
    
    if (mode == "b")
    {
        if (TapLEFT)
            x -= 1;
        
        if (TapRIGHT)
            x += 1;
    }
}

if (mode == "r")
{
    if (KeyUP)
        y -= walk;
    
    if (KeyDOWN)
        y += walk;
    
    if (KeyLEFT)
        x -= walk;
    
    if (KeyRIGHT)
        x += walk;
}

if (mode == "b")
{
    var _inst = -4;
    
    if (room != rSoulTutorial)
    {
        if (oBUI.susieAddon > 0)
        {
            if ((TapDOWN || TapZ) && !smash && !instance_place(x, y + 7, oGround))
            {
                snd(snd_throw);
                smash = true;
                timeR = 0;
                apexR = apex;
                timeR = time;
                flash = 1;
                screenShake(1, 3);
            }
        }
    }
    
    if (smash)
        walk *= 0.5;
    
    if (KeyLEFT)
        x -= walk;
    
    if (KeyRIGHT)
        x += walk;
    
    grav += 0.6;
    grav = clamp(grav, -9999, 12);
    
    if (smash)
        grav = 13;
    
    if ((TapUP || (jj && KeyUP)) && jumpsR > 0)
    {
        smash = false;
        apexR = 0;
        
        if (place_meeting(x, y + 3, oGround) || place_meeting(x, y + 6, oGround) || place_meeting(x, y + 9, oGround))
            jumpsR = jumps;
        
        if (jumps != jumpsR)
        {
            if (x > pastX)
                spin[0] -= 360;
            else
                spin[0] += 360;
            
            size = 1.5;
            y -= 2;
            ctR = ct;
            oGraze.maxi = 0.4;
        }
        
        jumpsR--;
        timeR = 0;
    }
    
    if (KeyUP && time != timeR && jumpsR >= 0)
    {
        grav = -5;
        timeR++;
    }
    
    if ((!KeyUP && timeR != 0) && (time > timeR || (grav < -1 && apexR == 0)))
    {
        grav = -1;
        timeR = 0;
        apexR = apex;
        timeR = time;
    }
    
    if (grav > 0 && apex != apexR)
    {
        grav = 0;
        apexR++;
        
        if (apexR == 1)
        {
            if (KeyLEFT)
                x--;
            
            if (KeyRIGHT)
                x++;
        }
    }
    
    y += round(grav);
    _inst = instance_place(x, y + 7, oGround);
    
    if (_inst == -4 && grabIdTime > 0)
        _inst = instance_place(x, y + 13, oGround);
    
    jj = false;
    
    if (_inst != -4 && grav > 0 && y > soulRoof)
    {
        if (pastY < y && pastY < _inst.y)
        {
            grabId = _inst._id;
            grabIdTime = 3;
            x += _inst.move[0];
            y += _inst.move[1];
            
            while (y >= (_inst.y - 7))
            {
                smash = false;
                
                if (wow)
                {
                    wow = false;
                    oBUI.TP += 15;
                    oPattern.ss--;
                    spawnEEF(x, y - 42, sPixel, 0, "numberSS,wow");
                    screenShake(4, 5);
                }
                
                grav = 0;
                y--;
                jumpsR = jumps;
                ctR = 0;
                jj = true;
            }
        }
    }
    else if (grabIdTime > 0)
    {
        grabIdTime--;
    }
    
    if (_inst == -4)
    {
        if (ct != ctR)
            ctR++;
        
        if (jumps == jumpsR && ct == ctR)
            jumpsR--;
    }
    
    if (smash)
    {
        if (!(op.ty % 2))
            spawnEEF(x, y, sSoul, image_index, "ghostDie");
    }
}

size += ((1 - size) / 5);
spin[1] += (spin[0] - spin[1]) / 5;

if (room != rSoulTutorial)
{
    if (!(an || _end) && (oBox.xScl > 0 && oBox.yScl > 0))
    {
        if (y < ((12 + oBox.y) - (oBox.yScl * 6)))
            y = (12 + oBox.y) - (oBox.yScl * 6);
        
        if (y > (-12 + oBox.y + (oBox.yScl * 6)))
            y = -12 + oBox.y + (oBox.yScl * 6);
        
        if (x < ((12 + oBox.x) - (oBox.xScl * 6)))
            x = (12 + oBox.x) - (oBox.xScl * 6);
        
        if (x > (-12 + oBox.x + (oBox.xScl * 6)))
            x = -12 + oBox.x + (oBox.xScl * 6);
    }
    
    x = clamp(x, 10, 630);
    y = clamp(y, -9989, oBUI.soulFloorCap);
    
    if (mode == "b")
    {
        if (y == oBUI.soulFloorCap)
        {
            smash = false;
            jumpsR = jumps;
            grav = -oBUI.soulFloorBounce;
            
            if (invis == 0 && iframes == 0)
            {
                snd(snd_hurt1);
                iframes = iframes_max;
                groundMult = 1;
                screenShake(3, 3);
            }
            
            if (oBUI.attack == "final")
            {
                oBUI.soulFloorCap += 250;
                groundMult = 0.75;
            }
            
            if (op.alexMode || op.challengeMode)
                groundMult = 100;
        }
    }
    
    if (!_end)
    {
        oGraze.x = x;
        oGraze.y = y;
    }
    else
    {
        instance_destroy(oGraze);
    }
    
    op.soulX = x;
    op.soulY = y;
    
    if (array_contains(oBUI.battleProgress, "L3"))
    {
        if (oBUI.TP > 49)
            oBUI.TP--;
    }
}
else if (oCC.i1 < 4)
{
    x = clamp(x, 10, 630);
    y = clamp(y, -989, 480);
    
    if (y == 480)
    {
        smash = false;
        jumpsR = jumps;
        grav = clamp(-(grav + 0.5), 0, -11);
        snd(snd_hurt1);
        screenShake(3, 3);
    }
}
