testvariablenothing = false;
overlay_alpha = approach(overlay_alpha, overlay_alpha_to, 0.02857142857142857);
event_user(0);
options_in = easy_smooth(options_in, 0, 10);

if (!ready)
    timer_logic(0);

time += (global.delta_game_factor * 0.8);
select_in = dsin(time * pi) * 5;
select_ease = easy_smooth(select_ease, selected, 2);
