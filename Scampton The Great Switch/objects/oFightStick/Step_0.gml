Tyme += 1;

if (Tyme == 1)
{
    if (Pep == 0)
        Damage = 58;
    
    if (Pep == 1)
        Damage = 72;
    
    if (Pep == 2)
        Damage = 36;
}

if (State == 2)
{
    if (image_alpha == 1)
    {
        with (oPep)
        {
            if (Pep == (other.Pep + 1))
                image_speed = 1;
        }
        
        if (Pep == 0)
        {
            scrNumber(320, 125, 288, make_color_rgb(128, 255, 255), "MISS", "#", 0);
            oKris.sprite_index = sKris_Fight;
            oKris.image_index = 0;
        }
        
        if (Pep == 1)
        {
            scrNumber(320, 125, 288, make_color_rgb(204, 153, 204), "MISS", "#", 0);
            oSusie.sprite_index = sSusie_Fight;
            oSusie.image_index = 0;
        }
        
        if (Pep == 2)
        {
            scrNumber(320, 125, 288, make_color_rgb(53, 198, 148), "MISS", "#", 0);
            oRalsei.sprite_index = sRalsei_Fight;
            oRalsei.image_index = 0;
        }
    }
    
    image_alpha -= 0.2;
    
    if (image_alpha <= 0)
        instance_destroy();
}

if (State == 0 || State == 2)
{
    if ((round(Tyme / 2) * 2) == Tyme)
    {
        SpawnEEF += 1;
        
        if ((round(SpawnEEF / 2) * 2) == SpawnEEF)
        {
            with (instance_create_depth(x, y, -20000, oEEF))
            {
                sprite_index = sFightHuds;
                image_index = 7;
                image_xscale = 1;
                image_yscale = 1;
                image_alpha = 0.5;
                Seed = "Fade";
            }
        }
        
        x -= 8;
        oFightDraw.StickExist = 50;
        
        if (x < 190 && x >= 79)
        {
            if (Pep == 0)
                Damage += 4.46846847;
            
            if (Pep == 1)
                Damage += 2.81081081;
            
            if (Pep == 2)
                Damage += 5.62162162;
        }
        
        if (x < 79)
        {
            if (Pep == 0)
                Damage -= 17.87387388;
            
            if (Pep == 1)
                Damage -= 11.24324324;
            
            if (Pep == 2)
                Damage -= 22.48648648;
        }
    }
}
else
{
    j += 1;
    
    if (j == 1)
    {
        with (oPep)
        {
            if (Pep == (other.Pep + 1))
                image_speed = 1;
        }
    }
    
    if (sprite_index != sMidStick)
    {
        sou(52);
        
        if (x == 79)
            image_index = 1;
        else
            image_index = 0;
        
        x += 9;
        y += 19;
        sprite_index = sMidStick;
        
        if (Pep == 0)
        {
            oKris.sprite_index = sKris_Fight;
            oKris.image_index = 0;
            
            with (instance_create_depth(oKris.x, oKris.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
            
            with (instance_create_depth(oKris.x, oKris.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
            
            with (instance_create_depth(oKris.x, oKris.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
        }
        
        if (Pep == 1)
        {
            oSusie.sprite_index = sSusie_Fight;
            oSusie.image_index = 0;
            
            with (instance_create_depth(oSusie.x, oSusie.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
            
            with (instance_create_depth(oSusie.x, oSusie.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
            
            with (instance_create_depth(oSusie.x, oSusie.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
        }
        
        if (Pep == 2)
        {
            oRalsei.sprite_index = sRalsei_Fight;
            oRalsei.image_index = 0;
            
            with (instance_create_depth(oRalsei.x, oRalsei.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
            
            with (instance_create_depth(oRalsei.x, oRalsei.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
            
            with (instance_create_depth(oRalsei.x, oRalsei.y, -20000, oEEF))
            {
                Seed = "FightStar";
                sprite_index = sStarEEF_2;
            }
        }
    }
    
    if (j == 20)
    {
        oSpamtonRig.AnMode = "HIT";
        oSpamtonRig.HitAnT = 30;
        P = oSpamtonRig.HitRNG;
        
        while (P == oSpamtonRig.HitRNG)
            oSpamtonRig.HitRNG = iRan(0, 3);
        
        if (iRan(1, 50) == 1)
            oSpamtonRig.HitRNG = 4;
        
        if (oMakeUI._Last && oMakeUI.End == "G")
            Damage = round(Damage / (10 + oMakeUI.G_Fight));
        
        if (Pep == 0 && oMakeUI.Stat[3] != 0)
            Damage = round(Damage * 1.5);
        
        if (Pep == 1 && oMakeUI.Stat[4] != 0)
            Damage = round(Damage * 1.5);
        
        if (Pep == 2 && oMakeUI.Stat[5] != 0)
            Damage = round(Damage * 1.5);
        
        Damage = string(round(Damage - 1));
        
        if (Damage < 0)
            Damage = 0;
        
        oMakeUI.G_Fight += 2;
        
        if (Pep == 0)
        {
            oMakeUI.SpamtonHP -= Damage;
            sou(88);
            
            with (instance_create_depth(320, 75, -20000, oEEF))
            {
                Seed = "FightEEF_1";
                sprite_index = sFightEEF_Kris;
            }
            
            scrNumber(320, 125, 288, make_color_rgb(222, 180, 237), 0, Damage, 0);
            oSpamtonRig.LimbShake = 10;
            oTP.TP += round(4 * (Damage / 120));
        }
        
        if (Pep == 1)
        {
            oMakeUI.SpamtonHP -= Damage;
            sou(88);
            
            with (instance_create_depth(320, 100, -20000, oEEF))
            {
                Seed = "FightEEF_1";
                sprite_index = sFightEEF_Susie;
            }
            
            scrNumber(320, 125, 288, make_color_rgb(255, 235, 59), 0, Damage, 0);
            oAlways.ShakePower = 10;
            oAlways.ShakeTyme = 10;
            oTP.TP += round(4 * (Damage / 150));
        }
        
        if (Pep == 2)
        {
            oMakeUI.SpamtonHP -= Damage;
            sou(88);
            
            with (instance_create_depth(320, 125, -20000, oEEF))
            {
                Seed = "FightEEF_2";
                sprite_index = sFightEEF_Ralsei;
            }
            
            scrNumber(320, 125, 288, make_color_rgb(53, 198, 148), 0, Damage, 0);
            oSpamtonRig.LimbShake = 10;
            oTP.TP += round(4 * (Damage / 75));
        }
    }
    
    image_xscale += 0.1;
    image_yscale += 0.1;
    image_alpha -= 0.05;
    
    if (image_alpha <= 0)
        instance_destroy();
}
