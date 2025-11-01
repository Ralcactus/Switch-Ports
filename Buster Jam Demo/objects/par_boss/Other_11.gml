testvariablenothing = false;
games_total = [];

for (var i = 0; i < array_length(games); i++)
    games_total = array_concat(games_total, games[i]);

var _inst = instance_create_layer(0, 0, "GUI", obj_frenzy);
_inst.my_boss = id;
_inst.speedups = speedups;
_inst.state_beat -= 7;

for (var i = 0; i < array_length(games); i++)
{
    _inst.games[i] = [];
    array_copy(_inst.games[i], 0, games[i], 0, array_length(games[i]));
}

_inst.games_total = [];
array_copy(_inst.games_total, 0, games_total, 0, array_length(games_total));
