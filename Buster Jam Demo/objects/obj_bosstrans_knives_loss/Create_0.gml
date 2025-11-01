testvariablenothing = false;
event_inherited();
draw_me = true;
lose_bg_ind = 0;
bg_overlay_in = false;
bg_overlay_y = -905;
timer[0] = time_bpm_to_seconds(140) * 1.5 * 60;

timer_func[0] = function()
{
    bg_overlay_in = true;
};

score_x = 96;
score_y = 896;
hp_x = 1216;
hp_y = 992;
anim_init();
anim_play(spr_bosstrans_knives_lose);
