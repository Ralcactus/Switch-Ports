testvariablenothing = false;
print("should create game");
win = false;
lost = false;
played_win_sound = false;
played_lose_sound = false;
var _choose;

if (last_game_choose != undefined)
{
    _choose = last_game_choose;
}
else
{
    var _index = irandom_range(0, array_length(games[game_set]) - 1);
    _choose = games[game_set][_index];
    array_delete(games[game_set], _index, 1);
    
    if (array_length(games[game_set]) == 0 && my_boss != -4)
    {
        if (room == rm_endless)
        {
            game_set = 0;
            
            with (obj_map_frenzy_controller)
            {
                remove_game = _choose;
                event_restart();
            }
        }
        else
        {
            game_set++;
            
            if (game_set > (array_length(games) - 1))
            {
                games_done = true;
                on_last_game = true;
                last_game_choose = _choose;
            }
        }
    }
}

var _inst;

if (global.multiplayer)
{
    for (var i = 0; i < 2; i++)
    {
        _inst = microgame_create(960, 540, string("Microgames/{0}.json", _choose), false, undefined, false, microgame_autodraw);
        scr_microgame_center(_inst);
        _inst.scale = 0.59;
        _inst.yscale = 1.18;
        var _sep = 483;
        
        if (i == 0)
            _inst.x -= _sep;
        else
            _inst.x += _sep;
        
        _inst.xstart = _inst.x;
        _inst.player = i;
    }
}
else
{
    var _game, _fun;
    
    if (is_array(_choose))
    {
        _game = struct_get(global.microgames_data, _choose[0]);
        _fun = _choose[1];
    }
    else
    {
        _game = struct_get(global.microgames_data, _choose);
        _fun = undefined;
    }
    
    _inst = microgame_create(960, 540, _game, false, microgame_trans, microgame_music, microgame_autodraw, false, _fun);
    scr_microgame_center(_inst);
}

controller_handler = _inst;

with (par_boss)
{
    last_game = _inst;
    loss = false;
    event_user(2);
}

with (obj_map_frenzy_controller)
{
    last_game = _inst;
    event_user(1);
}

just_spedup = false;
speedup_next = false;
game++;
event_check_speedup();
game--;
