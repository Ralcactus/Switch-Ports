page = 0;
leader_100 = 0;
leader_global = 1;
leader_friends = 2;
scores[0] = undefined;
scores[1] = undefined;
scores[2] = undefined;
pfp[0] = [];
pfp[1] = [];
pfp[2] = [];
leaderboard_selected = leader_100;
timer[0] = -1;

timer_func[0] = function()
{
    score_upload = real(get_integer("", ""));
    upload_ID = steam_upload_score("endless_demo", score_upload);
    
    if (!upload_ID)
        timer[0] = 2;
};

scores_request_id = undefined;
scroll_y = 0;
scroll_yTo = scroll_y;
