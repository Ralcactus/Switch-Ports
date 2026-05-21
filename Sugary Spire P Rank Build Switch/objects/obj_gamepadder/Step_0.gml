gamepad_set_vibration(global.player_input_device, vibration1, vibration1);
vibration1 -= vibrationDecay1;

for (var i = 0; i < 8; i += 1){
	if (gamepad_is_connected(i)){
		global.player_input_device = i;
	}
}