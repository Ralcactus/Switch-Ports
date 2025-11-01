percent = approach(percent, 1, 0.035);
x = use_curve(acurv_linear, percent, "ease_in_out", x_start, xto);

if (place_meeting_micro(x, y, obj_micro_cratememory_coin))
    has_coin = true;
