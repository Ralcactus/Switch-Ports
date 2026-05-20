res_i();

draw = function()
{
    i1 = [x + (image_xscale * 20), y + (image_yscale * 40)];
    ext(sProps, 17, i1[0], i1[1]);
    ext(sProps, 18, i1[0] + oCC.i1, i1[1]);
    
    if (oCC.j2)
    {
        ext(sSock_Puppet, 0, (i1[0] - 18) + (oCC.i5 * sin(op.ty / 8) * 0.75), (i1[1] - 22) + oCC.i2 + (oCC.i5 * sin(op.ty / 4) * 4), 2 * oCC.i3);
        ext(sSock_Puppet, 1, i1[0] + 8, (i1[1] - 22) + oCC.i2, undefined, 2 + (oCC.i5 * sin(op.ty / 6) * 0.1));
        draw_sprite_part_ext(sProps, 21, 0, 0, 200, 89 - (oCC.i4 * 0.5), i1[0] - 200, (i1[1] - 200) + oCC.i4, 2, 2, c_white, 1);
        ext(sSock_Spiral, op.ty / 2, i1[0] + oCC.j1[0], (i1[1] - 10) + oCC.j1[1]);
    }
    
    ext(sProps, 19, i1[0] + oCC.i1, i1[1]);
};
