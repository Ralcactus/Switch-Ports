image_xscale = 0;
image_yscale = 0;
x += 20;
y += 20;
res_i();
i = irandom_range(1, 360);
ey = 2000;

draw = function()
{
    ext(sPixel, 0, x + (dcos(i + (op.ty * 5)) * 6), y - (dsin(i + (op.ty * 7)) * 2), 2, 2);
    ext(sPixel, 0, x - (dcos(i + 110 + (op.ty * 6)) * 4), y + (dsin(i + 110 + (op.ty * 6)) * 2), 2, 2);
    ext(sPixel, 0, x + (dcos(i + 230 + (op.ty * 7)) * 6), y - (dsin(i + 230 + (op.ty * 5)) * 4), 2, 2);
};
