selectedmenu = UnknownEnum.Value_0;
menus = [];
depth = -99;
var main_option = [];
create_option_press(main_option, "AUDIO", "", function()
{
    goto_menu(UnknownEnum.Value_2);
});
create_option_press(main_option, "VIDEO", "", function()
{
    goto_menu(UnknownEnum.Value_1);
});
create_option_press(main_option, "GAME", "", function()
{
    goto_menu(UnknownEnum.Value_3);
});
create_option_press(main_option, "CONTROLS", "", function()
{
    scr_input_varinit();
    instance_create(x, y, obj_Options_Input);
});
menus[UnknownEnum.Value_0] = create_option_menu(1, undefined, main_option, undefined, undefined, 10);
var res = [];

for (var i = 0; i < array_length(global.resolutions); i++)
    array_push(res, string(global.resolutions[i][0]) + " X " + string(global.resolutions[i][1]));

var video_option = [];
create_option_press(video_option, "BACK", undefined, function()
{
    goto_menu(UnknownEnum.Value_0);
});
create_option_toggle(video_option, "FULLSCREEN", undefined, function(arg0)
{
    quick_write_option("Settings", "fullscrn", arg0);
    global.fullscreen = arg0;
    window_set_fullscreen(global.fullscreen);
}).value = global.fullscreen;
create_option_multichoice(video_option, "RESOLUTION", undefined, res, function(arg0)
{
    quick_write_option("Settings", "resolution", arg0);
    global.selectedResolution = arg0;
    set_resolution_option(global.selectedResolution);
}).value = global.selectedResolution;
create_option_toggle(video_option, "SMOOTH FILTER", undefined, function(arg0)
{
    quick_write_option("Settings", "smoothscale", arg0);
    global.smoothscale = arg0;
}).value = global.smoothscale;
create_option_toggle(video_option, "PERFORMANCE", undefined, function(arg0)
{
    quick_write_option("Settings", "lowperf", arg0);
    global.lowperformance = arg0;
}).value = global.lowperformance;
menus[UnknownEnum.Value_1] = create_option_menu(1, UnknownEnum.Value_0, video_option);
var audio_option = [];
create_option_press(audio_option, "BACK", undefined, function()
{
    goto_menu(UnknownEnum.Value_0);
});
create_option_slider(audio_option, "MASTER", undefined, function(arg0)
{
    global.masterVolume = arg0 / 100;
    set_volume_options();
}, function(arg0)
{
    global.masterVolume = arg0 / 100;
    set_volume_options();
    quick_write_option("Settings", "mastervol", global.masterVolume);
}, "event:/SFX/ui/sliderMaster").value = round(global.masterVolume * 100);
create_option_slider(audio_option, "MUSIC", undefined, function(arg0)
{
    global.musicVolume = arg0 / 100;
    set_volume_options();
}, function(arg0)
{
    global.musicVolume = arg0 / 100;
    set_volume_options();
    quick_write_option("Settings", "musicvol", global.musicVolume);
}, "event:/SFX/ui/sliderMusic").value = round(global.musicVolume * 100);
create_option_slider(audio_option, "SFX", undefined, function(arg0)
{
    global.soundVolume = arg0 / 100;
    set_volume_options();
}, function(arg0)
{
    global.soundVolume = arg0 / 100;
    set_volume_options();
    quick_write_option("Settings", "soundvol", global.soundVolume);
}, "event:/SFX/ui/sliderSFX").value = round(global.soundVolume * 100);
create_option_toggle(audio_option, "UNFOCUSED MUTE", undefined, function(arg0)
{
    quick_write_option("Settings", "unfocusmute", arg0);
    global.unfocusedMute = arg0;
}).value = global.unfocusedMute;
menus[UnknownEnum.Value_2] = create_option_menu(1, UnknownEnum.Value_0, audio_option);
var game_option = [];
create_option_press(game_option, "BACK", undefined, function()
{
    goto_menu(UnknownEnum.Value_0);
});
create_option_toggle(game_option, "VIBRATION", undefined, function(arg0)
{
    quick_write_option("Settings", "vibration", arg0);
    global.controllerVibration = arg0;
}).value = global.controllerVibration;
create_option_toggle(game_option, "TIMER", undefined, function(arg0)
{
    quick_write_option("Settings", "timer", arg0);
    global.toggleTimer = arg0;
}).value = global.toggleTimer;
create_option_toggle(game_option, "HITSTUN", undefined, function(arg0)
{
    quick_write_option("Settings", "hitstun", arg0);
    global.hitstunEnabled = arg0;
}).value = global.hitstunEnabled;
menus[UnknownEnum.Value_3] = create_option_menu(1, UnknownEnum.Value_0, game_option);
menus[UnknownEnum.Value_4] = create_option_menu(1, UnknownEnum.Value_0, game_option);
optionselected = 0;
bgx = 0;
bgy = 0;
textScroll = 0;
old_desc = "";
descfadeout = false;
description = "";
showdesc = false;
descalp = 0;
scrollbuffer = 0;

get_detail = function(arg0)
{
    old_desc = description;
    descfadeout = true;
    description = arg0.desc;
    showdesc = description != "" && !is_undefined(description);
};

no_input_buffer = 0;
