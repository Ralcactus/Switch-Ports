if (scr_map_exit_freeze())
    exit;

timer_logic(0);
timer_logic(1);
anim_logic();
shake = approach(shake, 0, 0.1);

if (return_to_player)
{
    percent = approach(percent, 1, 0.016666666666666666);
    x = use_curve(acurv_linear, percent, "ease_in_out", xstart, xto);
    y = use_curve(acurv_linear, percent, "ease_in_out", ystart, yto);
    z = use_curve(acurv_linear, percent, "ease_in_out", zstart, zto);
    
    if (percent == 1)
        event_user(0);
}
