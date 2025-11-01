testvariablenothing = false;
timer_logic(0);

if (!ready || instance_exists(obj_leaderboard))
    exit;

pause = approach(pause, 0, 1);

if (keyboard_check_pressed(vk_shift) && global.debug)
{
    wizard_yoff = 30;
    splash_text_num++;
    
    if (splash_text_num > (array_length(splash_text_choices) - 1))
        splash_text_num = 0;
    
    splash_text = splash_text_choices[splash_text_num][0];
    
    if (audio_is_playing(wizard_line))
        audio_stop_sound(wizard_line);
    
    wizard_line = audio_play_sound(splash_text_choices[splash_text_num][1], 0, 0);
    draw_set_font(global.font_dialogue_outline);
    scr_dialogue_reset(splash_text, true);
    type_index = string_length(splash_text);
    blip = -4;
}

if (splash_draw)
    wizard_yoff = easy_smooth(wizard_yoff, 0, 5);
