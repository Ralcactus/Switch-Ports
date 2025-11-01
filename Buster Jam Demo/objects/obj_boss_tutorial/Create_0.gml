bpm = 140;
beats = 0;
music_play = audio_play_sound(bgm_tutorial, 0, true);
music_play_action = audio_play_sound(bgm_tutorial_action, 0, true);
music_frenzy = -4;
audio_sound_gain(music_play_action, 0, 0);

event_music_beat = function()
{
    if (play_ready)
    {
        with (obj_buster_machine)
            event_user(0);
    }
};

event_music_beat_double = function()
{
};

frenzy_started = false;
global.frenzy_music = bgm_tutorial_frenzy;
global.frenzy_music_list = [];
timer[0] = 60;

timer_func[0] = function()
{
    scene_create("Dialogue/tutorial/tutorial.json");
};

timer[1] = -1;

timer_func[1] = function()
{
    play_ready = true;
};

timer[2] = -1;

timer_func[2] = function()
{
    event_user(1);
};

timer[3] = -1;

timer_func[3] = function()
{
    frenzy_started = true;
};

play_ready = false;
win = false;

event_micro_ended = function()
{
    if (frenzy_started)
    {
        game++;
        
        if (last_game)
            show_message("YOU WIN!");
    }
    
    with (obj_buster_machine)
        event_micro_ended();
};

event_micro_win = function()
{
    losses = 0;
    win = true;
    event_micro_ended();
};

event_micro_loss = function()
{
    losses++;
    win = false;
    state--;
    event_micro_ended();
};

losses = 0;
state = 0;
last_state = state;
scr_microgames_list();
games = games_bosses[list_bosses_tutorial];
game = 0;
last_game = false;

event_create_game = function()
{
    var _choose;
    
    if (!frenzy_started)
    {
        if (state == 1)
            _choose = "avoid";
        else if (state == 2)
            _choose = "defuse";
        else if (state == 3)
            _choose = "dodge";
    }
    else
    {
        _choose = games[0];
    }
    
    var _game = microgame_create(960, 540, struct_get(global.microgames_data, _choose), false, undefined, false, undefined, false);
    scr_microgame_center(_game);
    _game.timer[2] = 60 * time_bpm_to_seconds(140) * 1.95;
    
    if (frenzy_started)
    {
        array_delete(games, 0, 1);
        
        if (array_length(games) == 0)
            last_game = true;
    }
};
