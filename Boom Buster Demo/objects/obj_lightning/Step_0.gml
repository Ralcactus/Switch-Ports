if (exit_freeze())
    exit;

anim_logic();
timer_logic(0);

if (!strike)
    image_alpha = approach(image_alpha, 0.2, 0.04);
