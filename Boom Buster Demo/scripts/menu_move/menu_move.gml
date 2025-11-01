function menu_move(arg0, arg1 = global.input[0])
{
    var _yAxis = arg1.pressed[3] - arg1.pressed[2];
    
    if (_yAxis != 0)
    {
        audio_play_sound(snd_nab, 0, 0);
        selected_option += _yAxis;
        
        if (selected_option > (array_length(arg0.options) - 1))
            selected_option = 0;
        
        if (selected_option < 0)
            selected_option = array_length(arg0.options) - 1;
    }
    
    if (arg1.pressed[4])
    {
        audio_play_sound(snd_thunk, 0, 0);
        arg0.functions[selected_option]();
        input_clear(arg1, 4);
    }
}
