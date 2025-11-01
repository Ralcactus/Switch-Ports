testvariablenothing = false;
select_ease = 0;
select_in = 0;
time = 0;
instance_create_layer(0, 0, layer, obj_frenzy_pattern);
instance_create_layer(0, 0, layer, obj_frenzy_gameover_splash);
music_play = audio_play_sound(bgm_frenzy_gameover, 0, true);
highscore = false;

if (room == rm_endless)
{
    options[0] = ["Play Again", "Leaderboard", "Give Up"];
    var _score = global.stats_highscore_endless;
    
    if (obj_frenzy.game > _score)
    {
        global.stats_highscore_endless = obj_frenzy.game;
        
        with (obj_persistent)
            event_save_user();
        
        highscore = true;
    }
}
else
{
    options[0] = ["Start Over", "Give Up"];
}

var _startover = function()
{
    var _room;
    
    if (instance_exists(obj_macro_lose))
        _room = obj_macro_lose.restart_room;
    else
        _room = room;
    
    room_goto_fade(_room, 45);
    ready = false;
    audio_fadeout_stop(music_play, 0, 1200);
    
    if (instance_exists(obj_frenzy_gameover_splash))
    {
        if (audio_is_playing(obj_frenzy_gameover_splash.wizard_line))
            audio_sound_gain(obj_frenzy_gameover_splash.wizard_line, 0, 1200);
        
        obj_frenzy_gameover_splash.timer[0] = -1;
    }
};

var _continue = function()
{
    audio_play_sound(snd_coin, 0, 0);
};

var _giveup = function()
{
    room_goto_fade(rm_title_load, 45, undefined, true);
    ready = false;
    audio_fadeout_stop(music_play, 0, 1200);
    
    if (instance_exists(obj_frenzy_gameover_splash))
    {
        if (audio_is_playing(obj_frenzy_gameover_splash.wizard_line))
            audio_sound_gain(obj_frenzy_gameover_splash.wizard_line, 0, 1200);
        
        obj_frenzy_gameover_splash.timer[0] = -1;
    }
};

var _leaderboard = function()
{
    if (!global.network_available)
    {
        var _inst = instance_create_layer(0, 0, "Leaderboard", obj_network_getstats);
        
        _inst.event_success = function()
        {
            instance_create_layer(0, 0, "Leaderboard", obj_leaderboard);
        };
        
        _inst.event_fail = function()
        {
            with (obj_frenzy_gameover)
                ready = true;
        };
    }
    else
    {
        instance_create_layer(0, 0, "Leaderboard", obj_leaderboard);
    }
    
    ready = false;
};

if (room == rm_endless)
    options_func[0] = [_startover, _leaderboard, _giveup];
else
    options_func[0] = [_startover, _giveup];

menu = 0;
time = 0;

for (var i = 0; i < 12; i++)
{
    menu_scale[i] = 1;
    menu_alpha[i] = 1;
}

selected = 0;
ready = false;
timer[0] = 50;

timer_func[0] = function()
{
    ready = true;
};

overlay_alpha = 0;
overlay_alpha_to = 0.5;
options_in = 1;
options_in_percent = 0;
options_in_xoff = 1500;
