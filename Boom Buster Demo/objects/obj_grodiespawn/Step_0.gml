if (exit_freeze())
    exit;

timer_logic(0);
timer_logic(1);
image_alpha = approach(image_alpha, 1, 0.08);
flash_alpha = approach(flash_alpha, 0, 0.08);
anim_logic();
image_index = anim_index;
shake = approach(shake, 0, 0.25);
percent_scale = approach(percent_scale, 1, 0.03);
xscale = use_curve(acurv_basics, percent_scale, "bounce", 0, 1);
yscale = use_curve(acurv_basics, percent_scale, "bounce", 0, 1);
xshake = irandom_range(-shake, shake);
yshake = irandom_range(-shake, shake);
