if (video_get_status() != 0)
	video_close()

scr_initinput()
canSkip = false
alarm[1] = 350
showText = false
displayVideo = false

if (!file_exists("gamedata/intro.mp4"))
{
	trace("Intro video not found.")
	event_user(0)
	exit;
}

updateVolume = function()
{
	//var attenuation_factor = fmod_studio_system_get_parameter_by_name("musicAttenuation").value
	var real_volume = global.musicVolume * global.masterVolume // * (1 - attenuation_factor)
	video_set_volume(real_volume)
}

if os_type = os_windows{
	video_open("gamedata/intro.mp4")
	updateVolume()
}

if os_type = os_switch{
	if (shaders_are_supported() && shader_is_compiled(shdVideo))
	{
		doit = true;
		vol = global.musicVolume * global.masterVolume // * (1 - attenuation_factor)
		video_width = camera_get_view_width(view_camera[0]);
		video_height = camera_get_view_height(view_camera[0]);
		video_sampler = shader_get_sampler_index(shdVideo, "v_chroma");


		video_open("gamedata/intro.mp4");
		video_set_volume(vol);
		displayVideo = true;
		show_debug_message("video init is cool and ok");
	}
	else{ 
		// oh no.
		show_debug_message("video no work :(");
		doit = false; 
		instance_destroy(); 
	} 
}
