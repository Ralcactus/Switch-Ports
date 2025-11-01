if (dead)
    exit;

physics_apply_2d_micro();
xAxis = input_check("right") - input_check("left");
hspd = approach(hspd, xAxis * movespd, acc);
angle = easy_smooth(angle, xAxis * 6.5, 5);
xscale = use_curve(acurv_elastic, scale_percent, undefined, 1.45, 1);
yscale = use_curve(acurv_elastic, scale_percent, undefined, 0.55, 1);
scale_percent = approach(scale_percent, 1, 0.01);

if (vspd > 0)
{
    xscale_fall -= (vspd * 0.001);
    yscale_fall += (vspd * 0.001);
    
    if (xscale_fall < 0.6)
        xscale_fall = 0.6;
    
    if (yscale_fall > 1.4)
        yscale_fall = 1.4;
}

var _w = controller.game_width;

if (x > _w)
    x -= _w;

if (x < 0)
    x += _w;

if ((ystart - y) > game_score)
    game_score = ystart - y;

if (place_meeting_micro(x, y, obj_micro_gartjump_razor) && !dead)
{
    dead = true;
    controller.win = false;
    controller.timer_alpha_override = 0;
    
    with (controller)
        event_set_time(2);
    
    audio_play_sound_on(controller.audio, snd_female_scream, 0, 0);
}
