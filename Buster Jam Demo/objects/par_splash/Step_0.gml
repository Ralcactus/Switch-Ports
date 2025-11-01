if (timer[0] > 1 && input_check_pressed("menu_confirm") && !deac)
{
    timer[0] = 1;
    deac = true;
}

timer_logic(0);
timer_logic(1);
