percent = approach(percent, 1, 1/30);

if (in)
    y = use_curve(acurv_linear, percent, "out", ystart + 300, ystart);
else
    y = use_curve(acurv_linear, percent, "in", ystart, ystart + 300);

anim_logic();
