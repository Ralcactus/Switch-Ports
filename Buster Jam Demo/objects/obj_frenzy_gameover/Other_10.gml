testvariablenothing = false;
time += global.delta_game_factor;
var _yAxis = input_check_pressed("right_menu") - input_check_pressed("left_menu");

if (_yAxis != 0 && ready)
{
    selected += _yAxis;
    
    if (selected < 0)
        selected = array_length(options[menu]) - 1;
    
    if (selected > (array_length(options[menu]) - 1))
        selected = 0;
    
    menu_scale[selected] = 0.925;
    audio_stop_play(snd_menu_blip, 0, 0);
}

for (var i = 0; i < array_length(menu_scale); i++)
    menu_scale[i] = easy_smooth(menu_scale[i], 1, 3.5);

if (ready && input_check_pressed("menu_confirm"))
{
    menu_scale[selected] = 0.85;
    go_sound = snd_menu_go;
    options_func[menu][selected]();
    input_verb_consume("menu_confirm");
    
    if (go_sound != undefined)
        audio_stop_play(go_sound, 0, 0);
}

var _xAxis = input_check_pressed("right_menu") - input_check_pressed("left_menu");

if (_xAxis != 0)
{
    var _amnt = 0.1;
    
    if (menu == 3 && selected == 0)
    {
        global.master_vol += (_amnt * _xAxis);
        global.master_vol = clamp(global.master_vol, 0, 1);
        
        with (obj_persistent)
            event_user(0);
    }
    else if (menu == 3 && selected == 1)
    {
        global.bgm_vol += (_amnt * _xAxis);
        global.bgm_vol = clamp(global.bgm_vol, 0, 1);
        
        with (obj_persistent)
            event_user(0);
    }
    else if (menu == 3 && selected == 2)
    {
        global.sfx_vol += (_amnt * _xAxis);
        global.sfx_vol = clamp(global.sfx_vol, 0, 1);
        
        with (obj_persistent)
            event_user(0);
    }
}
