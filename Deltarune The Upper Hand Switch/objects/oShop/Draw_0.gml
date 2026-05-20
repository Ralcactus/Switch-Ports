if (page == "buy" || page == "buy2")
{
    _ex -= 10;
    
    if (cur == 4)
        _eys += 15;
    else
        _eys -= 15;
}
else
{
    _ex += 10;
    _eys = 0;
}

_ex = clamp(_ex, -120, 0);
_eys = clamp(_eys, -180, 0);

if (isX > targetX)
{
    isX -= targetSpeed;
    
    if (isX < targetX)
        isX = targetX;
}

if (isX < targetX)
{
    isX += targetSpeed;
    
    if (isX > targetX)
        isX = targetX;
}

if (isY > targetY)
{
    isY -= targetSpeed;
    
    if (isY < targetY)
        isY = targetY;
}

if (isY < targetY)
{
    isY += targetSpeed;
    
    if (isY > targetY)
        isY = targetY;
}

if (isXhand > targetXhand)
{
    isXhand -= targetSpeed;
    
    if (isXhand < targetXhand)
        isXhand = targetXhand;
}

if (isXhand < targetXhand)
{
    isXhand += targetSpeed;
    
    if (isXhand > targetXhand)
        isXhand = targetXhand;
}

if (isYhand > targetYhand)
{
    isYhand -= targetSpeed;
    
    if (isYhand < targetYhand)
        isYhand = targetYhand;
}

if (isYhand < targetYhand)
{
    isYhand += targetSpeed;
    
    if (isYhand > targetYhand)
        isYhand = targetYhand;
}

if (faceImage == 7)
{
    if (!(op.ty % 10))
    {
        if (faceImage2 == 0)
            faceImage2 = 1;
        else
            faceImage2 = 0;
    }
}
else
{
    faceImage2 = 0;
}

if (handTalk)
{
    if (!(op.ty % 6))
    {
        if (handImage2 == 0)
            handImage2 = 7;
        else
            handImage2 = 0;
    }
}
else
{
    handImage2 = 0;
}

if (handShake)
    handShakeX = irandom_range(-5, 5);
else
    handShakeX = 0;

ext(sShopFace, faceImage + faceImage2, 350 + _ex + isX, 240 + isY);
ext(sShopFace, handImage + handImage2, 170 + round(_ex / 1.5) + (isX * sockLock) + isXhand + handShakeX, 240 + (isY * sockLock) + isYhand);

if (bcON)
    ext(sPlayBC, 0, 0, 0);
