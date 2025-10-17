scr_getinput_menu()

if os_type = os_windows{
	updateVolume()
}

if (video_get_status() == video_status_playing)
{
	if (!showText && key_jump)
	{
		showText = true
		alarm[0] = 120
	}
	else if (showText && key_jump)
	{
		event_user(0)
		video_close()
		alarm[0] = -1
	}
}
