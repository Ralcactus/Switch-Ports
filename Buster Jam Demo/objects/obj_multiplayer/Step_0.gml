var _new_source = input_source_detect_new();

if (_new_source != undefined)
{
    var _i = 0;
    
    repeat (2)
    {
        if (!input_player_connected(_i))
        {
            input_source_set(_new_source, _i, true);
            input_verb_consume(-3, _i);
            break;
        }
        
        _i++;
    }
}

var _paused = false;

for (var i = 0; i < 2; i++)
{
    if (input_check_pressed("pause", i))
        _paused = true;
    else if (input_check_pressed("action", i))
        input_player_disconnect(i);
}

if (_paused && input_player_connected(0))
{
    var _players = 0;
    
    for (var i = 0; i < 2; i++)
    {
        if (input_player_connected(i))
            _players++;
    }
    
    if (_players > 1)
        global.multiplayer = true;
    else
        global.multiplayer = false;
    
    room_goto(rm_boomtown_boss);
}
