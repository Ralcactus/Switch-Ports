time++;

if (time == 2)
{
    if (played_ending)
        exit;
    
    if (trans_percent < 1)
    {
        time = 1;
        exit;
    }
    
    gui = "begin";
    
    if (made_game)
    {
        bomb_hspd = -14;
        bomb_vspd = -24;
        bomb_grav = 1;
        bomb_sorted = true;
    }
    
    if (!started)
    {
        timer_ready = false;
        timer[3] = 90;
    }
}
else if (time == 5)
{
    if (games_done && !played_ending)
    {
        played_ending = true;
        event_user(3);
    }
    else
    {
        gui = "end";
        belt_animate = true;
        buster_sprite = spr_tutorial_trans_buster_pull;
        buster_ind = 0;
        timer[0] = time_bpm_to_seconds(bpm) * 0.3;
    }
}
else if (time == 7)
{
    if (played_ending)
        exit;
    
    var _choose;
    
    if (started)
    {
        _choose = games[0];
        array_delete(games, 0, 1);
        
        if (array_length(games) == 0)
            games_done = true;
    }
    else if (state == 1)
    {
        _choose = "avoid";
    }
    else if (state == 2)
    {
        _choose = "smash";
    }
    else if (state == 3)
    {
        _choose = "superhero";
    }
    
    var _game = microgame_create(960, 540, struct_get(global.microgames_data, _choose), false, undefined, false, undefined, false);
    scr_microgame_center(_game);
    pattern_ind = random_range(0, sprite_get_number(spr_frenzy_pattern) - 1);
}
