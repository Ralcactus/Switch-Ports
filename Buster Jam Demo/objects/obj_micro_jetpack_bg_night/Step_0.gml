if (instance_exists(obj_microscanner_setup))
    exit;

if (controller.win)
    stars_alpha = approach(stars_alpha, 1, 0.05);
