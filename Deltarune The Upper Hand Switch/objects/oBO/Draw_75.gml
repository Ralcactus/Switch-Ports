if (seed == "fightStick")
{
    if (((ty + 1) % 2) == 1 && i2 == 0)
        spawnEEF(x, y, sPixel, 0, "ghostDie,FSxy,halfGhost");
    
    if (ty == 0)
    {
        i4 = oBUI.pDamage[i3] - ((224 + (72 * i)) / 2);
        x += (224 + (72 * i));
    }
    
    if (i > -1)
    {
        x -= 8;
        
        if (x < 85)
            i4 -= 8;
        else
            i4 += 4;
    }
    
    ext(sPixel, 0, x, y, 6, 38, 0, 16777215, 1, 0);
    
    if (i2 != 0)
        des(0);
}
