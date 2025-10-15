pausedmusic = 0
fadeoff = 0
global.music = 0
roomname = obj_null
arena = 0
global.mu = -4
music = -4
secretmusic = -4
musicID = -4
escapemusic = mu_botuctime
lap2music = bo_noise_polish_shorter_1_
escapemusicID = escapemusic
secretmusicID = -4
pillarmusicID = -4
secret = 0
secretend = 0
pillar_on_camera = 0
prevpillar_on_camera = 0
lapstart = false
room_arr = [
	[rm_mainmenu, bo_noise_load, bo_noise_load, false], 
	[rank_room, bonoise_pillar, bo_noise_load, false], 
	[creditsroom, bo_bash, bo_noise_load, false], 
	[timesuproom, bonoise_pillar, bo_noise_load, false], 
	[midway_1, midway, bonus_final, false], 
	[water_1, fiish, vaadaaavavda, false], 
	[water_3, fiish, vaadaaavavda, true], 
	[water_4, lakeeerie_cave_uni_land, vaadaaavavda, true], 
	[smb_1, mu_smb, bonus_final, false], 
	[smb_1_32, mu_smb, bonus_final, false], 
	[hub_entrancehall, mu_hub, bonus_final, false], 
	[hub_world1, mu_hub, bonus_final, false], 
	[rm_levelselect, lakeeerie_cave_uni_land, bonus_final, false], 
	[hub_soundtest, bonoise_pillar, bonoise_pillar, false], 
	[hub_secretdanceroom, mu_init, bonoise_pillar, false], 
	[hub_secretmidway, mu_achievementroom, bonoise_pillar, false], 
	[rm_evilleafyishere, mu_null, bonoise_pillar, false], // ignore mu_null. setting it to undefined kills the game
]