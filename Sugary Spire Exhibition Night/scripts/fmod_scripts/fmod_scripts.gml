/*
function event_play_oneshot(sound, _x = x, _y = y, loop = false){
    if is_undefined(_x) 
		_x = x;
		
    if is_undefined(_y)
		_y = y;
	
	if !is_undefined(sound){
		if is_string(sound)
			audio_play_sound_at(asset_get_index(sound), _x, _y, 0, 300, 1000, 1, loop, 1)
		else
			audio_play_sound_at(sound, _x, _y, 0, 300, 1000, 1, loop, 1)
	}
}

function fmod_studio_event_instance_start(sound,loop = false){
	if is_undefined(loop)
		loop = false;
		
	if !is_undefined(sound){
		if is_string(sound){
			if !audio_is_playing(asset_get_index(sound)) or !loop
				audio_play_sound(asset_get_index(sound), 1, loop)
		}else{
			if !audio_is_playing(sound) or !loop
				audio_play_sound(sound, 1, loop)
		}
	}
}

function fmod_studio_event_instance_set_parameter_by_name(music, state, noidea, noidea2){

}

function fmod_studio_event_instance_set_paused(music, value){
	/*
	if !is_undefined(music){
		if is_string(music){
			if audio_is_playing(asset_get_index(music))
				audio_pause_sound(asset_get_index(music))
				
		}else{
			if audio_is_playing(music)
				audio_pause_sound(music)
		}
	}

}

function fmod_createEventInstance(sound){
	return sound
}

function fmod_studio_system_set_parameter_by_name(sound, reverb = false, noidea = false, noidea2 = false){
	
}

function event_instance_isplaying(sound){
	if !is_undefined(sound)
		return audio_is_playing(asset_get_index(sound))
	else
		return false
}

function fmod_studio_event_instance_stop(sound, nofade){
	if is_undefined(nofade)
		nofade = true
		
	if !is_undefined(sound){
		if is_string(sound){
			if nofade
				audio_stop_sound(asset_get_index(sound))
			else{
				audio_sound_gain(asset_get_index(sound), 0, 500);
			}
		}
		else{
			if nofade
				audio_stop_sound(sound)
			else
				audio_sound_gain(sound, 0, 500);
		}
	}
}

function fmod_studio_system_get_parameter_by_name(reverb){
	
}

function FMOD_STUDIO_EVENT_CALLBACK(){
	
}

function TIMELINE_BEAT(){
	
}

function event_play_multiple(sound, _x = x, _y = y, loop = false){	
	if !is_undefined(sound){
		if is_string(sound)
			audio_play_sound_at(asset_get_index(sound), _x, _y, 0, 100, 300, 1, loop, 1)
		else
			audio_play_sound_at(sound, _x, _y, 0, 100, 300, 1, loop, 1)
	}
}

function NESTED_TIMELINE_BEAT(){
	
}

function FMOD_STUDIO_STOP_MODE(){
	
}

function fmod_studio_event_instance_release(sound){
	
}

function fmod_studio_event_instance_set_callback(sound, noidea){ //no idea might be a beat??
	
}

function fmod_event_set3DPosition(sound, _x, _y, noidea = false){
	
}

function fmod_studio_event_instance_get_paused(sound){
	if !is_undefined(sound)
		audio_pause_sound(asset_get_index(sound))
}

function fmod_event_setPause_all(value){
	if value = true
		audio_pause_all()
	else
		audio_resume_all()
}

function fmod_event_stop_all(value){
	audio_stop_all()
}

function kill_sounds(sound){
	
}

function fmod_quick3D(sound, _x = x, _y = y){
	
}