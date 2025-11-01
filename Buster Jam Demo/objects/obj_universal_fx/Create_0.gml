anim_init();
die_after_anim = true;
die_outside_room = true;
rot_spd = 0;
hspd = 0;
vspd = 0;
grav = 0;

event_animend = function()
{
    if (die_after_anim)
        instance_destroy();
};

bm = 0;
fadeout = false;
fade_spd = 0.05;
