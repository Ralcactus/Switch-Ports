instance_create_layer(0, 0, layer, obj_buster_machine);
scr_microgames_list();
games_total = [];

for (var i = 0; i < array_length(games_maps); i++)
    games_total = array_concat(games_total, games_maps[i]);

for (var i = 0; i < array_length(games_bosses); i++)
    games_total = array_concat(games_total, games_bosses[i]);

games_total_list = [];
games_total_list = array_concat(games_total, games_total_list);
games_total = array_shuffle(games_total);

event_create_game = function()
{
    var _choose = games_total[0];
    var _game = microgame_create(960, 540, struct_get(global.microgames_data, _choose), false, false, true, undefined, false);
    scr_microgame_center(_game);
    _game.timer[2] = 60 * time_bpm_to_seconds(140) * 1.95;
    array_delete(games_total, 0, 1);
    
    if (array_length(games_total) == 0)
    {
        games_total = array_concat(games_total, games_total_list);
        games_total = array_shuffle(games_total);
        
        for (var i = 0; i < array_length(games_total); i++)
        {
            if (games_total[i] == _choose)
            {
                array_delete(games_total, i, 1);
                break;
            }
        }
    }
};

event_micro_ended = function()
{
    with (obj_buster_machine)
        event_micro_ended();
};

event_micro_win = function()
{
    with (obj_buster_machine)
        event_micro_win();
};

event_micro_loss = function()
{
    with (obj_buster_machine)
        event_micro_loss();
};
