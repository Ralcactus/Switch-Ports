if (input_profile_get() != "pauseprofile")
{
    if (input_profile_get() != previnput)
    {
        detected = true;
        alarm[0] = 200;
    }
    
    previnput = input_profile_get();
}

detectedx = approach(detectedx, -196 * !detected, 5);

if (input_player_using_gamepad())
    wasusinggamepad = true;

if (input_player_using_keyboard() || input_player_using_mouse() || input_player_using_touch())
    wasusinggamepad = false;

if (!global.gamePaused && can_pause())
{
    if (global.noControlType)
    {
        if (input_player_using_gamepad() || !wasusinggamepad)
        {
            global.noControlType = false;
            
            if (global.music != noone)
            {
                if (global.music.event != noone)
                    fmod_studio_event_instance_set_paused(global.music.event, savedmusicpause);
            }
        }
        
        nocontrollerind = (nocontrollerind + 0.05) % sprite_get_number(spr_controllerdisconnected);
        exit;
    }
    else if (!input_gamepad_is_any_connected() && wasusinggamepad)
    {
        global.noControlType = true;
        nocontrollerind = 0;
        
        if (global.music != noone)
        {
            if (global.music.event != noone)
            {
                savedmusicpause = fmod_studio_event_instance_get_paused(global.music.event);
                fmod_studio_event_instance_set_paused(global.music.event, true);
            }
        }
        
        event_play_oneshot("event:/sfx/misc/nocontroller");
    }
}

if (input_check_pressed("pause") && can_pause() && !global.mapOpen)
{
    global.gamePaused = !global.gamePaused;
    
    if (global.gamePaused)
    {
        selected = 0;
        manual = false;
        input_verb_consume(["jump", "attack", "down"]);
        
        with (obj_music)
        {
            fmod_studio_event_instance_start(global.pausemusic);
            
            if (global.music != noone)
            {
                if (global.music.event != noone)
                {
                    other.savedmusicpause = fmod_studio_event_instance_get_paused(global.music.event);
                    fmod_studio_event_instance_set_paused(global.music.event, true);
                }
            }
        }
        
        with (obj_levelmap)
        {
            openanim = 0;
            closeanim = 0;
        }
    }
    else
    {
        with (obj_music)
        {
            event_stop(global.pausemusic, true);
            
            if (global.music != noone)
            {
                if (global.music.event != noone)
                    fmod_studio_event_instance_set_paused(global.music.event, other.savedmusicpause);
            }
        }
    }
    
    event_pause_all(global.gamePaused);
}

pause_portraitX = lerp(pause_portraitX, -get_game_width() * !global.gamePaused, 0.2);
pause_portraitY = get_game_height();
pause_pizzascoreX = lerp(pause_pizzascoreX, get_game_width() * (1 + !global.gamePaused), 0.2);
pause_pizzascoreY = lerp(pause_pizzascoreY, get_game_height() * (0.5 + !global.gamePaused), 0.2);
pausealpha = approach(pausealpha, 0.5 * global.gamePaused, 0.1);

if (global.gamePaused && !instance_exists(obj_optionsmenu) && !instance_exists(obj_manual) && !in_debug_menu())
{
    var _prevmanual = manual;
    var _prevselect = selected;
    var _mdir = input_check_opposing_pressed("left", "right");
    
    if (_mdir != 0)
        manual = _mdir == -1;
    
    if (!manual)
    {
        selected = clamp(selected + input_check_opposing_pressed("up", "down"), 0, array_length(options) - 1);
        
        if (input_check_pressed("jump"))
            options[selected][1]();
    }
    else if (input_check_pressed("jump"))
        manual_func();
    
    if (_prevmanual != manual || _prevselect != selected)
        event_play_oneshot("event:/sfx/pausemenu/move");
}
