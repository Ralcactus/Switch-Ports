if (instance_exists(obj_microgame_controller) && obj_microgame_controller.ready && !obj_microgame_controller.out)
    image_alpha = approach(image_alpha, 0, 0.1);
else
    image_alpha = approach(image_alpha, 1, 1);

scr_draw_transition_gui();
