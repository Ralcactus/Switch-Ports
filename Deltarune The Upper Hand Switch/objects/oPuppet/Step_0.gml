pastX = x;
pastY = y;
ty++;
tyA++;

if (targetTrue)
{
    if (array_contains(atribute, "glide"))
    {
        glide = true;
        targetTrue = false;
    }
    else
    {
        glide = false;
    }
}

if (targetTrue)
{
    if (targetX != -1)
    {
        if (x > targetX)
        {
            x -= speed_;
            
            if (x < targetX)
                x = targetX;
        }
        
        if (x < targetX)
        {
            x += speed_;
            
            if (x > targetX)
                x = targetX;
        }
    }
    
    if (targetY != -1)
    {
        if (y > targetY)
        {
            y -= speed_;
            
            if (y < targetY)
                y = targetY;
        }
        
        if (y < targetY)
        {
            y += speed_;
            
            if (y > targetY)
                y = targetY;
        }
    }
    
    if (x == targetX && y == targetY)
    {
        targetTrue = false;
        targetX = -1;
        targetY = -1;
        
        if (array_contains(atribute, "destroyWalk"))
            des();
        
        if (array_contains(atribute, "nextImage"))
            image_index++;
    }
    
    if (array_contains(atribute, "ex") || array_contains(atribute, "ex2"))
    {
        speed_ += 0.5;
        
        if (array_contains(atribute, "ex2"))
            speed_ += 0.5;
        
        if (!targetTrue)
        {
            shake = 4;
            
            if (sound != -1)
            {
                snd(sound);
                sound = -1;
            }
            
            if (sound2 != -1)
            {
                snd(sound2);
                sound2 = -1;
            }
        }
    }
}

if (glide)
{
    if (targetX != -1)
        x += ((targetX - x) / 5);
    
    if (targetY != -1)
        y += ((targetY - y) / 5);
}

if (func != -1)
{
    func();
    func = -1;
}

if (run != -1)
    run();

if (array_contains(atribute, "scared"))
    shake = 1;

if (shake > 0)
{
    shakeXY = [irandom_range(-shake, shake), irandom_range(-shake, shake)];
    
    if (shake > 0)
        shake--;
}
else
{
    shakeXY = [0, 0];
}

if (room == rPuppetshow2)
{
    if (oPuppetShow2.time > 780 && oPuppetShow2.time < 920)
    {
        if (oTornado.grab && (numb != "k_armL" && numb != "k_armR"))
        {
            if (numb == "k")
                tornadoPos(0);
            
            if (numb == "r")
                tornadoPos(1);
            
            if (numb == "s")
                tornadoPos(2);
            
            if (numb == "rush")
                tornadoPos(3);
            
            tornadoGrabTime -= 2;
            tornadoGrabTime = clamp(tornadoGrabTime, 2, 9999);
            
            if (tornadoGrabTime == 2)
            {
                if (numb == "k")
                    op.ty += tornadoGrabMoreSpeed;
                
                tornadoGrabMoreSpeed += 0.025;
            }
            
            tornadoGrabRot += 1;
            tornadoGrabRot = clamp(tornadoGrabRot, 0, 10);
            image_angle += (tornadoGrabRot * tornadoGrabRotMod);
            tornadoGrabTy[0] += 1;
            
            if (tornadoGrabTy[0] > 100)
            {
                tornadoGrabTy[1] += 1;
                tornadoGrabTy[2] += tornadoGrabTy[1];
                y -= tornadoGrabTy[2];
                
                if (numb == "k")
                    oTornado.y -= tornadoGrabTy[1];
            }
        }
    }
}
