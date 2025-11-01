testvariablenothing = false;
timer_logic(0, true);

if (deac)
    exit;

var _max = array_length(options) - 1;
var _yAxis = input_check_pressed("down_menu") - input_check_pressed("up_menu");

if (_yAxis != 0)
{
    selected += _yAxis;
    
    if (selected < 0)
        selected = _max;
    
    if (selected > _max)
        selected = 0;
}

if (input_check_pressed("menu_confirm"))
{
    if (selected == 0)
    {
        unpaused = true;
        text = count;
        timer[0] = 40;
    }
    else if (selected == 1)
    {
        instance_create_layer(0, 0, layer, obj_options);
    }
    else if (selected == 2)
    {
        scr_unload_ag_boss();
        
        if (audio_group_is_loaded(bgm_frenzy_gameover))
            audio_group_unload(bgm_frenzy_gameover);
        
        audio_stop_all();
        room_goto_fade(rm_title_load, 90);
    }
    
    deac = true;
}
