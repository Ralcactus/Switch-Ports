if (!instance_exists(obj_controls_popup))
{
    var _controls = instance_create_depth(0, 0, depth - 1, obj_controls_popup);
    _controls.image_alpha = 0.55;
}

deac = false;

var func_play = function()
{
    instance_create_layer(0, 0, layer, obj_stage_select);
    instance_destroy();
};

var func_options = function()
{
    instance_create_layer(0, 0, layer, obj_options);
};

var func_kickstarter = function()
{
    audio_play_sound(snd_kaching, 0, 0);
    url_open("https://www.kickstarter.com/projects/tallglass/boom-buster");
};

var func_discord = function()
{
    url_open("https://discord.gg/ZNHdQHps8G");
    audio_play_sound(snd_bonk, 0, 0);
};

var func_credits = function()
{
    with (obj_controls_popup)
        instance_destroy();
    
    with (obj_controls)
        instance_destroy();
    
    instance_create_layer(0, 0, layer, obj_credits);
};

var func_quit = function()
{
    game_end();
};

menu = 
{
    options: ["PLAY", "OPTIONS", "KICKSTARTER", "DISCORD", "CREDITS", "QUIT"],
    functions: [func_play, func_options, func_kickstarter, func_discord, func_credits, func_quit]
};
selected_option = 0;
input = global.input[0];
