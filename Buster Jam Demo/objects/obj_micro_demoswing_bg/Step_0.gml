time += (2.5 * global.delta_game_factor);
timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);

if (controller.timer[0] <= (60 * time_bpm_to_seconds(140) * 8) && !controller.win && !lost)
{
    with (controller)
        event_add_time(1);
}

if (miss_delay)
    miss_delay -= global.delta_game_factor;
