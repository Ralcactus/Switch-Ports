testvariablenothing = false;
options[0] = ["Game", "Video", "Audio", "Back"];
options[1] = ["Keyboard Scheme", "Reset to Default", "Back"];
options[2] = ["Toggle Fullscreen", "Resolution", "Texture Filter", "Vsync", "Reset to Default", "Back"];
options[3] = ["Master Vol", "Music Vol", "SFX Vol", "Reset to Default", "Back"];

var _game = function()
{
    menu = 1;
    selected = 0;
};

var _video = function()
{
    menu = 2;
    selected = 0;
};

var _audio = function()
{
    menu = 3;
    selected = 0;
};

var _back = function()
{
    go_sound = snd_menu_back;
    input_verb_consume("cancel");
    input_verb_consume("menu_confirm");
    
    if (instance_exists(obj_title_menu))
        obj_title_menu.ready = true;
    
    if (instance_exists(obj_pause_frenzy))
        obj_pause_frenzy.deac = false;
    
    instance_destroy();
};

options_func[0] = [_game, _video, _audio, _back];

var _remap = function()
{
    global.keyboard = !global.keyboard;
    
    with (obj_persistent)
        event_user(1);
};

var _gamepad = function()
{
    global.gamepad_icons++;
    
    if (global.gamepad_icons > 2)
        global.gamepad_icons = 0;
};

var _reset = function()
{
    global.keyboard = 0;
    
    with (obj_persistent)
        event_user(1);
};

_back = function()
{
    go_sound = snd_menu_back;
    input_verb_consume("menu_confirm");
    menu = 0;
    selected = 0;
};

options_func[1] = [_remap, _reset, _back];

var _fullscreen = function()
{
    window_set_fullscreen(!window_get_fullscreen());
    
    if (!window_get_fullscreen())
        window_center();
};

var _resolution = function()
{
};

var _texfilter = function()
{
    global.texfilter = !global.texfilter;
    gpu_set_texfilter(global.texfilter);
};

var _vsync = function()
{
    global.vsync = !global.vsync;
    display_reset(0, global.vsync);
};

_reset = function()
{
    global.texfilter = false;
    gpu_set_texfilter(global.texfilter);
    global.vsync = false;
    display_reset(0, global.vsync);
    global.window_scale = 1;
    scr_resolution_adapt();
};

_back = function()
{
    go_sound = snd_menu_back;
    input_verb_consume("menu_confirm");
    menu = 0;
    selected = 1;
};

options_func[2] = [_fullscreen, _resolution, _texfilter, _vsync, _reset, _back];

var _master = function()
{
};

var _bgm = function()
{
};

var _sfx = function()
{
};

_reset = function()
{
    global.master_vol = 0.5;
    global.sfx_vol = 1;
    global.bgm_vol = 1;
    
    with (obj_persistent)
        event_user(0);
};

_back = function()
{
    go_sound = snd_menu_back;
    input_verb_consume("menu_confirm");
    menu = 0;
    selected = 2;
};

options_func[3] = [_master, _bgm, _sfx, _reset, _back];
menu = 0;
time = 0;

for (var i = 0; i < 12; i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

selected = 0;
ready = true;
