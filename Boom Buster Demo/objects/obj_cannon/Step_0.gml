if (exit_freeze() && path_lock_timer == -1)
    exit;

if (path_lock_timer > -1)
    path_lock_timer--;

anim_logic();
scale = use_curve(acurv_basics, percent_scale, "bounce", 1.3, 1);
percent_scale = approach(percent_scale, 1, 0.04);
path_follow();

repeat (abs(hspd))
    x += sign(hspd);

repeat (abs(vspd))
    y += sign(vspd);

yoff = use_curve(acurv_basics, percent_yoff, "bounce", 90, 0);
percent_yoff = approach(percent_yoff, 1, 0.015);
