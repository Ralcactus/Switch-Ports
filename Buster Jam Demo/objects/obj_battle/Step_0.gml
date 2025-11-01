timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
timer_logic(4);

if (state == 1)
{
    if (input_check_pressed("jump"))
        timer_func[2]();
}

if (state == 1)
    attack_overlay_alpha = approach(attack_overlay_alpha, 1, 0.1);
