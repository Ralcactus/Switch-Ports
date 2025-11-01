testvariablenothing = false;
anim_init();

event_animend = function()
{
    instance_destroy();
};

act_wizard = -4;
my_actor = -4;
image_xscale = 1.25;
image_yscale = 1.1;
audio_play_sound(snd_wizard_poof, 0, 0);
debugging = false;
screen_shake(10, 10);
anim_speed = 0.9;
flash_scale = 1;
flash_alpha = 1;
