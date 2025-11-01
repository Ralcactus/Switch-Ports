rot -= (0.75 * global.delta_game_factor);
zoom = easy_smooth(zoom, 1, 2.5);
shake = approach(shake, 0, 0.07692307692307693);

if (logo_in)
{
    logo_shake = approach(logo_shake, 0, 0.025);
    var _percent = logo_percent;
    logo_percent = approach(logo_percent, 1, 0.125);
    
    if (logo_percent == 1 && logo_percent != _percent)
        logo_shake = 1;
    
    logo_scale = use_curve(acurv_linear, logo_percent, "in", 1.5, 1);
    logo_alpha = use_curve(acurv_linear, logo_percent, "in", 0, 1);
}

timer_logic(0);
