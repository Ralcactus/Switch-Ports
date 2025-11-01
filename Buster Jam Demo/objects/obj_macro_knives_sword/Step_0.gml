testvariablenothing = false;
timer_logic(1);
caution_ind += ((sprite_get_speed(spr_macro_knives_caution) / 60) * global.delta_game_factor);

if (!go)
    exit;

event_inherited();
timer_logic(0);
