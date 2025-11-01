if (input_check_pressed("jump"))
    event_load_leaderboard();

var _xAxis;

if (deac)
    _xAxis = 0;
else
    _xAxis = input_check_pressed("right_menu") - input_check_pressed("left_menu");

if (_xAxis != 0)
{
    leaderboard_selected += _xAxis;
    
    if (leaderboard_selected > 2)
        leaderboard_selected = 0;
    
    if (leaderboard_selected < 0)
        leaderboard_selected = 2;
    
    if (scores[leaderboard_selected] == undefined && !board_failed[leaderboard_selected])
        event_load_leaderboard();
}
