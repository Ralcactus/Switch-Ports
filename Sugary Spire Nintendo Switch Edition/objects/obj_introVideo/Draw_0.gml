if os_type = os_switch{
	if (!doit) 
		exit;

	var arr_rv = video_draw();
	if (arr_rv[0] < 0)
	{
		video_close();
		if (displayVideo){
			displayVideo = false;
			event_user(0);
		}
		show_debug_message("video playback finished");
		instance_destroy();
	}
	else
	{
		var _surface = arr_rv[1];
		var _chroma_surface = arr_rv[2];
		if (surface_exists(_surface) && surface_exists(_chroma_surface))
		{
			shader_set(shdVideo);
			var _tex_id = surface_get_texture(_surface);
			var _chroma_tex_id = surface_get_texture(_chroma_surface);
			texture_set_stage(video_sampler, _chroma_tex_id);
			gpu_set_texfilter(false); //disable interpolation ???
			draw_primitive_begin_texture(pr_trianglestrip, _tex_id);
			draw_vertex_texture(0, 0, 0, 0);
			draw_vertex_texture(video_width, 0, 1, 0);
			draw_vertex_texture(0, video_height, 0, 1);
			draw_vertex_texture(video_width, video_height, 1, 1);
			draw_primitive_end();
			shader_reset();
		}
	}	
}


if os_type = os_windows{
	var _data = video_draw()
	var _status = _data[0]

	if (_status == 0)
	{
		var _surface = _data[1]
		draw_surface_stretched(_surface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))
	}
}