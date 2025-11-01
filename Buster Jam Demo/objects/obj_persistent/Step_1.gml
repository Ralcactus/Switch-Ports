global.delta_game_factor = (delta_time / 1000000) * 60;
global.delta_game_factor = 1;
global.delta_real_factor = global.delta_game_factor;
global.delta_game_factor += (global.speedup - 1);

if (room_get_name(room) == "rm_editor" && instance_exists(obj_textbox))
{
    var _pressZ = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);
    io_clear();
    
    if (_pressZ)
    {
        with (obj_textbox)
            instance_destroy();
    }
}

scr_double_click();
global.beat = false;
global.beat_double = false;

for (var i = 0; i < 2; i++)
    global.screen_shake[i] = approach(global.screen_shake[i], 0, global.screen_shake_dec);

input_binding_threshold_set(input_binding_get("right"), 0.4, 1);
input_binding_threshold_set(input_binding_get("left"), 0.4, 1);
input_binding_threshold_set(input_binding_get("up"), 0.4, 1);
input_binding_threshold_set(input_binding_get("down"), 0.4, 1);
input_binding_threshold_set(input_binding_get("right_strict"), 0.72, 1);
input_binding_threshold_set(input_binding_get("left_strict"), 0.72, 1);
input_binding_threshold_set(input_binding_get("up_strict"), 0.72, 1);
input_binding_threshold_set(input_binding_get("down_strict"), 0.72, 1);
input_binding_threshold_set(input_binding_get("right_menu"), 0.72, 1);
input_binding_threshold_set(input_binding_get("left_menu"), 0.72, 1);
input_binding_threshold_set(input_binding_get("up_menu"), 0.72, 1);
input_binding_threshold_set(input_binding_get("down_menu"), 0.72, 1);
