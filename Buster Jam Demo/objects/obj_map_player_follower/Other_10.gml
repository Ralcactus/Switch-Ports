var _array = obj_map_player.array_record;
var _yoff;

if (obj_map_player.dir_ind == 1 || obj_map_player.state == state_climb)
    _yoff = 1;
else
    _yoff = -1;

depth_pos = -bbox_bottom - _yoff;
var _jump = false;

if (array_length(_array) == (record_max - 1))
{
    x = _array[0].x;
    y = _array[0].y;
    
    if (_array[0].z != undefined)
        z = _array[0].z;
    
    grounded = _array[0].grounded;
    dir = _array[0].dir;
    state = _array[0].state;
    facing = _array[0].facing;
    running = _array[0].running;
    _jump = _array[0].jump;
}

if (_jump)
{
    var _snd = audio_play_sound(snd_jump, 0, 0);
    audio_sound_gain(_snd, 0.85, 0);
    audio_sound_pitch(_snd, 1.1);
}

hspd = x - xprevious;
vspd = y - yprevious;
