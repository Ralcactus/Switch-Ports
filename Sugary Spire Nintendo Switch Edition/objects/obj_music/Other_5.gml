if (!currentSecretStatus)
	exit

if (!is_undefined(global.RoomMusic))
{
	fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true)
	
	if (!global.panic)
	{
		fmod_studio_event_instance_set_paused(global.CurrentMusic, false)
		fmod_studio_event_instance_set_callback(global.CurrentMusic, FMOD_STUDIO_EVENT_CALLBACK.TIMELINE_BEAT)
	}
}

if (global.panic)
{
	fmod_studio_event_instance_set_paused(global.EscapeMusicInst, false)
	fmod_studio_event_instance_set_callback(global.EscapeMusicInst, FMOD_STUDIO_EVENT_CALLBACK.NESTED_TIMELINE_BEAT)
}

currentSecretStatus = false
global.RoomIsSecret = false
