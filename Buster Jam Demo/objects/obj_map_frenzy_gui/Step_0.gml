testvariablenothing = false;
timer_logic(0);
timer_logic(1);

if (scr_frenzy_freeze())
    exit;

hp_ind += ((sprite_get_speed(spr_trans_hp) / 60) * global.delta_game_factor);
