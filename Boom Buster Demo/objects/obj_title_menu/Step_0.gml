if (deac || instance_exists(obj_trans_explosion) || instance_exists(obj_options) || instance_exists(obj_credits))
    exit;

obj_title.bg_yoff = (selected_option / (array_length(menu.options) - 1)) * (sprite_get_height(bgr_title) - 1080);
obj_title.bg_yoff *= -1;
menu_move(menu);

if (input.pressed[5])
{
    input_clear(input, 5);
    audio_play_sound(snd_spin, 0, 0);
    instance_destroy();
    instance_destroy(obj_controls_popup);
    
    with (obj_controls)
        instance_destroy();
    
    with (obj_title)
    {
        any_percent = 0;
        any_scale = 1;
        state = 0;
        started = false;
        bg_yoff = 0;
    }
    
    obj_splash.visible = true;
}
