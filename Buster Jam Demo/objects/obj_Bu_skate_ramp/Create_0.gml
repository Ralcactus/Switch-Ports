SCREEN_L = 165;
SCREEN_U = 102;
percent = 0;
go = false;
scale = 3;
timer[0] = 25 + irandom_range(0, 20);

timer_func[0] = function()
{
    go = true;
};

percent_spd = 0.015;
on_ramp = false;
failed = false;
spd_mult = 1;
state = 0;

exit_ramp = function()
{
    audio_play_sound_on(controller.audio, snd_Bu_skate_liftoff, 0, 0);
    state = 1;
    back_xstart = x;
    back_ystart = y;
    scale_start = scale;
    percent = 0;
    percent_spd = 0.015;
    on_ramp = false;
    var _skater = instance_find_micro(obj_Bu_skate);
    _skater.on_ramp = false;
    
    if (!controller.win)
    {
        _skater.vspd = -7;
        _skater.grav -= 0.15;
        _skater.action_fadeout = true;
    }
};

alpha = 1;
