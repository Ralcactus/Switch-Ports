if (scr_enemy_playerisnear(300, 200))
	sprite_index = spr_harryScared
else
	sprite_index = spr_harryNEW

ShakeBuffer = approach(ShakeBuffer, 0, 0.5)


var volume = clamp(distance_to_object(obj_parent_player) / 1000,0, 1);

audio_sound_gain(global.HarryMusicInst, 1-volume, 0);
audio_sound_gain(global.CurrentMusic, volume, 0);
