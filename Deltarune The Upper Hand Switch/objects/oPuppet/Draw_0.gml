if (ty == 1)
{
    if (array_contains(atribute, "flip"))
        image_xscale = -2;
}

if ((array_contains(atribute, "k_armL") || array_contains(atribute, "k_armR")) && armStuck)
{
    with (pup_exists("k"))
    {
        other.wob = wob;
        other.eAngle = eAngle;
        other.eY = eY;
        other.shakeXY = shakeXY;
        other.x = x;
        other.y = y - 20;
        other.image_angle = image_angle;
        other.image_xscale = image_xscale;
        
        if (array_contains(atribute, "armStuck"))
            other.armStuck = false;
    }
}

if (array_contains(atribute, "k_armL") && armStuck)
{
    x -= (10 * image_xscale * dcos(image_angle));
    image_angle += (dcos(wob * 5) * 10);
}

if (array_contains(atribute, "k_armR") && armStuck)
{
    x += (10 * image_xscale * dcos(image_angle));
    image_angle += (dsin(wob * 5) * 10);
}

if (!armStuck)
    y += 6;

if (array_contains(atribute, "zero"))
{
    wob += ((0 - wob) / 10);
    eAngle += ((0 - eAngle) / 10);
    eY += ((0 - eY) / 10);
}

if (array_contains(atribute, "wobY") || array_contains(atribute, "forceWobY") || array_contains(atribute, "forceWobY2"))
{
    if (pastX != x || array_contains(atribute, "forceWobY") || array_contains(atribute, "forceWobY2"))
    {
        wob += (abs(x - pastX) + (array_contains(atribute, "forceWobY") * 3) + (array_contains(atribute, "forceWobY2") * 9));
        eAngle += (((dsin(wob * 5) * 3) - eAngle) / slick);
    }
    else
    {
        eAngle += ((0 - eAngle) / 3);
    }
    
    eY += (((dsin(wob * 4) * 10) - eY) / slick);
}

if (array_contains(atribute, "rot"))
    eAngle += (((dsin(op.ty * 5) * 2) - eAngle) / slick);

if (array_contains(atribute, "shake"))
    eX = ((dsin(op.ty * 160) * 2) - eAngle) / slick;

if (array_contains(atribute, "imageFlip"))
{
    if (imageFlip[0] == 0)
        imageFlip[2] = image_index;
    
    if (!array_contains(atribute, "a") || (array_contains(atribute, "a") && imageFlip[0] != 0))
    {
        if (!(imageFlip[0] % (10 - (array_contains(atribute, "speed2") * 5))))
        {
            if (imageFlip[1] == 0)
                imageFlip[1] = 1;
            else
                imageFlip[1] = 0;
            
            image_index = imageFlip[2] + imageFlip[1];
        }
    }
    
    imageFlip[0]++;
}
else
{
    imageFlip[0] = 0;
}

if (array_contains(atribute, "scaleFlip"))
{
    if (scaleFlip[0] == 0)
        scaleFlip[1] = image_xscale;
    
    if (!array_contains(atribute, "a") || (array_contains(atribute, "a") && scaleFlip[0] != 0))
    {
        if (!(scaleFlip[0] % 20))
            scaleFlip[1] *= -1;
    }
    
    image_xscale += ((scaleFlip[1] - image_xscale) / 1.0625);
    scaleFlip[0]++;
}
else
{
    scaleFlip[0] = 0;
    scaleFlip[1] = 2;
}

if (array_contains(atribute, "scaleFix"))
    image_xscale = 2;

if (array_contains(atribute, "gray"))
{
    color = [127.5, 127.5, 127.5];
    
    if (tyA <= 1)
        colorIS = [127.5, 127.5, 127.5];
}
else
{
    color = [255, 255, 255];
}

colorIS[0] += (color[0] - colorIS[0]) / 3;
colorIS[1] += (color[1] - colorIS[1]) / 3;
colorIS[2] += (color[2] - colorIS[2]) / 3;
slick += ((1 - slick) / 3);
