ty++;
ti += pi;

if (ty == 1)
{
    if ((y > oPattern.up || y < oPattern.down) && (x > oPattern.left || x < oPattern.right) && damageWait == 0 && false)
        damageWait = 15;
    
    if (as("star2") && !as("uf"))
    {
        array_insert(star, 0, [x, y]);
        x += (400 - (irandom_range(0, 5) * 20));
        y -= 480;
        forceStar = true;
        sd = 14;
    }
}

if (ty > 200 && !as("edgeSafe"))
{
    if (x < -200)
        des(0);
    
    if (x > 840)
        des(0);
    
    if (y < -200)
        des(0);
    
    if (y > 680)
        des(0);
}

if (ty > 200 && as("screenGone"))
{
    if (x < -480)
        des(0);
    
    if (x > 480)
        des(0);
    
    if (y < (oSoul.y - 480))
        des(0);
    
    if (y > (oSoul.y + 480))
        des(0);
}

x += walkX;
y += walkY;
walkX += eX;
walkY += eY;

if (walkX > speedCap)
    walkX = speedCap;

if (walkX < -speedCap)
    walkX = -speedCap;

if (walkY > speedCap)
    walkY = speedCap;

if (walkY < -speedCap)
    walkY = -speedCap;

if (as("star2"))
{
    if (!as("nd"))
        array_push(seed, "nd");
}

if (as("hand1"))
{
    if (ty == 1)
    {
        if (x < 320)
            i1 = 1;
        else
            i1 = -1;
        
        if (y < 160)
            walkY = 2;
        else
            walkY = -2;
    }
    
    if (y > (oSoul.y - 20) && y < (oSoul.y + 20) && walkY != 0)
    {
        snd(snd_wing);
        walkY = 0;
        i2 = [x, y];
        i3 = 5;
        i4 = 0;
        speedCap = 999;
    }
    
    if (walkY == 0)
    {
        i4++;
        i5 = op.superMode * 0;
        
        if ((i4 >= (20 + i5) && i4 <= (40 + i5)) || i4 >= (55 + i5))
        {
            if (i4 >= (55 + i5))
            {
                walkX -= (i1 * 3);
                
                if (x < 0 || x > 640)
                    des();
            }
            else
            {
                if (i4 == (20 + i5))
                    walkX = 5 * i1;
                
                walkX += (i1 * (1 + (op.superMode * 1)));
                
                if (i4 == (40 + i5))
                {
                    walkX = 0;
                    i3 = 5;
                    i2 = [x, y];
                    snd(snd_grab);
                    
                    if (op.superMode)
                    {
                        ma(["star1", "depth1", "graze1"], undefined, undefined, x, y, undefined, undefined, -i1 * 5, -2, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1 - as("bigStarsWooo"), 2, -8 * i1, 0]);
                        ma(["star1", "depth1", "graze1"], undefined, undefined, x, y, undefined, undefined, -i1 * 5, 0, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1 - as("bigStarsWooo"), 2, -8 * i1, 0]);
                        ma(["star1", "depth1", "graze1"], undefined, undefined, x, y, undefined, undefined, -i1 * 5, 2, undefined, undefined, undefined, undefined, undefined, [0.05, 1, 1 - as("bigStarsWooo"), 2, -8 * i1, 0]);
                    }
                }
            }
        }
        else
        {
            x = i2[0] + irandom_range(-i3, i3);
            y = i2[1] + irandom_range(-i3, i3);
        }
        
        if (i3 > 0)
            i3--;
    }
}

if (as("handUp"))
{
    if (ty == 1)
    {
        i = irandom_range(0, 30);
        i1 = irandom_range(4, 8);
    }
    
    y += ((((startY - (120 + (op.challengeMode * 60))) + (sin(((ty * pi) + (i * pi)) / 30) * 3)) - y) / i1);
}

if (as("handDown"))
{
    if (ty == 1)
    {
        i = irandom_range(0, 30);
        i1 = irandom_range(4, 8);
    }
    
    y += (((startY + (120 + (op.challengeMode * 60)) + (sin(((ty * pi) + (i * pi)) / 30) * 3)) - y) / i1);
}

if (as("hh1"))
{
    if (ty == 1)
    {
        i = 0;
        i1 = 0;
        
        if (as("1"))
            i = pi;
        
        if (direction == 90)
            i1 = 500;
        else
            i1 = -500;
    }
    
    y = startY + i1 + (sin(i + (ti * 0.02)) * 50);
    i1 += ((0 - i1) / 10);
}

if (as("slamBox"))
{
    if (ty > 3)
        des();
}

if (as("fadeIn"))
{
    if (ty < 20 && image_alpha < 1)
        image_alpha += 0.1;
}

if (as("walkDer"))
{
    y -= (dsin(startAngle) * speedCap);
    x += (dcos(startAngle) * speedCap);
}

if (as("handLazer"))
{
    if (ty == 1)
    {
        image_alpha = 1;
        sprite_index = sPixel2;
        visScale = 0;
        visScale2 = 0;
        scaleTo = 15;
        image_xscale = 9999;
        image_yscale = 0;
        
        if (oPattern.ss <= 0)
        {
            des();
        }
        else if (as(0))
        {
            audio_stop_sound(snd_segapower);
            oBUI.playSnd1 = snd_segapower;
        }
    }
    
    image_yscale = 0;
    image_angle = direction;
    
    if (visScale != 10)
        visScale += 0.5;
    
    if (ty > 30)
    {
        if (visScale2 < scaleTo)
        {
            visScale2 += 3;
            
            if (visScale2 > scaleTo)
                visScale2 = scaleTo;
        }
        
        if (visScale2 > scaleTo)
        {
            visScale2 -= 3;
            
            if (visScale2 < scaleTo)
                visScale2 = scaleTo;
        }
        
        if (visScale2 == scaleTo && scaleTo != 10)
        {
            scaleTo = 10;
            
            if (as(0))
            {
                audio_stop_sound(snd_rainbowbeam);
                oBUI.playSnd2 = snd_rainbowbeam;
                screenShake(3, 3);
            }
        }
    }
    
    if (ty > (35 + (as("late") * 3)) && ty < 45)
        image_yscale = 10;
    
    if (ty > 45)
    {
        image_alpha -= 0.1;
        
        if (image_alpha <= 0)
            des();
    }
}

if (as("followerStar"))
{
    res_i();
    
    with (oSoul)
    {
        other.i1 = x;
        other.i2 = y;
        other.i3 = iframes;
    }
    
    direction = point_direction(x, y, i1, i2);
    speed = 1.5;
    
    if (i3 > 0)
        speed = 0;
}

if (op.challengeMode)
{
    if (as("bounce"))
    {
        if (place_meeting(x, y, oGround) && walkY > 0)
            walkY = -walkY;
    }
}
