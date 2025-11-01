if (keyboard_check_pressed(ord("U")))
    timer_func[0]();

if (keyboard_check_pressed(ord("R")))
{
    if (leaderboard_selected == leader_100)
    {
        scores_request_id = steam_download_scores("endless_demo", 1, 100);
        print(string("downloading top_100 scores... {0}", scores_request_id));
    }
    else if (leaderboard_selected == leader_global)
    {
        scores_request_id = steam_download_scores_around_user("endless_demo", -50, 50);
        print(string("downloading global scores... {0}", scores_request_id));
    }
    
    if (leaderboard_selected == leader_friends)
    {
        scores_request_id = steam_download_friends_scores("endless_demo");
        print(string("downloading friends scores... {0}", scores_request_id));
    }
}

var _xAxis = input_check_pressed("right") - input_check_pressed("left");

if (_xAxis != 0)
{
    leaderboard_selected += _xAxis;
    
    if (leaderboard_selected > 2)
        leaderboard_selected = 0;
    
    if (leaderboard_selected < 0)
        leaderboard_selected = 2;
    
    scroll_y = 0;
    scroll_yTo = 0;
}

var _yAxis = input_check("down") - input_check("up");

if (_yAxis != 0)
    scroll_yTo -= (_yAxis * 10);

scroll_y = easy_smooth(scroll_y, scroll_yTo, 2);
timer_logic(0);
