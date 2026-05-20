function scrMoveROT(arg0, arg1, arg2, arg3)
{
    x = arg0;
    y = arg1;
    x += (cos(arg2 / 57.1) * arg3 * (Spam_Xscale / 2));
    y -= (sin(arg2 / 57.1) * arg3 * (Spam_Yscale / 2));
}

function moveRot(arg0, arg1, arg2, arg3)
{
    var fixRot = arg2;
    
    while (fixRot > 360)
        fixRot -= 360;
    
    while (fixRot < 0)
        fixRot += 360;
    
    x = arg0;
    y = arg1;
    x += (cos(fixRot / 57.1) * arg3);
    y -= (sin(fixRot / 57.1) * arg3);
}
