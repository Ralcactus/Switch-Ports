anim_logic();
timer_logic(0);
y += (global.delta_game_factor * vspd);

if (input_check_pressed("jump", player))
    go = true;

if (go && !done)
{
    if (place_meeting_micro(x, y, obj_Bu_firework_circle))
    {
        scr_micro_win();
        image_alpha = 0;
        audio_play_sound_on(controller.audio, snd_Bu_firework, 0, 0);
        
        if (audio_is_playing(snd_Bu_firecracker))
            audio_stop_sound(snd_Bu_firecracker);
        
        event_user(10);
        timer[0] = 5;
    }
    else
    {
        image_alpha = 0;
        audio_play_sound_on(controller.audio, snd_cough, false, 0);
        instance_create_micro(x, y, layer, obj_Bu_firework_smoke);
    }
    
    vspd = 0;
    done = true;
    
    with (instance_find_micro(obj_Bu_firework_circle))
        draw_me = false;
}

if (controller.win)
{
    firework_offset = easy_smooth(firework_offset, 0, 15);
    
    if (state == 0)
    {
        firework_flash = approach(firework_flash, 0.5, 0.03);
        firework_scale = approach(firework_scale, 9, 0.8);
    }
    
    if (firework_flash == 0.5 && firework_scale == 9)
        state = 1;
    
    if (state == 1)
    {
        firework_y += firework_vspd;
        firework_vspd += 0.001;
        firework_scale -= 0.0125;
        firework_flash -= 0.003;
        firework_alpha -= 0.005;
    }
}

if (y < (controller.game_height + 100) && !played_sound)
{
    played_sound = true;
    audio_play_sound_on(controller.audio, snd_Bu_firecracker, 0, 0);
}
