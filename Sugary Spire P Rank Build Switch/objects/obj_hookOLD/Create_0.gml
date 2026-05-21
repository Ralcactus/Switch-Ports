enum HookType 
{
	normal,
	
	// only left and right are "used" anymore
	left,
	right,
	
	up,
	down
}

hookSoundEmitter = audio_emitter_create();
audio_play_sound_on(hookSoundEmitter, sfx_propeller, true, 100);
audio_emitter_gain(hookSoundEmitter, global.soundVolume);
image_speed = 0.35;
