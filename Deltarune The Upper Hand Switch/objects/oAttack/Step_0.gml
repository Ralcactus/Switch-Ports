if ((place_meeting(x, y, oGraze) && !grazed && (!as("nd") || as("grazeAnyway"))) && !as("noGraze"))
{
    grazed = true;
    snd(snd_graze);
    oBUI.TP += graze;
    
    if (oBUI.extraTP > 0)
    {
        oBUI.TP++;
        oBUI.extraTP--;
    }
    
    oSoul.grazeAlpha = 1;
}

if (!sdone)
{
    if (starC[0] == 0)
        starC[5] += (1 - starC[5]) / 5;
    else
        starC[5] += (0.75 - starC[5]) / 2;
}

if (as("star2"))
{
    if ((place_meeting(x, y, oSoul) && starC[0] == 0 && !sdone && ty > 3) || forceStar)
    {
        if (oPattern.ss > op.highSS)
            op.highSS = oPattern.ss;
        
        if (place_meeting(x, y, oSoul))
        {
            audio_sound_pitch(snd_star, 2 - (oPattern.ss / op.highSS));
            
            if (oPattern.ss == 1)
            {
                if (room != rSoulTutorial)
                {
                    if (oBUI.attack == "final" && !op.challengeMode)
                    {
                        oEnemie.shake = 9;
                        audio_stop_all();
                    }
                }
                
                audio_sound_pitch(snd_star, 2);
            }
            
            snd(snd_star);
        }
        
        if (!forceStar && oPattern.ss > 0)
        {
            if (room == rSoulTutorial)
                oCC.i1++;
            
            oPattern.ss--;
            
            if (oPattern.ss > 0)
            {
                oSoul.invis += 3;
                spawnEEF(x, y - 42, sPixel, 0, "numberSS");
            }
            else
            {
                oSoul.invis = 999;
                
                if (!as("starExplode"))
                    star = [];
            }
        }
        
        if (room != rSoulTutorial)
            oBUI.starMove = [walkX, walkY];
        
        if (array_length(star) != 0)
        {
            walkX = 0;
            walkY = 0;
            eX = 0;
            eY = 0;
        }
        
        if (!forceStar && room != rSoulTutorial)
        {
            oBUI.TP += surfIn[5];
            
            if (oSoul.smash)
                oBUI.TP += 2;
        }
        
        if (array_length(star) != 0)
        {
            starC = [sd, x, y, star[0][0], star[0][1], 1];
            array_delete(star, 0, 1);
        }
        else
        {
            sdone = true;
            starC[0] = 15;
            screenShake(4, 5);
        }
        
        if (forceStar)
        {
            if (room != rSoulTutorial)
            {
                forced = oBUI.fallenStars;
                oBUI.fallenStars++;
            }
            else
            {
                forced = 0;
            }
        }
        
        forceStar = false;
    }
}

if (sdone)
{
    starC[5] += 0.2;
    starC[0]--;
    image_alpha -= 0.1;
    
    if (image_alpha < 0)
        des();
}

if (starC[0] != 0 && !sdone)
{
    array_push(trail, [x, y, 1]);
    x += ((starC[3] - starC[1]) / sd);
    y += ((starC[4] - starC[2]) / sd);
    starC[0]--;
    
    if (starC[0] == 1)
        starC[5] = 1;
    
    if (starC[0] == 0)
    {
        screenShake(2, 3);
        starC[5] = 1.5;
        sd = 7;
        
        if (forced != -1)
        {
            audio_stop_sound(snd_eyeflash);
            audio_sound_pitch(snd_eyeflash, 1 + (forced / 15));
            snd(snd_eyeflash);
            forced = -1;
        }
        
        if (as("starExplode") && array_length(star) == 0)
        {
            star = [];
            sdone = true;
            starC[0] = 15;
            
            if (oPattern.ss == 0)
            {
                if (array_contains(oBUI.battleProgress, "breather"))
                {
                    squashHand(0, 20, undefined, [sNothing, sNothing]);
                    setHand(1, [sHand_Dizzy, sHand_DizzyM]);
                }
                else
                {
                    setHand(1, [sHand_Hurt, sHand_HurtM]);
                }
                
                with (oAttack)
                {
                    if (as("handLazer"))
                        des();
                }
            }
            
            screenShake(8, 6);
            snd(snd_grab);
            oEnemie.armScaleType[1] = 2;
            oEnemie.armExtraScale[1] = -0.5;
            oEnemie.shake = 10;
            
            if (oPattern.ss == 0)
            {
                oEnemie.armExtraScale[1] = -1;
                oEnemie.shake = 15;
            }
        }
    }
}
