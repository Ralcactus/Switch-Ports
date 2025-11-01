event_inherited();
anim_init();
anim_speed = 0;
death = false;

event_animend = function()
{
    if (anim_sprite == spr_micro_pistol_demon_death)
        instance_destroy();
};

alarm[0] = 1;
cannon_xoff = 1;
cannon_set_timer = false;
timer[0] = -1;

timer_func[0] = function()
{
    cannon_in = true;
    my_charge_snd = audio_play_sound_on(controller.audio, snd_micro_pistol_laser_buildup, 0, 0);
};

my_charge_snd = -4;
failed = false;
cannon_in = false;
cannon_shot_timer_set = false;
timer[1] = -1;

timer_func[1] = function()
{
    controller.screenshake[0] = 28;
    controller.screenshake[1] = 28;
    laser_go = true;
    audio_play_sound_on(controller.audio, snd_micro_pistol_laser, 0, 0);
    
    if (audio_is_playing(my_charge_snd))
        audio_stop_sound(my_charge_snd);
};

laser_go = false;
laser_ind = 0;
