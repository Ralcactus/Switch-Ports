var ev = ds_map_find_value(async_load, "event_type")
var gp = ds_map_find_value(async_load, "pad_index")
trace(string("{0} for gamepad {1}", ev, gp))

switch (ev)
{
	case "gamepad discovered":
		if (gamepad_get_device_count() < 1)
			break
		
		show_debug_message(string("Found gamepad {0}: {1}", gp, gamepad_get_description(gp)))
		device_found = true
		showtext = true
		textflash = 5
		break
	
	case "gamepad lost":
		device_found = false
		showtext = true
		textflash = 5
		break
}
