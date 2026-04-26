function scr_input_varinit()
{
    key_up = false;
    key_up2 = false;
    key_right = false;
    key_right2 = false;
    key_left = false;
    key_left2 = false;
    key_down = false;
    key_down_release = false;
    key_down2 = false;
    key_jump = false;
    key_jump2 = false;
    key_jump_release = false;
    key_slap = false;
    key_slap2 = false;
    key_taunt = false;
    key_taunt2 = false;
    key_attack = false;
    key_attack2 = false;
    key_shoot = false;
    key_shoot2 = false;
    key_start = false;
    key_start2 = false;
    key_escape = false;
    stickpressed = false;
}

function scr_getinput()
{
    scr_input_varinit();
    
    if (global.shellactivate || instance_exists(obj_techdiff))
        exit;
    
    if (keyboard_check_pressed(vk_f1))
        scr_resetinput();
    
    var _dvc = global.player_input_device;
    gamepad_set_axis_deadzone(_dvc, 0.4);
    key_up = keyboard_check(global.key_up) || gamepad_button_check(_dvc, global.key_upC) || gamepad_axis_value(_dvc, gp_axislv) < 0;
    key_up2 = keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(_dvc, global.key_upC) || (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && stickpressed == 0);
    key_right = keyboard_check(global.key_right) || gamepad_button_check(_dvc, global.key_rightC) || gamepad_axis_value(_dvc, gp_axislh) > 0;
    key_right2 = keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(_dvc, global.key_rightC) || (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && stickpressed == 0);
    key_left = -(keyboard_check(global.key_left) || gamepad_button_check(_dvc, global.key_leftC) || gamepad_axis_value(_dvc, gp_axislh) < 0);
    key_left2 = -(keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(_dvc, global.key_leftC) || (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && stickpressed == 0));
    key_down = keyboard_check(global.key_down) || gamepad_button_check(_dvc, global.key_downC) || gamepad_axis_value(_dvc, gp_axislv) > 0;
    key_down_release = keyboard_check_released(global.key_down) || gamepad_button_check_released(_dvc, global.key_downC) || gamepad_axis_value(_dvc, gp_axislv) > 0;
    key_down2 = keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(_dvc, global.key_downC) || (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && stickpressed == 0);
    key_jump2 = keyboard_check(global.key_jump) || gamepad_button_check(_dvc, global.key_jumpC);
    key_jump = keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(_dvc, global.key_jumpC);
    key_jump_release = keyboard_check_released(global.key_jump) || gamepad_button_check_released(_dvc, global.key_jumpC);
    key_slap = keyboard_check(global.key_slap) || gamepad_button_check(_dvc, global.key_slapC);
    key_slap2 = keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(_dvc, global.key_slapC);
    key_taunt = keyboard_check(global.key_taunt) || gamepad_button_check(_dvc, global.key_tauntC);
    key_taunt2 = keyboard_check_pressed(global.key_taunt) || gamepad_button_check_pressed(_dvc, global.key_tauntC);
    key_attack = keyboard_check(global.key_attack) || gamepad_button_check(_dvc, global.key_attackC) || gamepad_button_check(_dvc, gp_shoulderrb);
    key_attack2 = keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(_dvc, global.key_attackC) || gamepad_button_check_pressed(_dvc, gp_shoulderrb);
    key_shoot = keyboard_check(global.key_shoot) || gamepad_button_check(_dvc, global.key_shootC);
    key_shoot2 = keyboard_check_pressed(global.key_shoot) || gamepad_button_check_pressed(_dvc, global.key_shootC) || gamepad_button_check_pressed(_dvc, gp_shoulderl);
    key_start = keyboard_check(global.key_start) || gamepad_button_check(_dvc, global.key_startC);
    key_start2 = keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(_dvc, global.key_startC);
    key_special = keyboard_check(global.key_special) || gamepad_button_check(_dvc, global.key_specialC);
    key_special2 = keyboard_check_pressed(global.key_special) || gamepad_button_check_pressed(_dvc, global.key_specialC);
    key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select);
    
    if (gamepad_axis_value(_dvc, gp_axislh) > 0.5 || gamepad_axis_value(_dvc, gp_axislh) < -0.5 || gamepad_axis_value(_dvc, gp_axislv) > 0.5 || gamepad_axis_value(_dvc, gp_axislv) < -0.5)
        stickpressed = true;
    else
        stickpressed = false;
    
    return true;
}

