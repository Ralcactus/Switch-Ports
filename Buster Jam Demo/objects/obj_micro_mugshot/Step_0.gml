timer_logic(0);
timer_logic(1);
timer_logic(2);

if (!ready)
    exit;

wanted_alpha = approach(wanted_alpha, 0, 0.1);
xoff = use_curve(acurv_mugshot, percent, undefined, xoff_start, xoff_to);
percent = approach(percent, 1, 0.028);

if (percent == 1 && timer[0] == -1)
    timer[0] = 20;

var _time = 7;

if (snap_state != 0)
    _time = -4;

if (_time != -4 && controller.timer[0] <= (60 * time_bpm_to_seconds(140) * _time))
    controller.timer_alpha_override = 1;

if (input_check_pressed("jump", player) && snap_state == 0 && !controller.ended)
{
    audio_play_sound(snd_micro_mugshot_shutter, 0, 0);
    var _gotem = false;
    
    with (obj_micro_mugshot_char)
    {
        if (sprite_index == other.target && inside && ID == other.ID)
            _gotem = true;
    }
    
    controller.win = _gotem;
    
    if (controller.timer[0] > (time_bpm_to_seconds(140) * 60 * 7))
    {
        with (controller)
            event_round_time(5);
    }
    
    snap_state = 1;
    timer[1] = 25;
}

if (snap_state == 1)
    flash = approach(flash, 1, 0.25);
else if (snap_state == 2)
    flash = approach(flash, 0, 0.08);
