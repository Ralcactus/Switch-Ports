anim_init();
anim_end_die = true;
die_outside_view = true;

event_animend = function()
{
    if (anim_end_die)
        instance_destroy();
};

grav = 0;
vspd = 0;
hspd = 0;
rot_spd = 0;
fadeout = false;
fade_spd = 0;
spd = 0;
spd_dir = 0;
spd_lag = 10;
spd_to = 0;
bm = 0;
