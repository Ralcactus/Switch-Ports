scr_microgames_list();
games_total = [];

for (var i = 0; i < array_length(games_maps); i++)
    games_total = array_concat(games_total, games_maps[i]);

for (var i = 0; i < array_length(games_bosses); i++)
    games_total = array_concat(games_total, games_bosses[i]);

games_total_list = [];
games_total_list = array_concat(games_total, games_total_list);
games_total = array_shuffle(games_total);
games[0] = games_total;
games[0] = ["jetpack_smash", "demoswing", "washdog", "baby_rattle"];
speedups = [[6, 0.14285714285714285], [12, 0.07142857142857142], [18, 0.07142857142857142], [24, 0.03571428571428571], [30, 0.03571428571428571], [36, 0.03571428571428571], [42, 0.03571428571428571], [48, 0.03571428571428571], [54, 0.03571428571428571], [60, 0.03571428571428571], [70, 0.03571428571428571], [85, 0.03571428571428571], [100, 0.03571428571428571], [200, 0.07142857142857142]];

event_restart = function()
{
    games[0] = [];
    games[0] = array_concat(games[0], games_total_list);
    
    for (var i = 0; i < array_length(games[0]); i++)
    {
        if (games[0][i] == remove_game)
        {
            array_delete(games[0], i, 1);
            break;
        }
    }
    
    games[0] = array_shuffle(games[0]);
    
    with (obj_frenzy)
        games[0] = other.games[0];
};
