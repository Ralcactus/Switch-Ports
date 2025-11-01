texture_prefetch("tg_frenzy");
texture_prefetch("fonts");
texture_prefetch("gui_micro");

if (layer_exists("CamBounds"))
    layer_set_visible("CamBounds", false);

if (room == rm_endless)
    global.hp_max = 4;
else
    global.hp_max = 3;

global.hp = global.hp_max;
win = true;
game_over = false;
instance_create_layer(0, 0, "GUI", obj_map_frenzy_gui);
last_game = -4;
effect_countdown = -1;
effect_gamenum_start = 25;
count = 2;
count_percent = 0;
go = false;
timer[0] = 90;

timer_func[0] = function()
{
    go = true;
    count_percent = 0;
    count--;
    count_str = "READY?";
    timer[0] = 90;
    
    if (count == 0)
    {
        audio_play_sound(voice_announcer_go, 0, 0);
        count_str = "GO!";
        timer[0] = -1;
        timer[1] = 60;
    }
    else
    {
        audio_play_sound(voice_announcer_ready, 0, 0);
    }
};

timer[1] = -1;

timer_func[1] = function()
{
    go = false;
    games_total = [];
    
    for (var i = 0; i < array_length(games); i++)
        games_total = array_concat(games_total, games[i]);
    
    var _inst = instance_create_layer(0, 0, "GUI", obj_frenzy);
    _inst.my_boss = id;
    _inst.speedups = speedups;
    _inst.draw = false;
    _inst.microgame_autodraw = true;
    _inst.microgame_trans = false;
    _inst.microgame_music = microgame_music;
    _inst.state_beat = -1;
    
    with (_inst)
        timer_func[2]();
    
    for (var i = 0; i < array_length(games); i++)
    {
        _inst.games[i] = [];
        array_copy(_inst.games[i], 0, games[i], 0, array_length(games[i]));
    }
    
    _inst.games_total = [];
    array_copy(_inst.games_total, 0, games_total, 0, array_length(games_total));
};

timer[2] = -1;

timer_func[2] = function()
{
    event_user(0);
};

timer[3] = -1;

timer_func[3] = function()
{
    room_goto(rm_win_screen);
};

global.frenzy_music = -4;
global.frenzy_music_list = [];
games[0] = ["gart_jump", "monster_truck", "demoswing", "jetpack_collect"];
speedups = [];
games_over = false;

event_boss = function()
{
    games_over = true;
};

done = false;
zoom = 1;
pattern_bar_x = 0;
bars_out = 0;
alarm[0] = 1;
state_beat = -1;

event_music_beat = function()
{
    if (obj_frenzy.state != 0 || done)
        exit;
    
    with (par_frenzy_scene)
    {
        state_beat = other.state_beat;
        event_music_beat();
    }
    
    switch (state_beat)
    {
        case 0:
            zoom_in = false;
            zoom_percent = 0;
            game_in = false;
            
            if (games_over)
            {
                event_user(0);
                done = true;
                exit;
            }
            
            var _snd;
            
            if (!started)
            {
                _snd = intro_sound;
            }
            else if (win)
            {
                if (obj_frenzy.games_done || obj_frenzy.speedup_next)
                    _snd = win_final_sound;
                else
                    _snd = win_sound;
            }
            else if (global.game_over)
            {
                _snd = lose_final_sound;
            }
            else
            {
                _snd = lose_sound;
            }
            
            my_win_snd = audio_play_sound(_snd, 0, false);
            
            if (obj_frenzy.games_done)
                global.speedup = 1;
            
            audio_sound_pitch(my_win_snd, global.speedup);
            break;
        
        case 2:
            if (!win)
            {
                with (obj_frenzy_counter)
                {
                    if (instance_exists(obj_frenzy))
                    {
                        if (!global.game_over)
                            game = obj_frenzy.game;
                    }
                }
            }
            
            break;
        
        case 4:
            started = true;
            break;
    }
};

started = false;
my_win_snd = -4;
my_trans_snd = -4;

if (layer_exists("Instances_Render0"))
    instance_create_layer(0, 0, "Instances_Render0", obj_depthsorter);

if (layer_exists("Instances_Render1"))
{
    var _inst = instance_create_layer(0, 0, "Instances_Render1", obj_depthsorter);
    _inst.render_layer = 1;
}

event_game_in = function()
{
    game_in = true;
    game_in_percent = 0;
};

game_in = false;
game_in_percent = 1;

event_micro_loss = function()
{
    win = false;
};

event_micro_win = function()
{
    win = true;
};

event_speedup = function()
{
    if (audio_is_playing(my_win_snd))
        audio_stop_sound(my_win_snd);
};

event_lastgame = function()
{
    if (audio_is_playing(my_win_snd))
        audio_stop_sound(my_win_snd);
};

event_lastgame_finished = function()
{
    var _snd = audio_play_sound(transition_sound, 0, false);
    audio_sound_pitch(_snd, global.speedup);
    
    with (obj_frenzy)
    {
        state_beat = 3;
        event_music_beat();
    }
};

event_speedup_finished = function()
{
    with (obj_frenzy)
    {
        state_beat = 3;
        event_music_beat();
    }
    
    var _snd = audio_play_sound(transition_sound, 0, false);
    audio_sound_pitch(_snd, global.speedup);
};

overlay_white = 0;
overlay_dec = 0.1;
