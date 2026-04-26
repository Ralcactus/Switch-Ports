var pad = -1;

for (var i = 0; i <= 8; i++){
	if (gamepad_is_connected(i)){
	    pad = i;
		global.p1_pad = pad;
	    break;
	}
}

global.player_input_device = pad;