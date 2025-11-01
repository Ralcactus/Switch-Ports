if (buster_rise)
    buster_yoff = easy_smooth(buster_yoff, 0, 8);

buster_ind += ((sprite_get_speed(buster_spr) / 60) * global.delta_game_factor);

if (buster_ind >= sprite_get_number(buster_spr))
    event_animend_buster();

lance_ind += ((sprite_get_speed(lance_spr) / 60) * global.delta_game_factor);

if (lance_ind >= sprite_get_number(lance_spr))
    event_animend_lance();

if (instance_exists(obj_frenzy_speedup))
    exit;

if (!hit && buster_spr == spr_bosstrans_knives_0_buster_punch && buster_ind >= 4)
    event_hit();

timer_logic(0);
timer_logic(1);
bg_effect_alpha = approach(bg_effect_alpha, 0, 1/30);
shake = approach(shake, 0, 0.041666666666666664);
zoom = easy_smooth(zoom, 1, 3);
