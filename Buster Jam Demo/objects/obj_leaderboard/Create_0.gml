testvariablenothing = false;
created_popup_fail = false;
board_scroll_min = 5;
fake_entry_count = 0;
instance_create_layer(0, 0, layer, obj_leaderboard_bg);
time = 0;
surf = -4;
scroll_yoff = 40;
loading_angle = 0;
deac = false;

for (var i = 0; i < 3; i++)
{
    scroll_y[i] = 0;
    scroll_yto[i] = scroll_y[i];
    scroll_max[i] = 0;
    scroll_jump[i] = false;
    scroll_max_defined[i] = false;
    pfps_loaded[i] = [];
    board_failed[i] = false;
    board_ready[i] = false;
}

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
scores_request_id = undefined;
loaded = false;
opening = true;
timer[0] = -1;

timer_func[0] = function()
{
    event_user(1);
};

timer[1] = -1;

timer_func[1] = function()
{
    loaded = true;
    board_ready[leaderboard_selected] = true;
    deac = false;
};

event_load_leaderboard = function(arg0 = 10)
{
    scroll_max_defined[leaderboard_selected] = false;
    scroll_y[leaderboard_selected] = 0;
    scroll_yto[leaderboard_selected] = 0;
    loaded = false;
    timer[0] = arg0;
    board_ready[leaderboard_selected] = false;
    loading = true;
    loading_count = 0;
    board_failed[leaderboard_selected] = false;
    deac = true;
};

event_load_leaderboard(10);
