if (controller.ended && !controller.win)
    exit;

if (!ready)
    exit;

physics_apply_2d_micro();
anim_logic();

if (input_source_using(__input_global().__source_keyboard, player))
{
    xAxis = input_check("right", player) - input_check("left", player);
    yAxis = input_check("down", player) - input_check("up", player);
}
else
{
    xAxis = input_value("right_free", player) - input_value("left_free", player);
    yAxis = input_value("down_free", player) - input_value("up_free", player);
}

if (spinning)
    xAxis = dash_dir;

var hspd_to, vspd_to, _moving;

if (abs(xAxis) <= 0.1 && abs(yAxis) <= 0.1)
{
    hspd_to = 0;
    vspd_to = 0;
    _moving = false;
}
else
{
    _moving = true;
    var _dir = point_direction(x, y, x + xAxis, y + yAxis);
    var _movespd = movespd;
    hspd_to = lengthdir_x(_movespd, _dir);
    vspd_to = lengthdir_y(_movespd, _dir);
}

if (spinning)
    hspd = dash_dir * (movespd + dash_spd);
else
    hspd = approach(hspd, hspd_to, acc);

vspd = approach(vspd, vspd_to, acc);

if (xAxis != 0 && _moving)
    facing = sign(xAxis);

if (input_check_pressed("jump") && !spinning)
{
    spinning = true;
    audio_sound_gain(my_idle_snd, 0, 0);
    audio_sound_gain(my_idle_snd, idle_snd_gain, 1000);
    var _snd = audio_play_sound_on(controller.audio, snd_micro_jetpack_burst, false, 0);
    audio_sound_pitch(_snd, choose(0.95, 1, 1.05));
    timer[0] = spin_time;
    
    if (xAxis != 0)
        dash_dir = sign(xAxis);
    else
        dash_dir = facing;
    
    dash_spd = dash_spd_boost;
}

dash_spd = approach(dash_spd, 0, dash_spd_boost / spin_time);
timer_logic(0);
