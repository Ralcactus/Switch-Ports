for (var i = 0; i < 8; i += 1)
{
	if (gamepad_is_connected(i))
		global.P1_input = i;
}
scr_gamepad();
