testvariablenothing = false;
anim_init();
anim_play(global.hp_spr);
vspd = -8;
grav = 0.5;
angle = 0;
mult = 1.16;
image_alpha = 3;
var _spd = 4;

if (x > 960)
    hspd = _spd;
else
    hspd = -_spd;
