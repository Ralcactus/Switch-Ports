hand_ind = 0;

func_na = function()
{
};

var func_game = function()
{
    menu_selected = menu_game;
};

var func_video = function()
{
    menu_selected = menu_video;
    selected_option = 0;
};

var func_audio = function()
{
    menu_selected = menu_audio;
    selected_option = 0;
};

var func_back = function()
{
    instance_destroy();
};

menu_main = 
{
    options: ["GAME", "VIDEO", "AUDIO", "BACK"],
    functions: [func_game, func_video, func_audio, func_back]
};

var func_remap = function()
{
    instance_create_depth(0, 0, depth, obj_keybinds);
};

var func_deadzone = function()
{
};

var func_resetpad = function()
{
    global.deadzone = 1;
    ini_open("options.ini");
    ini_write_real("OPTIONS", "Gamepad Deadzone", global.deadzone);
    fixed_ini_close();
};

func_back = function()
{
    menu_selected = menu_main;
    selected_option = 0;
};

menu_game = 
{
    options: ["REMAP KEYBOARD", "PAD DEADZONE", "RESET PAD DEFAULT", "BACK"],
    functions: [func_remap, func_deadzone, func_resetpad, func_back]
};

var func_fullscreen = function()
{
    window_set_fullscreen(!window_get_fullscreen());
};

var func_resolution = function()
{
};

var func_texture = function()
{
    global.texfilter = !global.texfilter;
    ini_open("options.ini");
    ini_write_real("OPTIONS", "Texture Filter", global.texfilter);
    fixed_ini_close();
};

var func_vsync = function()
{
    global.vsync = !global.vsync;
    ini_open("options.ini");
    ini_write_real("OPTIONS", "Vsync", global.vsync);
    fixed_ini_close();
    display_reset(0, global.vsync);
};

var func_reset = function()
{
    global.texfilter = false;
    global.vsync = false;
    ini_open("options.ini");
    ini_write_real("OPTIONS", "Texture Filter", global.texfilter);
    ini_write_real("OPTIONS", "Vsync", global.vsync);
    fixed_ini_close();
};

func_back = function()
{
    menu_selected = menu_main;
    selected_option = 1;
};

menu_video = 
{
    options: ["TOGGLE FULLSCREEN", "RESOLUTION", "TEXTURE FILTER", "VSYNC", "RESET TO DEFAULT", "BACK"],
    functions: [func_fullscreen, func_resolution, func_texture, func_vsync, func_reset, func_back]
};

func_reset = function()
{
    global.vol_master = 0.5;
    global.vol_bgm = 1;
    global.vol_sfx = 1;
    
    with (obj_persistent)
        set_audio();
    
    ini_open("options.ini");
    ini_write_real("OPTIONS", "Master Volume", global.vol_master);
    ini_write_real("OPTIONS", "BGM Volume", global.vol_bgm);
    ini_write_real("OPTIONS", "SFX Volume", global.vol_sfx);
    fixed_ini_close();
};

func_back = function()
{
    menu_selected = menu_main;
    selected_option = 2;
};

menu_audio = 
{
    options: ["MASTER VOL", "BGM VOL", "SFX VOL", "RESET TO DEFAULT", "BACK"],
    functions: [func_na, func_na, func_na, func_reset, func_back]
};
menu_selected = menu_main;
selected_option = 0;
input = global.input[0];
