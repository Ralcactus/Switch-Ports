percent += percent_spd;
percent_spd -= 0.002;

if (percent > 1)
    percent = 1;

x = use_curve(acurv_linear, percent, undefined, xstart, xstart - 140);
y = use_curve(acurv_linear, percent, undefined, ystart, ystart - 200);
scale = use_curve(acurv_linear, percent, undefined, 1, 0.3);

if (percent == 1)
{
    with (controller)
    {
        zoom = 0.95;
        screenshake[0] = 9;
        screenshake[1] = 9;
    }
    
    audio_play_sound_on(controller.audio, snd_micro_demoswing_explode, false, 0);
    audio_play_sound_on(controller.audio, snd_micro_demoswing_wallsmack, false, 0);
    var _fx = instance_create_micro(x, y, layer, obj_micro_demoswing_fx);
    
    with (_fx)
        anim_play(spr_micro_demoswing_explosion);
    
    if (instance_find_micro(obj_micro_demoswing_man).hits == instance_find_micro(obj_micro_demoswing_man).hits_needed)
    {
        with (instance_find_micro(obj_micro_demoswing_bg))
            event_user(0);
    }
    
    instance_destroy();
}

image_xscale = scale;
image_yscale = scale;
