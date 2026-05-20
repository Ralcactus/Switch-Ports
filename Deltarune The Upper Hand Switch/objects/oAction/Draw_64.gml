if (inf_act == "fight")
{
    ext(sPixel, 0, 79, 403, 224, 2, 0, rgb(0, 0, 128), 1, 0);
    ext(sPixel, 0, 79, 441, 224, 2, 0, rgb(0, 0, 128), 1, 0);
    res_i();
    
    repeat (array_length(op.party))
    {
        if (oBUI.actions[i][0] == "fight")
        {
            get_stats(op.party[i]);
            ext(jam[4], 1, 23, 385 + (38 * i), 1, 1, 0, 16777215, 1, 0);
            ext(sSymb, 2 + ((op.language != 1) * (8 + ((op.language - 2) * 2))), 60, 376 + (38 * i), 1, 1, 0, 16777215, 1, 0);
            ext(sPixel, 0, 79, 365 + (38 * i), 125, 2, 0, jam2[0], 1, j5);
            ext(sPixel, 0, 79, 401 + (38 * i), 125, 2, 0, jam2[0], 1, j5);
            ext(sPixel, 0, 79, 365 + (38 * i), 2, 38, 0, jam2[0], 1, j5);
            ext(sPixel, 0, 202, 365 + (38 * i), 2, 38, 0, jam2[0], 1, j5);
            ext(sPixel, 0, 83, 365 + (38 * i), 2, 38, 0, jam[2], 1, 0);
            ext(sPixel, 0, 91, 365 + (38 * i), 2, 38, 0, jam[2], 1, 0);
            ext(sPixel, 0, 83, 365 + (38 * i), 10, 2, 0, jam[2], 1, 0);
            ext(sPixel, 0, 83, 401 + (38 * i), 10, 2, 0, jam[2], 1, 0);
        }
        
        i++;
    }
    
    ext(sPixel, 0, 0, 365, 480, 480, 0, 0, j8, 0);
    
    if (j5 != 0)
        j5 -= 0.1;
}
