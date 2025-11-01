if (controller.win)
{
    image_xscale = easy_smooth(image_xscale, 0.7, 2);
    image_yscale = easy_smooth(image_yscale, 0.7, 2);
}

if (controller.ended && !controller.win)
{
    audio_play_sound_on(controller.audio, snd_shatter, 0, 0);
    instance_destroy();
}

if (controller.ended || controller.win)
    exit;

x += (hspd * global.delta_game_factor);

if (x > (controller.game_width - 300) && hspd > 0)
    hspd = -hspd;

if (x < 300 && hspd < 0)
    hspd = -hspd;

if (input_check_pressed("jump") && !pressed)
{
    if (place_meeting(x, y, obj_Br_kiss_buster))
    {
        scr_micro_win();
        
        with (obj_Br_kiss_buster)
            event_user(0);
        
        audio_play_sound_on(controller.audio, snd_kiss, 0, 0);
    }
    else
    {
        hspd = 0;
        audio_play_sound(snd_shatter, 0, 0);
    }
    
    pressed = true;
}
