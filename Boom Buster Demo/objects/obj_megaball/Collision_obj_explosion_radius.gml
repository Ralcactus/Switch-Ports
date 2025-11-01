if (exit_freeze())
    exit;

screen_shake(20, 20, 0.5);
global.freeze = 2;
global.boss_hp--;
play_impact();

if (other.x > x)
    hspd = -10;
else
    hspd = 10;

grav = 0.7;
state = state_hurt;
anim_play(spr_ball_hurt);
timer[0] = 100;
vspd = -12;
