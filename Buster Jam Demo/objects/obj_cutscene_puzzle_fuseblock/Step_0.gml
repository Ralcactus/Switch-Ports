event_inherited();

for (var i = 0; i < array_length(array_timers); i++)
{
    var _time = array_timers[i][0];
    var _func = array_timers[i][1];
    
    if (_time > -1)
        array_timers[i][0] -= global.delta_game_factor;
    
    if (array_timers[i][0] <= 0)
    {
        _func();
        array_delete(array_timers, i, 1);
    }
}
