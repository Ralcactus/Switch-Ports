scr_getinput();

if (!global.gamePauseState && !instance_exists(obj_fadeoutTransition))
{
    if (!global.shellactivate && key_start2 && room != rank_room && room != rm_introVideo && room != realtitlescreen && canmove && obj_gamepadder.gamepad_discovered == 0)
    {
        event_user(4);
        exit;
    }
    
    if (keyboard_check_pressed(vk_f12))
    {
        screenshot_surface = surface_create(960, 540);
        surface_set_target(screenshot_surface);
        draw_clear_alpha(c_black, 0);
        gpu_set_blendenable(false);
        draw_surface(application_surface, 0, 0);
        gpu_set_colorwriteenable(0, 0, 0, 1);
        draw_set_color(c_white);
        draw_rectangle(-192, -192, 1152, 732, 0);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(1, 1, 1, 1);
        surface_reset_target();
        var file = get_save_filename_ext("screenshot|*.png", "", working_directory, "Save your Screenshot");
        
        if (file != "")
            surface_save(screenshot_surface, file);
    }
}

if (global.gamePauseState)
{
    if (canmove)
    {
        scr_getinput();
        
        if (key_down2 && selected < 3)
        {
            selected += 1;
            event_play_oneshot("event:/SFX/ui/step");
        }
        
        if (key_up2 && selected > 0)
        {
            selected -= 1;
            event_play_oneshot("event:/SFX/ui/step");
        }
        
        if (key_jump)
            event_user(selected);
        
        if (key_slap2 || key_start2)
            event_user(0);
    }
}

bgTileX++;
bgTileY++;
