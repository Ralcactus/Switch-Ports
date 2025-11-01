testvariablenothing = false;
draw_set_color(c_black);
draw_set_alpha(overlay_alpha * 0.7);
draw_rectangle(0, 0, 1920, 1080, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_sprite_tiled_ext(spr_checkerboard_pattern_gameover, 0, time, time * 0.5, 2, 2, c_black, overlay_alpha * 0.55);

with (obj_frenzy_pattern)
    event_user(0);

event_user(1);

with (obj_frenzy_gameover_splash)
    event_user(0);

with (obj_leaderboard)
    event_user(10);

with (obj_network_getstats)
    event_user(0);
