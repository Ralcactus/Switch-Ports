testvariablenothing = false;
anim_logic();

if (instance_exists(obj_frenzy_speedup))
    exit;

if (!hit && anim_sprite == spr_bosstrans_knives_2_kick && anim_index >= 12)
    event_hit();

timer_logic(0);
bg_effect_alpha = approach(bg_effect_alpha, 0, 1/30);
shake = approach(shake, 0, 0.041666666666666664);
zoom = easy_smooth(zoom, 1, 3);
