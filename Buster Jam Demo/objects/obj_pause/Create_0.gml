instance_deactivate_all_hook(true);
instance_activate_object(input_controller_object);
instance_activate_object(obj_persistent);
screenshot = sprite_create_from_surface(application_surface, 0, 0, 1920, 1080, false, false, 0, 0);
audio_pause_all();
input_verb_consume("pause");

event_unpause = function()
{
    instance_activate_all();
    instance_destroy();
    audio_resume_all();
};

options[0] = ["Resume", "Casino", "Options", "Exit to Title"];
options[1] = ["I'm Sure", "Go Back"];

var _resume = function()
{
    event_unpause();
    go_sound = undefined;
};

var _casino = function()
{
    go_sound = snd_kiss;
    not_in_demo_alpha = 3.75;
};

var _options = function()
{
    instance_create_layer(0, 0, layer, obj_options);
};

var _exit = function()
{
    menu = 1;
    selected = 1;
};

options_func[0] = [_resume, _casino, _options, _exit];

var _yes = function()
{
    room_goto_fade(rm_title_load, 90, undefined, true);
    go_sound = snd_menu_back;
    ready = false;
};

var _no = function()
{
    go_sound = snd_menu_back;
    menu = 0;
    selected = 3;
};

options_func[1] = [_yes, _no];
menu = 0;
time = 0;

for (var i = 0; i < 12; i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

selected = 0;
ready = true;
not_in_demo_alpha = 0;
