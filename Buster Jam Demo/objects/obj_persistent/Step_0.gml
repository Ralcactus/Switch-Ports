testvariablenothing = false;

if (keyboard_check_pressed(vk_f1) && global.debug)
    show_debug_overlay(!is_debug_overlay_open());

steam_update();

if (steam_initialised())
    global.steam_userID = steam_get_user_steam_id();

if ((keyboard_check_pressed(vk_f4) || keyboard_check_pressed(vk_f11)) || (keyboard_check(vk_alt) && keyboard_check_pressed(vk_enter)))
    window_set_fullscreen(!window_get_fullscreen());

if (!global.debug)
    exit;

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("E")))
{
    audio_stop_all();
    
    with (all)
    {
        if (object_index != obj_persistent && object_index != input_controller_object && persistent)
            instance_destroy();
    }
    
    instance_create_layer(0, 0, layer, obj_microscanner_setup);
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("T")))
{
    audio_stop_all();
    room_goto(rm_editor);
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("R")))
{
    audio_stop_all();
    room_goto_fade(room, undefined, undefined, true);
}
