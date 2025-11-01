audio_pause_all();
audio_resume_sound(global.bgmPlay);
spr = sprite_create_from_surface(application_surface, 0, 0, 1408, surface_get_height(application_surface), 0, 0, 0, 0);
instance_deactivate_all(true);
instance_activate_object(obj_persistent);
instance_activate_object(global.input[0]);
instance_activate_object(obj_controller);
instance_activate_object(obj_editor);
audio_sound_gain(global.bgmPlay, 0, 500);
alarm[2] = 25;
alarm[0] = 90;
spotlight_radius = 0;
spotlight_percent = 0;
static_ind = 0;
out = false;
freeze = true;
ready = false;
input = global.input[0];

if (global.world == 0)
{
    world_str = "(TUTORIAL) GREASY GROTTO";
}
else if (global.world == 1)
{
    if (global.stage <= 3)
        world_str = "(W1) BOOMTOWN";
    else
        world_str = "(W1) BOOMTOWN - SUNSET";
}

var func_resume = function()
{
    alarm[0] = -1;
    out = true;
    deac = true;
    audio_resume_sound(global.bgmPlay);
    audio_sound_gain(global.bgmPlay, 1, 800);
    audio_stop_sound(bgmPlay);
};

var func_options = function()
{
    instance_create_depth(0, 0, depth - 10, obj_options);
};

var func_kickstarter = function()
{
    audio_play_sound(snd_kaching, 0, 0);
    url_open("https://www.kickstarter.com/projects/tallglass/boom-buster");
};

var func_discord = function()
{
    audio_play_sound(snd_bonk, 0, 0);
    url_open("https://discord.gg/ZNHdQHps8G");
};

var func_exit = function()
{
    var _trans = room_goto_triangles(rm_title);
    audio_sound_gain(bgmPlay, 0, 800);
    
    _trans.func_roomend = function()
    {
        audio_stop_all();
    };
    
    deac = true;
};

var func_restart = function()
{
    var _trans = room_goto_triangles(room);
    audio_sound_gain(bgmPlay, 0, 800);
    
    _trans.func_roomend = function()
    {
        global.dollars = global.dollars_start;
        global.combo_meter = global.meter_start;
        global.food[global.act] = false;
        audio_stop_all();
    };
    
    deac = true;
};

menu = 
{
    options: ["RESUME", "RESTART ACT", "OPTIONS", "KICKSTARTER", "DISCORD", "EXIT STAGE"],
    functions: [func_resume, func_restart, func_options, func_kickstarter, func_discord, func_exit]
};
selected_option = 0;
deac = false;
hand_ind = 0;
over_scale = 1.2;
