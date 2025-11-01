function scr_player_step()
{
    scr_player_inputs();
    timer_logic(timer_become_vulnerable);
    timer_logic(timer_invulnerable_flash);
    timer_logic(0);
    
    if (action != action_spin && grounded)
        spun = false;
    
    if (action != action_spin)
        coyote_spin = approach(coyote_spin, 0, 1);
    
    boostspd = approach(boostspd, 0, 0.4);
}
