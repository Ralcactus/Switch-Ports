alarm[0] = 1;
timer[0] = -1;

timer_func[0] = function()
{
    with (obj_Bu_button_fail)
        event_user(0);
    
    audio_play_sound_on(controller.audio, snd_explosion, 0, 0);
    draw_me = false;
};

global.game_music = "bgm_micro_dontpress";
image_speed = 0;
draw_me = true;
