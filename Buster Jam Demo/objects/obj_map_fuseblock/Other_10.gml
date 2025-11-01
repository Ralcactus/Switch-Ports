with (obj_map_fuse_puzzle)
{
    var _num = array_length(puzzle);
    
    if (_num >= array_length(answer) || answer[_num] != other.fuse || failed)
    {
        audio_stop_play(snd_wronghuh, 0, false);
        puzzle = [];
        exit;
    }
    else
    {
        audio_stop_play(snd_dingdong, 0, false);
    }
    
    array_push(puzzle, other.fuse);
    var _solved = true;
    
    for (var i = 0; i < array_length(answer); i++)
    {
        if (array_length(puzzle) != array_length(answer))
        {
            _solved = false;
            break;
        }
        
        if (answer[i] != puzzle[i])
        {
            _solved = false;
            break;
        }
    }
    
    if (_solved)
        event_user(0);
}
