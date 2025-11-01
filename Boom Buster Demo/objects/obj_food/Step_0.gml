event_inherited();

if (exit_freeze())
    exit;

timer_logic(3);
time += 0.04;
effect_alpha = effect_alpha_add * (0.5 + (sin(time * 0.2 * pi) * 0.2));

if (collected || out)
{
    lenAdd += min(max(0.08, lenAdd), 6);
    effect_alpha_add = approach(effect_alpha_add, 0, 0.05);
    
    if (out && effect_alpha_add == 0)
        instance_destroy();
}

if (!out)
{
    scale = use_curve(acurv_basics, percent_scale, "bounce", 0, 1);
    percent_scale = approach(percent_scale, 1, 0.03);
}
