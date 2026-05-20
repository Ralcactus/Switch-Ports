ey = 9999;
res_i();
i6 = 1;
i7 = 8;
i8 = 1;

func = function()
{
    i++;
    
    if (i == 20)
    {
        op.benAlways = true;
        op.benMode = true;
    }
};

draw = function()
{
    if (i >= 20)
    {
        i1++;
        
        if (i2 < 16)
            i2 += 4;
        
        if (i1 == 1)
        {
            snd(snd_benboing);
            i3 = -8;
        }
        
        if (i2 == 16)
        {
            i4 += i3;
            i3 += 1;
        }
        
        if (i4 > 134 && i5 == 0)
        {
            i5 = 1;
            i3 = -8;
            i6 = -1;
            i4 += 32;
            i7 = 4;
        }
        
        draw_sprite_part_ext(sGnome, i1 / i7, 0, 0, 16, i2, 345 - (i1 * i8), (222 - (i2 * 2)) + i4, 2, 2 * i6, c_white, 1);
        print("¤80085455¤", 365 - (i1 * i8), (242 - (i2 * 2)) + i4);
        
        if (i1 == 40)
        {
        }
    }
};
