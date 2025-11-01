time_bg += (4 * global.delta_game_factor);
timer_logic(0);
timer_logic(1);
timer_logic(2);
timer_logic(3);
ball_ind += ((sprite_get_speed(ball_sprite) / 60) * global.delta_game_factor);

if (!draw_dialogue)
    exit;

time += (0.1 * global.delta_game_factor);

if (!pause)
    type_index = approach(type_index, string_length(text), text_spd);

pause = approach(pause, 0, 1);

if (controller.ended || chose != -4)
    exit;

var _xAxis = input_check_pressed("right", player) - input_check_pressed("left", player);

if (_xAxis != 0)
{
    audio_play_sound_on(controller.audio, snd_Bu_coin_step, 0, 0);
    selected = !selected;
}

if (input_check_pressed("jump", player))
{
    with (controller)
        event_round_time(5, true);
    
    chose = selected;
    audio_play_sound_on(controller.audio, snd_Bu_coin_step, 0, 0);
    
    if (chose == attack)
    {
        with (controller)
            event_set_time(5.5, true);
        
        var _ind = choose(0, 1);
        scr_micro_win();
        
        if (_ind == 0)
            text = "* You defeated Ball. Good stuff! You Win!";
        else if (_ind == 1)
            text = "* You MURDERED Ball. Not really. You Win!";
        
        ball_sprite = spr_micro_ballbattle_ball_slaughtered;
        ball_ind = 0;
        timer_func[1]();
    }
    else
    {
        var _ind = choose(0, 1);
        
        if (_ind == 0)
            text = "* You gave up on life. You Lose!";
        else
            text = "* You self-terminated. You Lose!";
        
        ball_sprite = spr_micro_ballbattle_ball_evil;
        ball_ind = 0;
    }
    
    scr_dialogue_reset(text);
    blip = [[snd_micro_ballbattle_textblip]];
}
