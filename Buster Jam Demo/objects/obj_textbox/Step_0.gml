if (!ready)
    exit;

if (finished)
{
    alpha = approach(alpha, 0, 0.08);
    
    if (alpha <= 0)
        instance_destroy();
}

percent = approach(percent, 1, 0.05);

if (percent >= 1)
    ready = true;

scale = use_curve(acurv_textbox, percent, undefined, 0.2, 1);

if (percent < 1)
    exit;

time += (0.1 * global.delta_game_factor);

if (!pause)
    type_index = approach(type_index, array_length(chr_total) - 1, text_spd);
else
    pause = approach(pause, 0, 1);

if (!done && accept_inputs)
{
    var _pressed;
    
    if (auto)
        _pressed = auto_done;
    else
        _pressed = input_check_pressed("jump");
    
    if (type_index == string_length(text) && _pressed)
    {
        done = true;
        
        with (obj_scene_manager)
            event_next();
    }
    else if (type_index < string_length(text) && input_check_pressed("action") && !auto && skippable)
    {
        type_index = string_length(text);
        text_ended = true;
    }
}

if (auto && type_index == string_length(text) && timer[0] == -1)
    timer[0] = auto_delay;

timer_logic(0);
timer_logic(1);
