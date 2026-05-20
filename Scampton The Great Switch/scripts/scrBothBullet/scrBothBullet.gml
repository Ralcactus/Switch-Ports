function scrBothBullet()
{
    if (scrACp("FolSoul"))
    {
        if (oSoul.y > y)
            direction += 0.1;
        
        if (oSoul.y < y)
            direction -= 0.1;
    }
    
    if (scrACp("JevIN"))
    {
        if (Tyme <= 10 && rTyme(2, Tyme))
        {
            if (x < 320)
                image_xscale -= 0.4;
            else
                image_xscale += 0.4;
        }
    }
    
    if (scrACp("CardSpin1"))
    {
        if (Tyme == 1)
        {
            i1[0] = 0;
            i1[1] = 0;
            
            if (j3 == 0)
            {
                if (direction == 0)
                    i1[2] = 0;
                
                if (direction == 90)
                    i1[2] = 1;
                
                if (direction == 180)
                    i1[2] = 2;
                
                if (direction == 270)
                    i1[2] = 3;
            }
            
            if (j1 == 1)
            {
                i1[2] = j2;
                i1[1] = 8;
                i1[0] = 1;
            }
        }
        
        i1[1]++;
        x = oBox.x;
        y = oBox.y;
        speed = oPattern.i1[0];
        direction = oPattern.k4 + (i1[2] * 90);
        
        if (oPattern.j1 == 2)
        {
            i1[0] = 1;
            i1[1] = 0;
        }
        
        if (i1[0] == 0)
            image_xscale = 2;
        
        if (sprite_index == sDice)
            image_index = oPattern.L1;
        
        if (i1[0] == 1)
        {
            if (oPattern.j3 == oPattern.j2)
            {
                i1[3] = sCard;
                image_index = oPattern.L1;
            }
            else
            {
                i1[3] = sCard;
            }
            
            if (i1[1] == 0)
                image_xscale = 1.75;
            
            if (i1[1] == 2)
                image_xscale = 1;
            
            if (i1[1] == 4)
                image_xscale = 0.25;
            
            if (i1[1] == 6)
                image_xscale = 0.2;
            
            if (i1[1] == 8)
            {
                image_xscale = 0.25;
                
                if (j1 == 0)
                {
                    if (i1[2] == oPattern.j2)
                    {
                        if (oMakeUI.Hatk)
                            SedCol = "7";
                        else
                            SedCol = "6";
                        
                        scrMakeAttack(oParryAttack, "NoDestroy@BlueThrough@CardSpin1@CardGet@ParFree@p" + SedCol, oPattern.BoxX, oPattern.BoxY, 0, 0, 0, 0, 0, sCard, iRan(1, oPattern.k3), 0, 0, 2, 0, direction);
                        des(0);
                    }
                }
                
                if (j1 == 1)
                {
                    scrMakeAttack(oWhiteAttack, "NoDestroy@CardSpin1@CardBack@BlueThrough", oPattern.BoxX, oPattern.BoxY, 0, 0, 0, 0, 0, i1[3], iRan(1, oPattern.k3), 0, 0, 2, 0, direction);
                    des(0);
                }
            }
            
            if (i1[1] == 10)
            {
                image_xscale = 1;
                
                if (oPattern.j3 == oPattern.j2)
                {
                    image_index = oPattern.L1;
                    sprite_index = sDice;
                }
                else
                {
                    if (sprite_index == sDice)
                        sprite_index = sCard;
                    
                    image_index = iRan(1, oPattern.k3);
                    
                    if (iRan(1, 50) == 1)
                        image_index = 5;
                }
            }
            
            if (i1[1] == 12)
                image_xscale = 1.5;
            
            if (i1[1] == 14)
                image_xscale = 2.5;
            
            if (i1[1] == 16)
                image_xscale = 2.1;
            
            if (i1[1] == 18)
            {
                image_xscale = 2;
                i1[0] = 0;
            }
        }
    }
    
    if (scrACp("speedUp1"))
    {
        if (rTyme(2, Tyme))
            speed += 0.05;
    }
    
    if (scrACp("DumHead"))
    {
        if (Tyme == 2)
            image_yscale = 0.4;
        
        if (Tyme == 4)
            image_yscale = 0.8;
        
        if (Tyme == 6)
            image_yscale = 1.2;
        
        if (Tyme == 8)
            image_yscale = 1.8;
        
        if (Tyme == 10)
            image_yscale = 2.6;
        
        if (Tyme == 12)
        {
            image_yscale = 2.2;
            sou(31);
            oAlways.ShakePower = 2;
            oAlways.ShakeTyme = 2;
        }
        
        if (Tyme == 14)
            image_yscale = 1.8;
        
        if (Tyme == 16)
            image_yscale = 2;
        
        image_xscale += ((2 - image_xscale) / 6);
        
        if (oPattern.j3 == 5)
        {
            if (image_angle == 0)
                eY = -0.25;
            
            if (image_angle == 180)
                eY = 0.25;
            
            if (image_angle == 90)
                eX = -0.25;
            
            if (image_angle == -90)
                eX = 0.25;
        }
    }
}
