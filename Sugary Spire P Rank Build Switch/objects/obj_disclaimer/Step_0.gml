if (gamepad_button_check_pressed(global.player_input_device, gp_start)){
	if (room == rm_verify)
	    room_goto(devroom);
	else
	    room_goto(realtitlescreen);
}
