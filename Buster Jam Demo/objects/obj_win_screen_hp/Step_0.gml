if (in)
    percent = approach(percent, 1, 1/30);

y = use_curve(acurv_linear, percent, "out", ystart + 225, ystart);
percent_scale = approach(percent_scale, 1, 0.04);
scale = use_curve(acurv_elastic, percent_scale, undefined, 0.4, 1);
image_xscale = scale;
image_yscale = scale;
shake = approach(shake, 0, 1/15);
anim_logic();
