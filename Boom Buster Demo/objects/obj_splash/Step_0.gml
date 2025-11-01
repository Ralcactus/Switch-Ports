if (move)
{
    move_percent = approach(move_percent, 1, 0.008);
    bg_alpha = approach(bg_alpha, 0, 0.05);
}

x = use_curve(acurv_basics, move_percent, "ease_inout", x, 154);
y = use_curve(acurv_basics, move_percent, "ease_inout", y, 84);
scale = use_curve(acurv_basics, move_percent, "ease_inout", scale, 0.3);
image_xscale = scale;
image_yscale = scale;

if (move_percent >= 0.4 && obj_title.state == -1)
    obj_title.state = 0;
