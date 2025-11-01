testvariablenothing = false;
time += global.delta_game_factor;

for (var i = 0; i < array_length(menu_scale); i++)
    menu_scale[i] = easy_smooth(menu_scale[i], 1, 3.5);

if (deac)
    exit;

var _yAxis = input_check_pressed("down_menu") - input_check_pressed("up_menu");

if (_yAxis != 0 && ready)
{
    selected += _yAxis;
    
    if (selected < 0)
        selected = array_length(options[menu]) - 1;
    
    if (selected > (array_length(options[menu]) - 1))
        selected = 0;
    
    menu_scale[selected] = 1.1;
    audio_stop_play(snd_menu_blip, 0, 0);
}

if (ready && input_check_pressed("menu_confirm"))
{
    go_sound = snd_menu_go;
    options_func[menu][selected]();
    input_verb_consume("menu_confirm");
    audio_stop_play(go_sound, 0, 0);
}

if (input_check_pressed("cancel"))
{
    selected = array_length(options[menu]) - 1;
    audio_stop_play(snd_menu_blip, 0, 0);
    menu_scale[selected] = 1.1;
}
