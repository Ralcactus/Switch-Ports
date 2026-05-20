res_i();
res_j();
i = 60;
ey = 20;

draw = function()
{
    i1++;
    ext(sProps, 7, x + i, y + ey);
    ext(sProps, 8, x + i + (dcos((op.ti * 3) / 2) * 2), y + ey + (dsin((op.ti * 2) / 2) * 2));
    ext(sProps, 9, (x + i) - (dcos((op.ti * 2) / 2) * 2), y + ey + (dsin((op.ti * 3) / 2) * 2));
    
    if (!(i1 % 50))
    {
        res_j();
        j = 1;
        j1 = [irandom_range(0, 40), irandom_range(0, 30)];
        j3 = 0;
    }
    
    if (j == 1)
    {
        j2 += 0.1;
        j1[0] += j2 * 3;
        j1[1] += j2;
        
        if (j2 > 2.1)
            j3 -= 0.1;
        else if (j3 != 1)
            j3 += 0.25;
        
        ext(sProps, 10, x + i + j1[0], y + ey + j1[1], undefined, undefined, undefined, undefined, j3);
    }
};
