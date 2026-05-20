if (Chield != 0)
    Chield -= 1;

if (Damage)
{
    pHP = 0;
    pHP[0] = oMakeUI.HP[0];
    pHP[1] = oMakeUI.HP[1];
    pHP[2] = oMakeUI.HP[2];
    DevDam = 1;
    MI = false;
    oP.HaveHit++;
    
    if (oMakeUI._Last)
        DevDam = 8;
    
    if (oP.NoHit == "Disabled")
        sou(snd_hurt1);
    
    Damage = false;
    ShakeTyme += 5;
    ShakePower += 3;
    StackNumber = 0;
    
    if (DamageMode == "Normal")
    {
        DA[0] = 37;
        DA[1] = 25;
        DA[2] = 29;
        DA[3] = 32;
        DA[4] = 19;
        DA[5] = 23;
        
        if ((oMakeUI.HP[0] < 1 && oMakeUI.HP[1] < 1) || (oMakeUI.HP[0] < 1 && oMakeUI.HP[2] < 1) || (oMakeUI.HP[1] < 1 && oMakeUI.HP[2] < 1))
        {
            if (oMakeUI.HP[1] < 1 && oMakeUI.HP[2] < 1)
            {
                Pep = 0;
                
                if (oMakeUI.Stat[6] != 0)
                {
                    MI = true;
                    oMakeUI.Stat[6] = 0;
                }
            }
            
            if (oMakeUI.HP[0] < 1 && oMakeUI.HP[2] < 1)
            {
                Pep = 1;
                
                if (oMakeUI.Stat[7] != 0)
                {
                    MI = true;
                    oMakeUI.Stat[7] = 0;
                }
            }
            
            if (oMakeUI.HP[0] < 1 && oMakeUI.HP[1] < 1)
            {
                Pep = 2;
                
                if (oMakeUI.Stat[8] != 0)
                {
                    MI = true;
                    oMakeUI.Stat[8] = 0;
                }
            }
        }
        else
        {
            while (Pep == PastPep || oMakeUI.HP[Pep] < 1)
                Pep = irandom_range(0, 2);
            
            if (Pep == 0 && oMakeUI.Stat[6] != 0)
            {
                Pep = irandom_range(1, 2);
                
                while (oMakeUI.HP[Pep] < 1)
                    Pep = irandom_range(1, 2);
            }
            
            if (Pep == 1 && oMakeUI.Stat[7] != 0)
            {
                Pep = irandom_range(0, 1);
                
                if (Pep == 1)
                    Pep = 2;
                
                while (oMakeUI.HP[Pep] < 1)
                {
                    Pep = irandom_range(0, 1);
                    
                    if (Pep == 1)
                        Pep = 2;
                }
            }
            
            if (Pep == 2 && oMakeUI.Stat[8] != 0)
            {
                Pep = irandom_range(0, 1);
                
                while (oMakeUI.HP[Pep] < 1)
                    Pep = irandom_range(0, 1);
            }
        }
        
        PastPep = Pep;
        
        if (oMakeUI.Stat[Pep] != 0)
            DevDam = 1.5;
        
        if (oMakeUI.DamageMode == 1)
            DevDam *= 0.75;
        
        y = 285;
        
        if (Pep == 0)
        {
            x = 45;
            oKris.KnockX = -20;
            
            if (MI)
            {
                scrNumber(x, y, 288, make_color_rgb(0, 255, 255), "IMMUNE", "#", 0);
            }
            else if (oMakeUI.FAISD[0] == 5)
            {
                oMakeUI.HP[0] -= round(DA[3] / DevDam);
                
                if (oMakeUI.HP[0] > 0)
                    scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, round(DA[3] / DevDam), 0);
            }
            else
            {
                oKris.sprite_index = sKris_Hit;
                oMakeUI.HP[0] -= round(DA[0] / DevDam);
                
                if (oMakeUI.HP[0] > 0)
                    scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, round(DA[0] / DevDam), 0);
            }
        }
        
        if (Pep == 1)
        {
            x = 260;
            oSusie.KnockX = -20;
            
            if (MI)
            {
                scrNumber(x, y, 288, make_color_rgb(0, 255, 255), "IMMUNE", "#", 0);
            }
            else if (oMakeUI.FAISD[1] == 5)
            {
                oMakeUI.HP[1] -= round(DA[4] / DevDam);
                
                if (oMakeUI.HP[1] > 0 && oMakeUI.SMN)
                    scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, round(DA[4] / DevDam), 0);
            }
            else
            {
                oSusie.sprite_index = sSusie_Hit;
                oMakeUI.HP[1] -= round(DA[1] / DevDam);
                
                if (oMakeUI.HP[1] > 0 && oMakeUI.SMN)
                    scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, round(DA[1] / DevDam), 0);
            }
        }
        
        if (Pep == 2)
        {
            x = 475;
            oRalsei.KnockX = -20;
            
            if (MI)
            {
                scrNumber(x, y, 288, make_color_rgb(0, 255, 255), "IMMUNE", "#", 0);
            }
            else if (oMakeUI.FAISD[2] == 5)
            {
                oMakeUI.HP[2] -= round(DA[5] / DevDam);
                
                if (oMakeUI.HP[2] > 0)
                    scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, round(DA[5] / DevDam), 0);
            }
            else
            {
                oRalsei.sprite_index = sRalsei_Hit;
                oMakeUI.HP[2] -= round(DA[2] / DevDam);
                
                if (oMakeUI.HP[2] > 0)
                    scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, round(DA[2] / DevDam), 0);
            }
        }
        
        if (oMakeUI.HP[Pep] < 1)
        {
            oMakeUI.HP[Pep] = -(45 + (irandom_range(0, 5) * 5));
            
            if (oMakeUI._Last)
                oMakeUI.HP[Pep] = -1;
            
            if (Pep == 0)
            {
                oKris.sprite_index = sKris_Down;
                scrNumber(45, y, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
            }
            
            if (Pep == 1)
            {
                oSusie.sprite_index = sSusie_Down;
                scrNumber(260, y, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
            }
            
            if (Pep == 2)
            {
                oRalsei.sprite_index = sRalsei_Down;
                scrNumber(475, y, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
            }
        }
    }
    
    if (DamageMode == "All")
    {
        DA[0] = 18;
        DA[1] = 23;
        DA[2] = 21;
        DA[3] = 12;
        DA[4] = 16;
        DA[5] = 14;
        
        if (oMakeUI.Stat[0] != 0)
        {
            DA[0] = round(DA[0] / 1.5);
            DA[3] = round(DA[3] / 1.5);
        }
        
        if (oMakeUI.Stat[1] != 0)
        {
            DA[1] = round(DA[1] / 1.5);
            DA[4] = round(DA[4] / 1.5);
        }
        
        if (oMakeUI.Stat[2] != 0)
        {
            DA[2] = round(DA[2] / 1.5);
            DA[5] = round(DA[5] / 1.5);
        }
        
        if (oMakeUI.Pattern == "L1")
        {
            if (oMakeUI.HP[0] < 50)
            {
                DA[0] = round(DA[0] / 5);
                DA[3] = round(DA[3] / 5);
            }
            
            if (oMakeUI.HP[1] < 50)
            {
                DA[1] = round(DA[1] / 5);
                DA[4] = round(DA[4] / 5);
            }
            
            if (oMakeUI.HP[2] < 50)
            {
                DA[2] = round(DA[2] / 5);
                DA[5] = round(DA[5] / 5);
            }
        }
        
        y = 285;
        StackNumber = 0;
        
        if (oMakeUI.HP[0] > 0)
        {
            x = 45;
            oKris.KnockX = -20;
            
            if (oMakeUI.Stat[6] != 0)
            {
                oMakeUI.Stat[6] = 0;
                scrNumber(x, y, 288, make_color_rgb(0, 255, 255), "IMMUNE", "#", 0);
            }
            else
            {
                if (oMakeUI.FAISD[0] == 5)
                {
                    oMakeUI.HP[0] -= DA[3];
                    
                    if (oMakeUI.HP[0] > 0)
                        scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, DA[3], 0);
                }
                else
                {
                    oKris.sprite_index = sKris_Hit;
                    oMakeUI.HP[0] -= DA[0];
                    
                    if (oMakeUI.HP[0] > 0)
                        scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, DA[0], 0);
                }
                
                if (oMakeUI.HP[0] < 1)
                {
                    oMakeUI.HP[0] = -(45 + (irandom_range(0, 5) * 5));
                    
                    if (oMakeUI._Last)
                        oMakeUI.HP[0] = -1;
                    
                    oKris.sprite_index = sKris_Down;
                    scrNumber(x, y, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
                }
            }
        }
        
        StackNumber = 0;
        
        if (oMakeUI.HP[1] > 0)
        {
            x = 260;
            oSusie.KnockX = -20;
            
            if (oMakeUI.Stat[7] != 0)
            {
                oMakeUI.Stat[7] = 0;
                scrNumber(x, y, 288, make_color_rgb(0, 255, 255), "IMMUNE", "#", 0);
            }
            else
            {
                if (oMakeUI.FAISD[1] == 5)
                {
                    oMakeUI.HP[1] -= DA[4];
                    
                    if (oMakeUI.HP[1] > 0 && oMakeUI.SMN)
                        scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, DA[4], 0);
                }
                else
                {
                    oSusie.sprite_index = sSusie_Hit;
                    oMakeUI.HP[1] -= DA[1];
                    
                    if (oMakeUI.HP[1] > 0 && oMakeUI.SMN)
                        scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, DA[1], 0);
                }
                
                if (oMakeUI.HP[1] < 1)
                {
                    oMakeUI.HP[1] = -(45 + (irandom_range(0, 5) * 5));
                    
                    if (oMakeUI._Last)
                        oMakeUI.HP[1] = -1;
                    
                    oSusie.sprite_index = sSusie_Down;
                    scrNumber(x, y, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
                }
            }
        }
        
        StackNumber = 0;
        
        if (oMakeUI.HP[2] > 0)
        {
            x = 475;
            oRalsei.KnockX = -20;
            
            if (oMakeUI.Stat[8] != 0)
            {
                oMakeUI.Stat[8] = 0;
                scrNumber(x, y, 288, make_color_rgb(0, 255, 255), "IMMUNE", "#", 0);
            }
            else
            {
                if (oMakeUI.FAISD[2] == 5)
                {
                    oMakeUI.HP[2] -= DA[5];
                    
                    if (oMakeUI.HP[2] > 0)
                        scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, DA[5], 0);
                }
                else
                {
                    oRalsei.sprite_index = sRalsei_Hit;
                    oMakeUI.HP[2] -= DA[2];
                    
                    if (oMakeUI.HP[2] > 0)
                        scrNumber(x, y, 288, make_color_rgb(255, 255, 255), 0, DA[2], 0);
                }
                
                if (oMakeUI.HP[2] < 1)
                {
                    oMakeUI.HP[2] = -(45 + (irandom_range(0, 5) * 5));
                    
                    if (oMakeUI._Last)
                        oMakeUI.HP[2] = -1;
                    
                    oRalsei.sprite_index = sRalsei_Down;
                    scrNumber(x, y, 288, make_color_rgb(255, 0, 0), "DOWN", "#", 0);
                }
            }
        }
    }
    
    StackNumber = 0;
    
    if (oMakeUI.HP[0] < 1 && oMakeUI.HP[1] < 1 && oMakeUI.HP[2] < 1)
    {
        oP.Deaths += 1;
        
        with (instance_create_depth(oSoul.x, oSoul.y, -9999, oSoulShard))
        {
            sprite_index = sSoulShard;
            MoveX = -10;
            MoveY = -7;
        }
        
        with (instance_create_depth(oSoul.x, oSoul.y, -9999, oSoulShard))
        {
            sprite_index = sSoulShard;
            MoveX = 7;
            MoveY = -12;
        }
        
        with (instance_create_depth(oSoul.x, oSoul.y, -9999, oSoulShard))
        {
            sprite_index = sSoulShard2;
            MoveX = 12;
            MoveY = -4;
        }
        
        with (instance_create_depth(oSoul.x, oSoul.y, -9999, oSoulShard))
        {
            sprite_index = sSoulShard;
            MoveX = 3;
            MoveY = -3;
        }
        
        with (instance_create_depth(oSoul.x, oSoul.y, -9999, oSoulShard))
        {
            sprite_index = sSoulShard2;
            MoveX = -4;
        }
        
        audio_stop_sound(snd_chargeshot_charge);
        
        if (oP.NoHit == "Disabled")
        {
            sou(snd_break2);
            room_goto(rGameOver);
        }
        else
        {
            instance_create_depth(0, 0, 0, oGameOver_NoHit);
            room_goto(rBattle_2);
        }
    }
    
    if (oMakeUI.HP[0] < 1)
    {
        with (oPep)
        {
            if (Pep == 1 && sprite_index != ans[8])
            {
                sprite_index = ans[8];
                image_index = 0;
                image_speed = 1;
            }
        }
    }
    else
    {
        with (oPep)
        {
            if (Pep == 1 && other.pHP[0] != oMakeUI.HP[0])
            {
                HurtTime = 20;
                
                if (sprite_index != ans[5])
                {
                    sprite_index = ans[9];
                    image_index = 0;
                }
            }
        }
    }
    
    if (oMakeUI.HP[1] < 1)
    {
        with (oPep)
        {
            if (Pep == 2 && sprite_index != ans[8])
            {
                sprite_index = ans[8];
                image_index = 0;
                image_speed = 1;
            }
        }
    }
    else
    {
        with (oPep)
        {
            if (Pep == 2 && other.pHP[1] != oMakeUI.HP[1])
            {
                HurtTime = 20;
                
                if (sprite_index != ans[5])
                {
                    sprite_index = ans[9];
                    image_index = 0;
                }
            }
        }
    }
    
    if (oMakeUI.HP[2] < 1)
    {
        with (oPep)
        {
            if (Pep == 3 && sprite_index != ans[8])
            {
                sprite_index = ans[8];
                image_index = 0;
                image_speed = 1;
            }
        }
    }
    else
    {
        with (oPep)
        {
            if (Pep == 3 && other.pHP[2] != oMakeUI.HP[2])
            {
                HurtTime = 20;
                
                if (sprite_index != ans[5])
                {
                    sprite_index = ans[9];
                    image_index = 0;
                }
            }
        }
    }
}
