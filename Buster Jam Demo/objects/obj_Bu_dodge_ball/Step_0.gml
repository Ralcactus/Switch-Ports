timer_logic(0);
timer_logic(1);

if (!go)
    exit;

mult = approach(mult, 1.5, 0.15);
image_xscale = scale;
image_yscale = scale;
image_angle += (rotate_spd * mult * global.delta_game_factor);
scale -= (scale_spd * mult * global.delta_game_factor);
scale_spd -= (0.001 * global.delta_game_factor);

if (scale_spd < 0.01)
    scale_spd = 0.01;

x = approach(x, controller.game_width / 2, scale_spd * 90 * mult);

if (scale <= 1)
    layer = layer_get_id("Behind");

if (scale <= 1.15 && scale >= 0.35 && controller.win && dir == obj_Bu_dodge.dir)
{
    controller.win = false;
    audio_play_sound_on(controller.audio, snd_explosion, 0, 0);
    
    with (obj_Bu_dodge)
        event_user(0);
}

if (scale < 0)
    scale = 0;

darkness = approach(darkness, 0, 0.015 * mult);
