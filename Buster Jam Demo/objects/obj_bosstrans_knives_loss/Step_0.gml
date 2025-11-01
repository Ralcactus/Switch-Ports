testvariablenothing = false;
anim_logic();
timer_logic(0);
lose_bg_ind += ((sprite_get_speed(spr_bosstrans_knives_lose_bg) / 60) * global.delta_game_factor);

if (bg_overlay_in)
    bg_overlay_y = easy_smooth(bg_overlay_y, 0, 8);
