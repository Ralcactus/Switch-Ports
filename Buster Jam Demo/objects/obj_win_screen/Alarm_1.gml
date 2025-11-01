testvariablenothing = false;
ready = true;

if (global.room_last == rm_boomtown_boss_macro_win)
    boss = true;
else
    boss = false;

var _bgm;

if (boss)
{
    _bgm = bgm_results_boss;
    
    with (par_results_character)
        instance_destroy();
    
    with (obj_win_screen_bg)
        instance_destroy();
    
    with (obj_frenzy_pattern)
        instance_destroy();
    
    instance_create_layer(0, 0, "Instances_1", obj_results_knives);
    texture_prefetch("tg_results_knives");
    zoom = 0.4;
    nice_one_col = 255;
    global.frenzy_nextroom = rm_demo_credits;
}
else
{
    _bgm = bgm_results;
}

global.bgm_play = audio_play_sound(_bgm, 0, true);
hp_count_max = global.hp_max;
hp_count = 0;
timer[0] = -1;

timer_func[0] = function()
{
    with (obj_win_screen_hp)
        in = true;
    
    timer[1] = 90;
};

timer[1] = -1;

timer_func[1] = function()
{
    with (obj_win_screen_hp)
    {
        if (ID == other.hp_count)
            event_user(0);
    }
    
    hp_count++;
    
    if (hp_count < hp_count_max)
        timer[1] = 30;
};

timer[2] = -1;

timer_func[2] = function()
{
    finished = true;
};

timer[3] = -1;

timer_func[3] = function()
{
    timer[0] = 30;
};

timer[4] = 72;

timer_func[4] = function()
{
    with (obj_win_screen_niceone)
    {
        in = true;
        percent = 0;
    }
    
    timer[5] = 120;
};

timer[5] = -1;

timer_func[5] = function()
{
    with (obj_win_screen_niceone)
    {
        in = false;
        percent = 0;
    }
    
    timer[0] = 30;
};

if (!boss)
{
    with (par_results_character)
        ready = false;
    
    ready = false;
    timer[6] = (time_bpm_to_seconds(120) * 60) + 3;
    timer[4] = 72;
}

if (instance_exists(obj_transition_fade))
    instance_destroy(obj_transition_fade);

event_last_hp = function()
{
    timer[2] = 70;
};

finished = false;
alarm[0] = 1;
