timer_logic(0);

if (!go)
    exit;

if (on_ramp)
    spd_mult = easy_smooth(spd_mult, 0.22, 2);
else
    spd_mult = 1;

var _skater = instance_find_micro(obj_Bu_skate);

if (state == 0)
{
    percent = approach(percent, 1, percent_spd * spd_mult);
    
    if (scale <= 1.29 && !on_ramp)
    {
        on_ramp = true;
        
        with (_skater)
        {
            on_ramp = true;
            y += 46;
            anim_play(spr_Bu_skate_josh_onramp);
        }
    }
    
    x = use_curve(acurv_linear, percent, undefined, xstart, SCREEN_L + 413);
    y = use_curve(acurv_linear, percent, undefined, ystart, SCREEN_U + 552);
    scale = use_curve(acurv_linear, percent, undefined, 3, 0.9);
    
    if (percent == 1)
        exit_ramp();
}
else if (state == 1)
{
    percent = approach(percent, 1, percent_spd * spd_mult);
    x = use_curve(acurv_linear, percent, undefined, back_xstart, 325);
    y = use_curve(acurv_linear, percent, undefined, back_ystart, 469);
    scale = use_curve(acurv_linear, percent, undefined, scale_start, 0);
}

image_xscale = scale;
image_yscale = scale;
