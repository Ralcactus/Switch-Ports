pattern_move = 0;
pattern_ind = 0;
global.frenzy_music = bgm_tutorial_frenzy;
surf_trans = -4;
music_play = audio_play_sound(bgm_tutorial, 0, true);
music_play_action = audio_play_sound(bgm_tutorial_action, 0, true);
audio_sound_gain(music_play_action, 0, 0);
bpm = 140;
beats = 0;
started = false;
gui = "begin";
state = 0;
time = 0;

event_music_beat = function()
{
    if (buster_sprite == spr_tutorial_trans_buster_idle)
        buster_ind = 0;
    
    buster_xscale = 1.05;
    buster_yscale = 0.95;
    machine_xscale = 1.025;
    machine_yscale = 0.985;
    
    if (timer_ready || started)
        event_user(0);
};

event_music_beat_double = function()
{
    event_music_beat();
};

timer[0] = -1;

timer_func[0] = function()
{
    event_reset_bomb();
};

timer[1] = 60;

timer_func[1] = function()
{
    scene_create("Dialogue/tutorial/tutorial.json");
};

timer[2] = -1;

timer_func[2] = function()
{
    timer_ready = true;
};

timer_ready = false;
timer[3] = -1;

timer_func[3] = function()
{
    var _start;
    
    if (win)
    {
        _start = 3;
        
        if (state == 2)
            _start = 5;
        else if (state == 3)
            _start = 7;
    }
    else if (losses == 1)
    {
        _start = choose(20, 27);
    }
    else if (losses == 2)
    {
        _start = 21;
    }
    else if (losses == 3)
    {
        _start = 22;
    }
    else if (losses == 4)
    {
        _start = 23;
    }
    else if (losses == 5)
    {
        _start = 24;
    }
    else if (losses == 6)
    {
        _start = 25;
    }
    else if (losses >= 7 && losses <= 9)
    {
        _start = irandom_range(23, 25);
    }
    else if (losses == 10)
    {
        _start = 29;
    }
    else
    {
        _start = 31;
    }
    
    scene_create("Dialogue/tutorial/tutorial.json", _start);
};

timer[4] = -1;

timer_func[4] = function()
{
    event_user(0);
};

timer[5] = -1;

timer_func[5] = function()
{
    ending_fade = true;
};

ending_fade = false;
ending_fade_alpha = 0;
played_ending = false;

event_micro_loss = function()
{
    event_micro_ended();
    state = last_state;
    win = false;
};

event_micro_win = function()
{
    event_micro_ended();
    win = true;
    losses = 0;
};

losses = 0;
win = false;
last_state = state;

event_micro_ended = function()
{
    if (!started)
    {
        audio_sound_gain(music_play_action, 0, 400);
        audio_sound_gain(music_play, 1, 400);
        timer[4] = time_bpm_to_seconds(140) * 60;
    }
    
    time = 1;
    zoom_in = false;
    trans_percent = 0;
};

games = ["avoid", "smash", "firework", "superhero", "food_catch", "defuse", "skate", "dodge"];
games = array_shuffle(games);
games_done = false;
