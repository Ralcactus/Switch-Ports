if (instance_exists(obj_choice_manager))
    overlay_alpha = approach(overlay_alpha, 0.45, 0.025);
else
    overlay_alpha = approach(overlay_alpha, 0, 0.04);

timer_logic(0);
