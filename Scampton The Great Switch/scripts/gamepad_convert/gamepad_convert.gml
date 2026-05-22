function get_gamepad(){
	for (var i = 0; i < 8; i += 1){
		if (gamepad_is_connected(i)){
			global.padconnected = i;	
		}
	}
}

#macro oldkeyboard_check keyboard_check
#macro oldkeyboard_check_pressed keyboard_check_pressed
#macro oldkeyboard_check_released keyboard_check_released
#macro keyboard_check keyboard_checkGAMEPAD
#macro keyboard_check_pressed keyboard_check_pressedGAMEPAD
#macro keyboard_check_released keyboard_check_releasedGAMEPAD

function keyboard_checkGAMEPAD(key){
	return oldkeyboard_check(key) || gamepad_button_check(global.padconnected, input_convert(key)) || input_axis_check(key);

}

function keyboard_check_pressedGAMEPAD(key){
	return oldkeyboard_check_pressed(key) || gamepad_button_check_pressed(global.padconnected, input_convert(key)) || input_axis_check_pressed(key);
}

function keyboard_check_releasedGAMEPAD(key){
	return oldkeyboard_check_released(key) || gamepad_button_check_released(global.padconnected, input_convert(key)) || input_axis_check_released(key);
}

function input_convert(key){
	switch (key){
		case vk_down:
			return gp_padd;
		break;
		
		case vk_up:
			return gp_padu;
		break;
		
		case vk_right:
			return gp_padr;
		break;
		
		case vk_left:
			return gp_padl;
		break;
		
		case ord("Z"):
			return gp_face2;
		break;
		
		case ord("X"):
			return gp_face1;
		break;
		
		case ord("C"):
			return gp_face4;
		break;
		
		default:
			return noone
		break;
	}
}


function input_axis_value(key) {
    switch (key) {
        case vk_left:
			return -gamepad_axis_value(global.padconnected, gp_axislh);
		break;
		
        case vk_right:
			return  gamepad_axis_value(global.padconnected, gp_axislh);
		break;
		
        case vk_up:
			return -gamepad_axis_value(global.padconnected, gp_axislv);
		break;
		
        case vk_down:
			return  gamepad_axis_value(global.padconnected, gp_axislv);
		break;
		
        default:
			return 0;
		break;
    }
}

function input_axis_check(key){
	return input_axis_value(key) >= 0.5;
}

function input_axis_check_pressed(key){ 
	return input_axis_check(key);
}

function input_axis_check_released(key){
	return !input_axis_check(key);
}