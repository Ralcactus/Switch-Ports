for (var i = 0; i < 3; i++)
    shake[i] = approach(shake[i], 0, 0.15);

if (!ready)
    exit;

if (!controller.win && !controller.ended)
{
    var _xAxis = input_check_pressed("right_strict", player) - input_check_pressed("left_strict", player);
    
    if (_xAxis != 0)
    {
        index[row] += _xAxis;
        
        if (index[row] > (sprite_get_number(spr[row]) - 1))
            index[row] = 0;
        
        if (index[row] < 0)
            index[row] = sprite_get_number(spr[row]) - 1;
        
        shake[row] = 1;
        
        if (_xAxis == 1)
            arrow_rightoff = 15;
        else
            arrow_leftoff = 15;
        
        if (audio_is_playing(snd_Bu_coin_step))
            audio_stop_sound(snd_Bu_coin_step);
        
        audio_play_sound_on(controller.audio, snd_Bu_coin_step, 0, 0);
    }
    
    var _yAxis = input_check_pressed("down_strict", player) - input_check_pressed("up_strict", player);
    
    if (input_check_pressed("jump", player))
        _yAxis = 1;
    
    if (_yAxis != 0 && !(_yAxis == 1 && row == 2) && !(_yAxis == -1 && row == 0))
    {
        arrow_leftoff = 0;
        arrow_rightoff = 0;
        row += _yAxis;
        
        if (row < 0)
            row = 2;
        
        if (row > 2)
            row = 0;
    }
}

arrow_rightoff = approach(arrow_rightoff, 0, 3);
arrow_leftoff = approach(arrow_leftoff, 0, 3);