function scr_keyname(arg0)
{
    var key_name;
    
    if (ds_map_exists(global.SpecialKeyNameMap, arg0))
        key_name = ds_map_find_value(global.SpecialKeyNameMap, arg0);
    else
        key_name = chr(arg0);
    
    return key_name;
}

function scr_initKeyNameMap()
{
    global.SpecialKeyNameMap = ds_map_create();
    ds_map_set(global.SpecialKeyNameMap, 37, "LEFT");
    ds_map_set(global.SpecialKeyNameMap, 39, "RIGHT");
    ds_map_set(global.SpecialKeyNameMap, 38, "UP");
    ds_map_set(global.SpecialKeyNameMap, 40, "DOWN");
    ds_map_set(global.SpecialKeyNameMap, 13, "ENTER");
    ds_map_set(global.SpecialKeyNameMap, 27, "ESCAPE");
    ds_map_set(global.SpecialKeyNameMap, 32, "SPACE");
    ds_map_set(global.SpecialKeyNameMap, 16, "SHIFT");
    ds_map_set(global.SpecialKeyNameMap, 17, "CONTROL");
    ds_map_set(global.SpecialKeyNameMap, 18, "ALT");
    ds_map_set(global.SpecialKeyNameMap, 8, "BACKSPACE");
    ds_map_set(global.SpecialKeyNameMap, 9, "TAB");
    ds_map_set(global.SpecialKeyNameMap, 36, "HOME");
    ds_map_set(global.SpecialKeyNameMap, 35, "END");
    ds_map_set(global.SpecialKeyNameMap, 46, "DELETE");
    ds_map_set(global.SpecialKeyNameMap, 45, "INSERT");
    ds_map_set(global.SpecialKeyNameMap, 33, "PAGE UP");
    ds_map_set(global.SpecialKeyNameMap, 34, "PAGE DOWN");
    ds_map_set(global.SpecialKeyNameMap, 19, "PAUSE");
    ds_map_set(global.SpecialKeyNameMap, 44, "PRINTSCREEN");
    ds_map_set(global.SpecialKeyNameMap, 112, "F1");
    ds_map_set(global.SpecialKeyNameMap, 113, "F2");
    ds_map_set(global.SpecialKeyNameMap, 114, "F3");
    ds_map_set(global.SpecialKeyNameMap, 115, "F4");
    ds_map_set(global.SpecialKeyNameMap, 116, "F5");
    ds_map_set(global.SpecialKeyNameMap, 117, "F6");
    ds_map_set(global.SpecialKeyNameMap, 118, "F7");
    ds_map_set(global.SpecialKeyNameMap, 119, "F8");
    ds_map_set(global.SpecialKeyNameMap, 120, "F9");
    ds_map_set(global.SpecialKeyNameMap, 121, "F10");
    ds_map_set(global.SpecialKeyNameMap, 122, "F11");
    ds_map_set(global.SpecialKeyNameMap, 123, "F12");
    ds_map_set(global.SpecialKeyNameMap, 96, "NUMPAD 0");
    ds_map_set(global.SpecialKeyNameMap, 97, "NUMPAD 1");
    ds_map_set(global.SpecialKeyNameMap, 98, "NUMPAD 2");
    ds_map_set(global.SpecialKeyNameMap, 99, "NUMPAD 3");
    ds_map_set(global.SpecialKeyNameMap, 100, "NUMPAD 4");
    ds_map_set(global.SpecialKeyNameMap, 101, "NUMPAD 5");
    ds_map_set(global.SpecialKeyNameMap, 102, "NUMPAD 6");
    ds_map_set(global.SpecialKeyNameMap, 103, "NUMPAD 7");
    ds_map_set(global.SpecialKeyNameMap, 104, "NUMPAD 8");
    ds_map_set(global.SpecialKeyNameMap, 105, "NUMPAD 9");
    ds_map_set(global.SpecialKeyNameMap, 106, "MULTIPLY");
    ds_map_set(global.SpecialKeyNameMap, 111, "DIVIDE");
    ds_map_set(global.SpecialKeyNameMap, 107, "ADD");
    ds_map_set(global.SpecialKeyNameMap, 109, "SUBTRACT");
    ds_map_set(global.SpecialKeyNameMap, 110, "DECIMAL");
    ds_map_set(global.SpecialKeyNameMap, -1, "PRESS KEY");
}
