testvariablenothing = false;
time += global.delta_game_factor;

for (var i = 0; i < 3; i++)
{
    if (leaderboard_selected == i)
    {
        var _yAxis;
        
        if (deac || array_length(scores[leaderboard_selected]) <= board_scroll_min)
            _yAxis = 0;
        else
            _yAxis = input_check("down_menu") - input_check("up_menu");
        
        scroll_yto[i] -= _yAxis * 25;
        
        if (deac || array_length(scores[leaderboard_selected]) <= board_scroll_min)
            _yAxis = 0;
        else
            _yAxis = mouse_wheel_down() - mouse_wheel_up();
        
        scroll_yto[i] -= _yAxis * 25 * 5;
    }
    
    if (scroll_yto[i] > 0)
        scroll_yto[i] = 0;
    
    if (scroll_yto[i] < (-scroll_max[i] - scroll_yoff))
        scroll_yto[i] = -scroll_max[i] - scroll_yoff;
    
    scroll_y[i] = easy_smooth(scroll_y[i], scroll_yto[i], 4);
    
    if (array_length(scores[i]) <= board_scroll_min)
    {
        scroll_y[i] = 0;
        scroll_yto[i] = 0;
    }
}

if (!deac && input_check_pressed("menu_extra"))
{
    instance_create_layer(0, 0, layer, obj_pfp_picker);
    deac = true;
}

if (loading && !created_popup_fail)
{
    print(loading_count);
    loading_count += global.delta_game_factor;
    
    if (loading_count >= 360)
    {
        created_popup_fail = true;
        var _inst = instance_create_layer(0, 0, layer, obj_network_getstats);
        
        with (_inst)
            event_user(2);
        
        _inst.event_fail = function()
        {
            with (obj_leaderboard)
                instance_destroy();
            
            with (obj_title_menu)
                ready = true;
            
            with (obj_frenzy_gameover)
                ready = true;
        };
    }
}

if (!deac)
    event_user(0);

timer_logic(0);
timer_logic(1);

if (!deac && input_check_pressed("cancel"))
{
    input_verb_consume("cancel");
    
    if (room == rm_title)
    {
        instance_destroy();
        
        with (obj_title_menu)
            ready = true;
    }
    else if (room == rm_leaderboards)
    {
        room_goto(rm_title);
    }
    else
    {
        instance_destroy();
        
        with (obj_frenzy_gameover)
            ready = true;
        
        with (obj_leaderboard_bg)
            instance_destroy();
    }
}
