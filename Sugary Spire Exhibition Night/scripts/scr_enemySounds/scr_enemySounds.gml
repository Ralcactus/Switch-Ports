function scr_enemySounds_init()
{
	sndCharge = fmod_createEventInstance(snd_charge)
	sndBeamAttack = fmod_createEventInstance("event:/SFX/enemies/beamAttack")
	sndSluggyDig = fmod_createEventInstance("event:/SFX/enemies/sluggyDig")
	mySoundArray = [sndCharge, sndBeamAttack, sndSluggyDig]
}

function scr_enemySounds_release()
{
	var sound_array = [sndCharge, sndBeamAttack, sndSluggyDig]
	
	for (var i = 0; i < array_length(sound_array); i++)
	{
		fmod_studio_event_instance_stop(sound_array[i], true)
		fmod_studio_event_instance_release(sound_array[i])
	}
}

function scr_enemySounds_update()
{
	var _state = global.freezeframe ? frozenState : state
	
	if (_state != PlayerState.titlescreen && _state != PlayerState.burrow)
	{
		if (event_instance_isplaying(sndCharge))
			fmod_studio_event_instance_stop(sndCharge, false)
		
		if (event_instance_isplaying(sndBeamAttack))
			fmod_studio_event_instance_stop(sndBeamAttack, false)
		
		if (event_instance_isplaying(sndSluggyDig))
			fmod_studio_event_instance_stop(sndSluggyDig, false)
	}
	
	for (var i = 0; i < array_length(mySoundArray); i++)
	{
		var snd_id = mySoundArray[i]
		
		if (event_instance_isplaying(snd_id))
			fmod_quick3D(snd_id)
	}
}
