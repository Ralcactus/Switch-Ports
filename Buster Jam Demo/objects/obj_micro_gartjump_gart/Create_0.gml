event_inherited();
game_score = 0;

if (!instance_exists(obj_microscanner_setup))
    alarm[0] = 1;

physics_init_2d_micro();
jump_strength = 14.5;
grav = 0.39;
movespd = 5;
acc = 0.5;

event_floor = function()
{
    if (vspd > 0)
    {
        var _snd = audio_play_sound_on(controller.audio, snd_micro_gartjump_jump, false, 0);
        audio_sound_pitch(_snd, choose(0.9, 1, 1.1));
        vspd = -jump_strength;
        scale_percent = 0;
        xscale_fall = 1;
        yscale_fall = 1;
    }
};

xscale = 1;
yscale = 1;
xscale_fall = 1;
yscale_fall = 1;
angle = 0;
scale_percent = 1;
dead = false;
