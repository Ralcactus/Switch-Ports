//cotton
if (audio_sound_get_gain(steamy) <= 0){
	audio_stop_sound(steamy);
	audio_sound_gain(steamy, 0, 0)
}
if (audio_sound_get_gain(clocktower) <= 0){
	audio_stop_sound(clocktower);
	audio_sound_gain(clocktower, 0, 0)
}

//mines
if (audio_sound_get_gain(mu_mineshaft1) <= 0){
	audio_stop_sound(mu_mineshaft1);
	audio_sound_gain(mu_mineshaft1, 0, 0)
}
if (audio_sound_get_gain(cobaltostver) <= 0){
	audio_stop_sound(cobaltostver);
	audio_sound_gain(cobaltostver, 0, 0)
}


//molasses
if (audio_sound_get_gain(gennyswamp) <= 0){
	audio_stop_sound(gennyswamp);
	audio_sound_gain(gennyswamp, 0, 0)
}
if (audio_sound_get_gain(gennyswamp_found) <= 0){
	audio_stop_sound(gennyswamp_found);
	audio_sound_gain(gennyswamp_found, 0, 0)
}
