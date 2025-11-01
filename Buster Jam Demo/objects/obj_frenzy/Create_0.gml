testvariablenothing = false;
audio_group_load(bgm_frenzy_gameover);
global.games_beat = 0;
played_win_sound = false;
played_lose_sound = false;
win_sounds = [];
lose_sounds = [];

event_win_sound = function()
{
    if (!played_win_sound)
        played_win_sound = true;
};

event_lose_sound = function()
{
    if (!played_win_sound)
        played_win_sound = true;
};

in = false;
out = false;
trans_percent = 0;
trans_spotlight = 0;
pattern_move = 0;
pattern_ind = random_range(0, sprite_get_number(spr_frenzy_pattern) - 1);
score = 0;
combo = 0;
score_draw = score;
score_add_alpha = 0;
score_add = score;
controller_handler = -4;
my_boss = -4;
global.game_over = false;
bpm = 140;
global.speedup = 1;
speedups = [[12, 0.07142857142857142], [24, 0.07142857142857142], [36, 0.07142857142857142], [50, 0.07142857142857142], [65, 0.14285714285714285], [80, 0.14285714285714285], [100, 0.07142857142857142]];
speedup_next = false;
emitter = audio_emitter_create();
loss_play = -4;

if (global.frenzy_music > 0)
    music_play = audio_play_sound(global.frenzy_music, 0, true);
else
    music_play = -4;

alpha = 0;

event_state_switch = function(arg0)
{
    var _before = state;
    state_beat = 0;
    state = arg0;
    print(string("State Switch: {0} -> {1}", _before, state));
};

zoom = 1;
zoom_beat = false;
game_set = 0;
games_done = false;
on_last_game = false;

event_check_speedup = function()
{
    for (var i = 0; i < array_length(speedups); i++)
    {
        if (speedups[i][0] == game)
        {
            speedup_next = true;
            
            with (par_frenzy_scene)
                event_speedup_next();
            
            break;
        }
    }
};

speedup_count = 0;

event_speedup = function()
{
    if (just_spedup)
        exit;
    
    var _speedup = undefined;
    
    for (var i = 0; i < array_length(speedups); i++)
    {
        if (speedups[i][0] == game)
        {
            _speedup = speedups[i][1];
            break;
        }
    }
    
    if (_speedup != undefined)
    {
        speedup_count++;
        event_state_switch(2);
        music_pos = audio_sound_get_track_position(music_play);
        audio_stop_sound(music_play);
        music_play = audio_play_sound(bgm_map_speedup, 0, 0);
        audio_sound_pitch(music_play, global.speedup);
        global.speedup_value = _speedup;
        
        if (array_length(global.frenzy_music_list) > 0)
        {
            print(string("speedup_value:{0}", global.speedup_value));
            music_pos *= (1 - global.speedup_value);
        }
        
        with (obj_map_frenzy_controller)
            event_speedup();
        
        instance_create_layer(0, 0, layer, obj_frenzy_speedup);
    }
};

event_lastgame = function()
{
    event_state_switch(2);
    music_pos = audio_sound_get_track_position(music_play);
    audio_stop_sound(music_play);
    music_play = audio_play_sound(bgm_map_lastone, 0, 0);
    
    with (obj_map_frenzy_controller)
        event_lastgame();
    
    global.speedup = 1;
    instance_create_layer(0, 0, layer, obj_frenzy_speedup);
    obj_frenzy_speedup.sprite_index = spr_frenzy_lastone;
    already_lastgamed = true;
};

bpm = 280;
beats = 0;

event_music_beat = function()
{
    state_beat++;
    
    with (obj_map_frenzy_controller)
    {
        state_beat = other.state_beat;
        event_music_beat();
    }
    
    if (!audio_is_playing(global.frenzy_music) && instance_exists(obj_microgame_controller) && obj_microgame_controller.draw_instances)
    {
    }
    else
    {
        global.beat = true;
        
        if ((state_beat % 2) == 0)
            global.beat_double = true;
    }
    
    if (global.game_over)
        exit;
    
    switch (state)
    {
        case 0:
            if ((instance_exists(obj_map_frenzy_controller) && state_beat == 4) || (!instance_exists(obj_map_frenzy_controller) && state_beat == 1))
            {
                if (games_done)
                    exit;
                
                timer[3] = time_bpm_to_seconds(140) * 0.5;
                
                if (!already_lastgamed && room != rm_endless)
                {
                    var _lastone = false;
                    
                    if (array_length(games[game_set]) == 1 && my_boss != -4)
                    {
                        if ((game_set + 1) > (array_length(games) - 1))
                            _lastone = true;
                    }
                    
                    if (_lastone)
                        last_game = true;
                }
            }
            else if (state_beat == 6)
            {
                if (!games_done)
                {
                    event_user(0);
                    pattern_ind = irandom_range(2, 6);
                    state_beat = 1;
                    event_state_switch(1);
                }
            }
            
            break;
        
        case 1:
            break;
        
        case 2:
            if ((instance_exists(obj_map_frenzy_controller) && state_beat == 8) || (!instance_exists(obj_map_frenzy_controller) && state_beat == 9))
            {
                event_state_switch(0);
                just_spedup = true;
                audio_stop_sound(music_play);
                
                if (array_length(global.frenzy_music_list) > 0)
                {
                    global.frenzy_music = global.frenzy_music_list[speedup_count];
                    music_play = audio_play_sound(global.frenzy_music, 0, true);
                    audio_sound_pitch(music_play, 1);
                }
                else
                {
                    music_play = audio_play_sound(global.frenzy_music, 0, true);
                    audio_sound_pitch(music_play, global.speedup);
                }
                
                audio_emitter_pitch(emitter, global.speedup);
                audio_sound_set_track_position(music_play, music_pos);
                
                with (obj_frenzy_speedup)
                    event_out();
                
                with (obj_map_frenzy_controller)
                {
                    if (other.last_game)
                        event_lastgame_finished();
                    else
                        event_speedup_finished();
                }
            }
            
            break;
        
        case 3:
            break;
    }
};

