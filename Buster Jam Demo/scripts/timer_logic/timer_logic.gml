function timer_logic(arg0, arg1 = false)
{
    var _timer = timer[arg0];
    var _amnt;
    
    if (arg1)
        _amnt = global.delta_real_factor;
    else
        _amnt = global.delta_game_factor;
    
    if (timer[arg0] > -1)
        timer[arg0] -= _amnt;
    
    if (_timer > 0 && timer[arg0] <= 0)
    {
        timer[arg0] = -1;
        timer_func[arg0]();
    }
}
