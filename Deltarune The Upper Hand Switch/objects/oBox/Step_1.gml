ty++;

if (_end)
{
    if (image_xscale > 0)
    {
        if (xScl > 0 && yScl > 0)
            spawnEEF(x, y, sBox, 1, "drawN,ghostDie,boxAtro");
        
        image_xscale -= (xScl / 15);
        image_yscale -= (yScl / 15);
        image_angle += 12;
    }
    
    if (image_xscale <= 0)
    {
        wait++;
        
        if (wait == 20)
            des(0);
    }
}
else
{
    if (image_xscale != xScl)
    {
        if (xScl > 0 && yScl > 0)
            spawnEEF(x, y, sBox, 1, "drawN,ghostDie,boxAtro");
        
        image_xscale += (xScl / 15);
        image_angle += 12;
    }
    
    if (image_yscale != yScl)
        image_yscale += (yScl / 15);
}
