function event_play_oneshot(arg0 = "", arg1 = undefined, arg2 = undefined, arg3 = 0)
{
	var _id = fmod_createEventInstance(arg0)
	fmod_studio_event_instance_start(_id)
	
	if (!is_undefined(arg1) && !is_undefined(arg2))
		fmod_event_set3DPosition(_id, arg1, arg2, arg3)
	else
		fmod_studio_event_instance_start(_id);
		
	fmod_studio_event_instance_release(_id)
	return _id;
}


function fmod_studio_event_instance_start(sound_id, loop = false){
	audio_play_sound(sound_id, 1, loop)
}

function fmod_studio_event_instance_set_parameter_by_name(sound, variable, value, noidea){
	scr_fmod_statehandle(sound, variable, value);
}

function fmod_studio_event_instance_set_paused(sound, value){
	if (value == true)
		audio_pause_sound(sound);
	else
		audio_resume_sound(sound);
}

function fmod_createEventInstance(sound){
	return scr_fmodpath_convert(sound);
}

function fmod_studio_system_set_parameter_by_name(sound, reverb = false, noidea = false, noidea2 = false){

}

function event_instance_isplaying(sound){
	return false;
}

function fmod_studio_event_instance_stop(sound, nofade = true){
	if is_string(sound) || is_undefined(sound)
		exit;	

	if nofade
		audio_stop_sound(sound)
	else
		audio_sound_gain(sound, 0, 500);
}

function fmod_studio_system_get_parameter_by_name(reverb){
    var fakestruct = {
        value: -1,
		final_value: -1
    };
	
	return fakestruct;
}

function event_play_multiple(arg0 = "", arg1 = undefined, arg2 = undefined, arg3 = 0)
{
	event_play_oneshot(arg0, arg1, arg2, arg3)
}

function fmod_studio_event_instance_release(sound){
	//nothing...
}

function fmod_studio_event_instance_set_callback(sound, noidea){ //no idea might be a beat??
	
}

function fmod_event_set3DPosition(sound, _x, _y, _z = 0) {
    var _sound = audio_play_sound(sound, 1, 0);

    var distance = point_distance(0, 0, _x - obj_parent_player.x, _y - obj_parent_player.y);
    var volume = clamp(distance / 1000, 0, 1);
    audio_sound_gain(_sound, 1 - volume, 0);
}

function fmod_studio_event_instance_get_paused(sound){
	return audio_is_paused(sound);
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

function fmod_studio_event_instance_get_timeline_position(sound){
	return-1;
}

function fmod_getEventLength(sound){
	return -1;
}

function fmod_studio_event_instance_set_timeline_position(sound, pos){
	
}