function gamepadvibrate(_strength, _pan, _duration, _playerindex = 0, _force = false)
{
    if (global.rumble)
        input_vibrate_constant(_strength, _pan, _duration, _playerindex, _force);
}

function create_key(_key)
{
    return 
    {
        key: _key
    };
}

function apply_inputglobals()
{
    input_axis_threshold_set(gp_axislh, global.horizdeadzone, 1);
    input_axis_threshold_set(gp_axisrh, global.horizdeadzone, 1);
    input_axis_threshold_set(gp_axislv, global.vertdeadzone, 1);
    input_axis_threshold_set(gp_axisrv, global.vertdeadzone, 1);
}
