testvariablenothing = false;
pfp_select_scale_effect = easy_smooth(pfp_select_scale_effect, 0, 2);
var _loop = 0.98 + (dsin(current_time * 0.5) * 0.02);
pfp_select_scale = pfp_select_scale_effect + _loop;

if (deac)
    exit;

if (input_check_pressed("cancel"))
{
    with (obj_leaderboard)
        deac = false;
    
    instance_destroy();
    exit;
}

var _xAxis = input_check_pressed("right_menu") - input_check_pressed("left_menu");
var _yAxis = input_check_pressed("down_menu") - input_check_pressed("up_menu");
var _selected = selected;

if (_xAxis != 0)
{
    if ((_selected == -1 || _selected == 3) && _xAxis < 0)
        selected += 3;
    else if ((_selected == 2 || _selected == 6) && _xAxis > 0)
        selected -= 3;
    else
        selected += _xAxis;
}
else if (_yAxis != 0)
{
    _selected = selected;
    
    if (_selected <= 2 && _yAxis < 0)
        selected += 4;
    else if (_selected >= 3 && _yAxis > 0)
        selected -= 4;
    else
        selected += (_yAxis * 4);
}

if (selected < -1)
    selected = -1;

if (selected > (sprite_get_number(spr_pfp) - 1))
    selected = sprite_get_number(spr_pfp) - 1;

if (selected != _selected)
{
    pfp_select_scale_effect = -0.15;
    var _snd = audio_play_sound(snd_Bu_coin_step, 0, 0);
    audio_sound_pitch(_snd, 1);
}

if (input_check_pressed("menu_confirm"))
{
    pfp_select_scale_effect = -0.25;
    global.stats_pfp = selected;
    global.stats_pfp_uploaded = false;
    var _snd = audio_stop_play(snd_menu_go, 0, 0);
    audio_sound_pitch(_snd, 1.2);
    flash_alpha = 0.95;
    flash_scale = 1;
    
    with (obj_persistent)
        event_save_user();
}

flash_scale += 0.01;
flash_alpha = approach(flash_alpha, 0, 0.08);
