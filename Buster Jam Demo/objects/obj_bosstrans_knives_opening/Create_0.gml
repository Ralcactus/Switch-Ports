testvariablenothing = false;
event_inherited();
draw_me = true;
x = 160;
y = 0;
bg_xoff = -100;
bg_ind = 0;
score_x = 96;
score_y = 160;
hp_x = 1216;
hp_y = 992;
hspd = -0.9;
anim_init();
anim_play(spr_bosstrans_knives_opening_knives);
timer[0] = time_bpm_to_seconds(140) * 8 * 60;

timer_func[0] = function()
{
    bg_xoff = -50;
    anim_play(spr_bosstrans_knives_opening_buster);
    x = -132;
    hspd *= -1;
    bg_ind = 1;
};

timer[1] = time_bpm_to_seconds(140) * 21 * 60;

timer_func[1] = function()
{
    hspd = 0;
};
