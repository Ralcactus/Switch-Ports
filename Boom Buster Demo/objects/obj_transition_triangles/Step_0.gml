if (surface_get_width(application_surface) == 1920)
    x = use_curve(acurv_basics, percent, "ease_in", 0, 2270);
else
    x = use_curve(acurv_basics, percent, "ease_in", 0, 2005);

percent = approach(percent, 1, 0.025);

if (percent == 1 && alarm[0] == -1)
    alarm[0] = wait;
