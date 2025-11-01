var i = leaderboard_selected;

for (var ii = 0; ii < array_length(pfps_loaded[i]); ii++)
{
    if (sprite_exists(pfps_loaded[i][ii]))
        sprite_delete(pfps_loaded[i][ii]);
}

if (leaderboard_selected == leader_100)
{
    scores_request_id = steam_download_scores("endless_demo", 1, 100);
}
else if (leaderboard_selected == leader_global)
{
    var _str;
    
    if (keyboard_check(vk_space) && global.debug)
        _str = "endless_demo1";
    else
        _str = "endless_demo";
    
    scores_request_id = steam_download_scores_around_user(_str, -50, 50);
}

if (leaderboard_selected == leader_friends)
    scores_request_id = steam_download_friends_scores("endless_demo");
