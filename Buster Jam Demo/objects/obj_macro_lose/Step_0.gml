testvariablenothing = false;
timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);

if (!out)
{
    percent = approach(percent, 1, 0.05);
    y = use_curve(acurv_linear, percent, "in", ystart, skew);
    
    if (state == 0 && percent == 1)
    {
        state = 1;
        timer[0] = time_bpm_to_seconds(140) * 2 * 60;
    }
}
else
{
    percent = approach(percent, 1, 0.04);
    y = use_curve(acurv_linear, percent, "in", skew, (skew * 2) + 1080);
    
    if (percent == 1)
        instance_destroy();
}

hp_ind += ((sprite_get_speed(spr_trans_hp) / 60) * global.delta_game_factor);
hp_y = (y + 540) - 50;
