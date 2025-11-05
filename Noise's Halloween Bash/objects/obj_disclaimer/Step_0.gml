if (!discsquash)
{
    discanim += 0.05;
    discspin += 40;
    discspin %= 360;
    
    if (discanim >= 1)
    {
        discanim = 1.2;
        discspin = 0;
        discsquash = true;
        event_play_oneshot("event:/sfx/misc/disclamersplat");
    }
}
else
    discanim = approach(discanim, 1, 0.05);

if (input_keyboard_check_pressed(vk_f1) || (input_gamepad_check_pressed(input_player_get_gamepad(), gp_stickl) && input_gamepad_check_pressed(input_player_get_gamepad(), gp_stickr)))
{
    input_profile_reset_bindings("keyboard_and_mouse");
    input_profile_reset_bindings("gamepad");
    config_set_option("Input", "bindings", input_system_export(false));
    config_dump();
    scr_tiptext(string_get("tips/menu/options/allbindsreset"), -13500, false);
}

if (input_check_pressed("jump") && get_savestate() == save_state.idle)
{
    instance_destroy();
    instance_create_depth(x, y, depth, obj_logos);
}
