testvariablenothing = false;
vspd = -21.6;
grav = 0.9;
anim_init();

event_animend = function()
{
    if (anim_sprite == spr_fx_sparkle)
        instance_destroy();
};

global.coins += 10;
anim_speed = 1;
anim_index = 1;
