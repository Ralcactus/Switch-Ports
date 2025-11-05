selected = 0;
flowspr = spr_soundtestflow;
flowstate = false;
flowframe = 0;
readoutsurf = -1;
vinylspin = 0;
texel = shader_get_uniform(shd_readoutoutline, "u_Texel");
curmusic = 0;
muevent = noone;
musiclist = 
[
	["event:/music/soundtest/title", "menu/soundtest/title"], 
	["event:/music/soundtest/patch", "menu/soundtest/patch"], 
	["event:/music/soundtest/pause", "menu/soundtest/pause"], 
	["event:/music/soundtest/bonus", "menu/soundtest/bonus"], 
	["event:/music/soundtest/rank", "menu/soundtest/rank"], 
	["event:/music/soundtest/credits", "menu/soundtest/credits"], 
	["event:/music/soundtest/titledraft", "menu/soundtest/titledraft"], 
	["event:/music/soundtest/patchdraft", "menu/soundtest/patchdraft"], 
	["event:/music/soundtest/pausedraft", "menu/soundtest/pausedraft"], 
	["event:/music/soundtest/bonusdraft", "menu/soundtest/bonusdraft"], 
	["event:/music/soundtest/creditsdraft", "menu/soundtest/creditsdraft"]
];
save_open();

if (has_easteregg("lifeExpectancyVoided"))
    array_push(musiclist, ["event:/music/soundtest/perilous", "menu/soundtest/anguish", true]);

save_close();
super = 0;
superCode = [3, 0, 1, 5];
easteregged = false;
