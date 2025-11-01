if (exit_freeze())
    exit;

timer_logic(0);
percent = approach(percent, 1, 0.025);
x = use_curve(acurv_basics, percent, "ease_in", x, 1631);
y = use_curve(acurv_basics, percent, "ease_in", y, 1020);

if (percent >= 0.85)
{
    if (!anim)
    {
        scale = 1.7;
        anim = true;
    }
    
    scalespd += 0.02;
    scale = approach(scale, 0, scalespd);
    
    if (!added_combo && scale <= 0.5 && !global.nuclear)
    {
        var _meter = global.combo_meter;
        global.combo_meter += (image_index + 1 + (image_index * 0.5));
        
        if (global.combo_meter >= global.combo_metermax && _meter < global.combo_metermax)
        {
            audio_play_sound(snd_meter, 0, 0);
            obj_controller.foodbar_flash = 1;
        }
        
        added_combo = true;
    }
    
    if (scale == 0 && timer[0] == -1)
        timer[0] = 15;
}

image_alpha = approach(image_alpha, 0.7, 0.06);
scale_down = approach(scale_down, 0.75, 0.06);
