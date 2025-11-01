if (exit_freeze() || !ready)
    exit;

timer_logic(0);

if (special != -4)
    sprite_index = special;

image_alpha = approach(image_alpha, image_alpha_override * !out, 0.06);
