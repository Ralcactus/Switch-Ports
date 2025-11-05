fakez = lerp(fakez, 0, 0.035);
image_xscale = fakez;
image_yscale = fakez;
y += (vsp * fakez);
vsp += 0.5;

if (fakez <= 0)
    instance_destroy();