event_music_beat_double = function()
{
};

state = 0;
state_beat = -1;
enemy_attacks = 2;

event_micro_ended = function()
{
    if (lost)
    {
        win = false;
        event_lose_sound();
    }
    else
    {
        event_win_sound();
    }
    
    with (par_boss)
        event_user(0);
    
    with (obj_map_frenzy_controller)
        win = other.win;
    
    if (((already_lastgamed && !win) || on_last_game) && !instance_exists(par_boss))
    {
        if (win)
            game++;
    }
    else
    {
        game++;
    }
    
    event_state_switch(0);
    state_beat = -1;
    timer_func[2]();
    overlay_in = false;
    
    if (on_last_game && instance_exists(par_boss))
        games_done = true;
    
    if (global.hp == 0)
        games_done = false;
    
    if (games_done)
    {
        with (my_boss)
        {
            games_done = true;
            event_boss();
        }
    }
};

event_micro_win = function()
{
    if (win)
        exit;
    
    if (room != rm_endless)
    {
        if (already_lastgamed || on_last_game)
            games_done = true;
    }
    
    with (obj_map_frenzy_controller)
        event_micro_win();
    
    combo++;
    win = true;
    timer[1] = 2;
};

event_micro_loss = function()
{
    if (lost)
        exit;
    
    global.hp--;
    
    if (global.hp == 0)
        games_done = false;
    
    if (instance_exists(par_boss) && !games_done)
    {
        with (par_boss)
        {
            hp = global.hp + 1;
            event_loseHP();
        }
    }
    
    with (obj_map_frenzy_gui)
    {
        hp = global.hp + 1;
        event_loseHP();
    }
    
    if (global.hp == 0)
    {
        global.game_over = true;
        global.speedup = 1;
    }
    
    if (games_done)
    {
        game_set--;
        games_done = false;
    }
    
    with (obj_map_frenzy_controller)
        event_micro_loss();
    
    if (global.game_over)
    {
        timer[4] = 180;
        
        if (audio_is_playing(music_play))
            audio_stop_sound(music_play);
        
        if (!instance_exists(obj_map_frenzy_controller))
            audio_play_sound(bgm_map_lose_final, 0, 0);
    }
    
    combo = 0;
    win = false;
    lost = true;
    timer[1] = 2;
    
    if (!speedup_next)
    {
        with (par_boss)
            loss = true;
    }
};

win = false;
lost = false;
overlay_alpha = 0;
time = 0;
game = 0;
pattern_ind = 0;
tvstatic = true;
just_spedup = false;
last_game = false;
last_game_choose = undefined;
already_lastgamed = false;
overlay_in = false;
timer[0] = -1;

timer_func[0] = function()
{
    event_user(0);
};

timer[1] = -1;

timer_func[1] = function()
{
    var _ended = true;
    
    if (instance_exists(obj_microgame_controller))
    {
        with (obj_microgame_controller)
        {
            if (!ended)
            {
                _ended = false;
                other.controller_handler = id;
            }
        }
    }
    
    if (_ended)
        event_micro_ended();
    
    if (lost && !games_done)
    {
        if (array_length(global.frenzy_music_list) > 0 && global.hp > 0 && !speedup_next)
        {
            audio_sound_gain(music_play, 0, 150);
            loss_play = audio_play_sound(global.frenzy_music_list_loss[speedup_count], 0, true);
            audio_sound_gain(loss_play, 0.1, 0);
            audio_sound_gain(loss_play, 1, 150);
            audio_sound_set_track_position(loss_play, audio_sound_get_track_position(music_play));
        }
    }
};

timer[2] = time_bpm_to_seconds(140) * 60;

timer_func[2] = function()
{
    event_music_beat();
    timer[2] = time_bpm_to_seconds(140) * 60;
};

timer[3] = -1;

timer_func[3] = function()
{
    if (last_game && !instance_exists(par_boss))
    {
        if (!already_lastgamed)
            event_lastgame();
    }
    else
    {
        event_speedup();
    }
};

timer[4] = -1;

timer_func[4] = function()
{
    instance_create_layer(0, 0, layer, obj_frenzy_gameover);
};

surf_draw = -4;
surf_mask = -4;
draw = true;
microgame_autodraw = false;
microgame_trans = false;
microgame_music = false;
timer[5] = -1;

timer_func[5] = function()
{
};
