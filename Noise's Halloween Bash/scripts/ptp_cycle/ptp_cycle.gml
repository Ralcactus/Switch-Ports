global.game_cycleF = 0;
global.game_cycleMS = 0;

function reset_cycle()
{
    global.game_cycleF = 0;
    global.game_cycleMS = 0;
}

function update_cycle()
{
    global.game_cycleMS += 16.666666666666668;
    global.game_cycleF++;
}

function get_cycle(_val, _add_fval = 0)
{
    return (global.game_cycleF + _add_fval) % _val;
}

function get_cycle_region(_val, _sub, _min, _max)
{
    return clamp(_val - _sub, _min, _max);
}
