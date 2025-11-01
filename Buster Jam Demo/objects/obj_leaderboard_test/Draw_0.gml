var _str;

if (leaderboard_selected == leader_100)
    _str = "Top 100";
else if (leaderboard_selected == leader_global)
    _str = "Global";
else
    _str = "Friends";

draw_text(10, 10, string("Leaderboard: {0} ({1}/3)", _str, leaderboard_selected + 1));
var _board = scores[leaderboard_selected];

if (is_array(_board))
{
    var _sep = 28;
    var _x = 10;
    var _y = 100 + scroll_y;
    
    for (var i = 0; i < array_length(_board); i++)
    {
        if (_board[i].userID == global.steam_userID)
            draw_set_color(c_yellow);
        
        draw_text(_x, _y + (i * _sep), string("{0}.", i + 1));
        draw_text(_x + string_width("000. tallglassgamesbuster..."), _y + (i * _sep), _board[i].score);
        draw_text(_x + string_width("000. "), _y + (i * _sep), _board[i].name);
        
        if (is_struct(pfp[leaderboard_selected][i]))
            draw_sprite(pfp[leaderboard_selected][i].spr, 0, _x, _y + (i * _sep));
        
        draw_set_color(c_white);
    }
}
