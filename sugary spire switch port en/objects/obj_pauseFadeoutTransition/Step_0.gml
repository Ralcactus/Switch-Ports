if (global.gamePauseState == 1 && fadealpha <= 0)
{
	global.gamePauseState = 0
	instance_activate_all()
	instance_destroy()
}

if (fadealpha >= 1)
{
	if (global.gamePauseState == 0)
	{
		global.gamePauseState = 1
		audio_pause_all()
		instance_deactivate_all(true)
		instance_activate_object(obj_pause)
		instance_activate_object(obj_parallax)
		instance_activate_object(obj_screen)
		instance_destroy()
	}
}

if (fadein)
	fadealpha = approach(fadealpha, 1, 0.25)
else
	fadealpha = approach(fadealpha, 0, 0.25)
