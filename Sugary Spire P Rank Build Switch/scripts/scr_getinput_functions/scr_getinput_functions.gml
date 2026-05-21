function scr_getinput()
{
	#region Setup Variables
    key_up = false;
    key_up2 = false;
    key_right = false;
    key_right2 = false;
    key_left = false;
    key_left2 = false;
    key_down = false;
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
	#endregion
    //Stop If Console open
    if (global.shellactivate)
        exit;
    //Reset Binds
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

function scr_keyname(key) 
{
	//To Do: Clean up
	if key == vk_left
		return "LEFT";
	if key == vk_right
		return "RIGHT";
	if key == vk_up
		return "UP";
	if key == vk_down
		return "DOWN";
	if key == vk_enter
	    return "ENTER";
	if key == vk_escape
	    return "ESCAPE";
	if key == vk_space
	    return "SPACE";
	if key == vk_shift
	    return "SHIFT";
	if key == vk_control
	    return "CONTROL";
	if key == vk_alt
	    return "ALT";
	if key == vk_backspace
	    return "BACKSPACE";
	if key == vk_tab
	    return "TAB";
	if key == vk_home
	    return "HOME";
	if key == vk_end
	    return "END";
	if key == vk_delete
	    return "DELETE";
	if key == vk_insert
	    return "INSERT";
	if key == vk_pageup
	    return "PAGE UP";
	if key == vk_pagedown
	    return "PAGE DOWN";
	if key == vk_pause
	    return "PAUSE";
	if key == vk_printscreen
	    return "PRINTSCREEN";
	if key == vk_f1
	    return "F1";
	if key == vk_f2
	    return "F2";
	if key == vk_f3
	    return "F3";
	if key == vk_f4
	    return "F4";
	if key == vk_f5
	    return "F5";
	if key == vk_f6
	    return "F6";
	if key == vk_f7
	    return "F7";
	if key == vk_f8
	    return "F8";
	if key == vk_f9
	    return "F9";
	if key == vk_f10
	    return "F10";
	if key == vk_f11
	    return "F11";
	if key == vk_f12
	    return "F12";
	if key == vk_numpad0
	    return "NUMPAD 0";
	if key == vk_numpad1
	    return "NUMPAD 1";
	if key == vk_numpad2
	    return "NUMPAD 2";
	if key == vk_numpad3
		return "NUMPAD 3";
	if key == vk_numpad4
	    return "NUMPAD 4";
	if key == vk_numpad5
		return "NUMPAD 5";
	if key == vk_numpad6
		return "NUMPAD 6";
	if key == vk_numpad7
		return "NUMPAD 7";
	if key == vk_numpad8
	    return "NUMPAD 8";
	if key == vk_numpad9
	    return "NUMPAD 9";
	if key == vk_multiply
	    return "MULTIPLY";
	if key == vk_divide
	    return "DIVIDE";
	if key == vk_add
	    return "ADD";
	if key == vk_subtract
		return "SUBTRACT";
	if key == vk_decimal
	    return "DECIMAL";
	if key == -1
	    return "PRESS KEY";

	return chr(key);
}
