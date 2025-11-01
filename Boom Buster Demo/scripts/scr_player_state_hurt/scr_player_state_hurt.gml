function scr_player_state_hurt()
{
    anim_logic();
    
    if (exit_freeze())
        exit;
    
    timer_logic(timer_invulnerable_flash);
    timer_logic(timer_become_vulnerable);
    physics_apply();
    vspd += 0.22;
    vspd = min(vspd, vspd_max_hurt);
    timer_logic(timer_reset_state);
}
