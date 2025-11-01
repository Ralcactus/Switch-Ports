if (exit_freeze())
    exit;

timer_logic(0);
vspd = lerp(vspd, 0, 0.047);
y += vspd;

if (fadeOut)
{
    image_alpha -= 0.065;
    
    if (image_alpha <= 0)
        instance_destroy();
}

scale = use_curve(acurv_basics, scale_percent, "bounce", 0, 1);
scale_percent = approach(scale_percent, 1, 0.032);
