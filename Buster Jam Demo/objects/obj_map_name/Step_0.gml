if (instance_exists(par_map_cutscene) && name_in)
{
    pause = 2;
    exit;
}

if (pause)
{
    pause = approach(pause, 0, 1);
    exit;
}

if (!ready)
    exit;

timer_logic(0);
timer_logic(1);

if (name_in)
{
    name_percent = easy_smooth(name_percent, 1, 6);
}
else
{
    percent = approach(percent, 1, 0.08);
    name_percent = use_curve(acurv_linear, percent, "in", 1, 0);
}
