enum OPTION_AUDIOSELECTED 
{
	back = 0,
	master = 1,
	music = 2,
	sound = 3,
	dialogue = 4
}

ini_open("optionData.ini");
global.musicVolume = ini_read_real("Settings", "musicvol", 0.6);
global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
ini_close();
optionsaved_masterVolume = global.masterVolume;
optionsaved_dialogueVolume = global.dialogueVolume;
optionsaved_musicVolume = global.musicVolume;
optionsaved_soundVolume = global.soundVolume;
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
depth = -100;
selecting = -1;
optionselected = OPTION_AUDIOSELECTED.back;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
