if (arrayContains(seed, "numberSS"))
{
    depth = -9999;
    
    if (ty == 0)
    {
        res_i();
        i = oPattern.ss;
        
        if (!arrayContains(seed, "wow") && room != rSoulTutorial)
            i1 = [oBUI.starMove[0], oBUI.starMove[1]];
        else
            i1 = [0, 0];
    }
    
    if (ty >= 10)
    {
        image_alpha -= 0.1;
        
        if (image_alpha <= 0)
            des();
    }
    
    if (arrayContains(seed, "wow"))
    {
        ext(sWow, 0, x, y - ty, 2, 2, undefined, undefined, image_alpha);
    }
    else
    {
        gpu_set_blendmode(bm_add);
        print(string(i), x, y - ty, undefined, undefined, ["mid", "alph", "prop"]);
        gpu_set_blendmode(bm_normal);
        x += i1[0];
        y += i1[1];
    }
}

if (arrayContains(seed, "drawENDEND"))
    draw_self();
