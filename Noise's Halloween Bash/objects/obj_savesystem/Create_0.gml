enum save_state 
{
	idle = 0,
	dumpsave = 1,
	loadsave = 2,
	dumpconfig = 3,
}

savestate = save_state.idle;
savestr = "";
configstruct = {};
savebuff = -1;
configsavebuff = -1;
loadbuff = -1;
asyncsaveid = -1;
asyncconfigsaveid = -1;
asyncloadid = -1;
savequeue = ds_queue_create();
var _jsonver = -1;

if (file_exists("optionsData.json"))
{
    var _str = "";
    var _file = file_text_open_read("optionsData.json");
    
    while (!file_text_eof(_file))
    {
        var _line = file_text_readln(_file);
        
        if (string_starts_with(_line, "CONFIG VERSION: "))
            _jsonver = real(string_digits(_line));
        else if (!string_starts_with(_line, "//") && _line != "" && _line != "\n")
            _str += _line;
    }
    
    file_text_close(_file);
    configstruct = json_parse(_str);
}

trace("CONFIG VERSION: ", _jsonver);

if (_jsonver < 0)
    config_set_option("Input", "bindings", -1);

global.screensizes[0] = [[640, 480], [800, 600], [1024, 768], [1280, 960], [1600, 1200]];
global.screensizes[1] = [[480, 270], [960, 540], [1280, 720], [1600, 900], [1920, 1080]];
global.screensizes[2] = [[480, 300], [960, 600], [1366, 854], [1600, 1000], [1920, 1200]];
global.borders = [-1];
var _highestaspectratio = array_length(global.screensizes) - 1;
global.maxscreenwidth = global.screensizes[_highestaspectratio][1][0];
global.maxscreenheight = global.screensizes[_highestaspectratio][1][1];

enum aspectratio 
{
	res4_3 = 0,
	res16_9 = 1,
	res16_10 = 2,
}
global.resmode = config_get_option("Video", "resmode", aspectratio.res16_9);
global.resnumb = config_get_option("Video", "resnumb", 1);
global.scalemode = config_get_option("Video", "scalemode", scaletype.fit);
global.fullscreen = config_get_option("Video", "fullscreen", false);
global.antialiasing = config_get_option("Video", "antialiasing", false);
global.outlines = config_get_option("Video", "outlines", true);
global.vsync = config_get_option("Video", "vsync", false);
global.border = config_get_option("Video", "border", 0);
global.currentres = global.screensizes[global.resmode][global.resnumb];
global.currentinternalres = global.screensizes[global.resmode][1];
global.mastervolume = config_get_option("Audio", "mastervolume", 1);
global.musicvolume = config_get_option("Audio", "musicvolume", 1);
global.sfxvolume = config_get_option("Audio", "sfxvolume", 1);
global.unfocusedmute = config_get_option("Audio", "unfocusedmute", false);
global.musicattenuation = config_get_option("Audio", "musicattenuation", false);
global.attenuationwait = config_get_option("Audio", "attenuationwait", 0);
var _bindings = config_get_option("Input", "bindings", -1);

if (_bindings != -1)
    input_system_import(_bindings);

global.horizdeadzone = mean(input_axis_threshold_get(gp_axislh).__mini, input_axis_threshold_get(gp_axisrh).__mini);
global.vertdeadzone = mean(input_axis_threshold_get(gp_axislv).__mini, input_axis_threshold_get(gp_axisrv).__mini);
global.rumble = config_get_option("Accessibility", "rumble", true);
global.screenshake = config_get_option("Accessibility", "screenshake", 0.5);
global.speedruntimer = config_get_option("Accessibility", "speedruntimer", false);
global.colouredscore = config_get_option("Accessibility", "colouredscore", true);
alarm[0] = 1;
saveiconspr = spr_saveindicator;
saveiconind = 0;
saveiconalpha = 0;
depth = -15000;
