alarm[1] = 90;
anim_play(asset_get_index(string("spr_buster_death{0}", irandom_range(0, 1))));
facing = 1;
fuse = audio_play_sound(snd_fuse, 0, true);
audio_sound_gain(fuse, 0.5, 0);
