// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fmod_statehandle(sound, variable, value){
	var musicfade_speed = 300;
	
	switch (sound){
		case sfx_mach1:
			if ((value == 0 || value == 1) && !audio_is_playing(pz_mach1)){
				audio_stop_sound(pz_mach2_temp);
				audio_stop_sound(pz_mach3);
				audio_stop_sound(pz_mach4);
				audio_play_sound(pz_mach1,1,0);
			}
			
			if (value == 2 && !audio_is_playing(pz_mach2_temp)){
				audio_stop_sound(pz_mach1);
				audio_stop_sound(pz_mach3);
				audio_stop_sound(pz_mach4);
				audio_play_sound(pz_mach2_temp,1,0);
			}	
			
			if (value == 3 && !audio_is_playing(pz_mach3)){
				audio_stop_sound(pz_mach1);
				audio_stop_sound(pz_mach2_temp);
				audio_stop_sound(pz_mach4);
				audio_play_sound(pz_mach3,1,0);
			}	
			
			if (value == 4 && !audio_is_playing(pz_mach4)){
				audio_stop_sound(pz_mach1);
				audio_stop_sound(pz_mach2_temp);
				audio_stop_sound(pz_mach3);
				audio_play_sound(pz_mach4,1,0);
			}
		break;
		
		//main menu pre open curtain
		case Exhibition_Night__M_:
			if (!audio_is_playing(mus_titlescreen_begin) && !audio_is_playing(Exhibition_Night__M_))
				exit;
				
			if (value == 0 && !audio_is_playing(mus_titlescreen_begin)){
				audio_stop_sound(Exhibition_Night__M_);
				audio_play_sound(mus_titlescreen_begin,1,0);
				global.CurrentMusic = mus_titlescreen_begin;
			}	
			
			if (value == 1 && !audio_is_playing(Exhibition_Night__M_)){
				audio_stop_sound(mus_titlescreen_begin);
				audio_play_sound(Exhibition_Night__M_,1,1);
				global.CurrentMusic = Exhibition_Night__M_;
			}
		break;
		
		//Cotton town pt B
		case steamy:
			if (!audio_is_playing(steamy) && !audio_is_playing(clocktower))
				exit;
			
			if (variable == "state"){
				if (value == 0 && !audio_is_playing(steamy)){
					global.CurrentMusic = steamy;
					audio_sound_gain(clocktower, 0, musicfade_speed);
					audio_play_sound(steamy,1,0);
					audio_sound_gain(steamy,1, musicfade_speed);
				}	
			
				if (value == 1 && !audio_is_playing(clocktower)){
					global.CurrentMusic = clocktower;
					audio_sound_gain(steamy, 0, musicfade_speed);
					audio_play_sound(clocktower,1,1);
					audio_sound_gain(clocktower, 1, musicfade_speed);
				}
			}
		break;		
		
		//Molasses pt B
		case gennyswamp:
			if (!audio_is_playing(gennyswamp) && !audio_is_playing(gennyswamp_found))
				exit;
				
			if (variable == "state"){
				if (value == 0 && !audio_is_playing(gennyswamp)){
					global.CurrentMusic = gennyswamp;
					audio_sound_gain(gennyswamp_found, 0, musicfade_speed);
					audio_play_sound(gennyswamp,1,0);
					audio_sound_gain(gennyswamp,1, musicfade_speed);
				}	
			
				if (value == 1 && !audio_is_playing(gennyswamp_found)){
					global.CurrentMusic = gennyswamp_found;
					audio_sound_gain(gennyswamp, 0, musicfade_speed);
					audio_play_sound(gennyswamp_found,1,1);
					audio_sound_gain(gennyswamp_found, 1, musicfade_speed);
				}
			}
		break;		
		
		//Mines pt B
		case mu_mineshaft1:
			if (!audio_is_playing(mu_mineshaft1) && !audio_is_playing(cobaltostver))
				exit;
				
			if (variable == "state"){
				if (value == 0 && !audio_is_playing(mu_mineshaft1)){
					global.CurrentMusic = mu_mineshaft1;
					audio_sound_gain(cobaltostver, 0, musicfade_speed);
					audio_play_sound(mu_mineshaft1,1,0);
					audio_sound_gain(mu_mineshaft1,1, musicfade_speed);
				}	
			
				if (value == 1 && !audio_is_playing(cobaltostver)){
					global.CurrentMusic = cobaltostver;
					audio_sound_gain(mu_mineshaft1, 0, musicfade_speed);
					audio_play_sound(cobaltostver,1,1);
					audio_sound_gain(cobaltostver, 1, musicfade_speed);
				}
			}
		break;
	}
}