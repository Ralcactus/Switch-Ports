anim_init();

event_animend = function()
{
    if (anim_sprite == spr_Bu_baby_buster_joy_transition)
        anim_play(spr_Bu_baby_buster_joy);
    else if (anim_sprite == spr_Bu_baby_buster_rage)
        anim_index = 1;
};

xscale = 1;
yscale = 1;
yay_snd = -4;
clap_snd = -4;
