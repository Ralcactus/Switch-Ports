testvariablenothing = false;
x += (hspd + (global.microgame_hspd * global.delta_game_factor));
angle += rot_spd;

if (bbox_right < -200)
    instance_destroy();

anim_logic();
