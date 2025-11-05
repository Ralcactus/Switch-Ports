if (done_move || game_paused())
    exit;

var _framestocomplete = (path_get_length(path) / abs(movespeed)) * (path_get_closed(path) ? 1 : 2);
var _cycle = get_cycle(_framestocomplete, cycleoffset);
var _halftime = _framestocomplete / 2;
var _pathpos;

if (path_get_closed(path))
    _pathpos = _cycle / _framestocomplete;
else
{
    _pathpos = _cycle / _halftime;
    
    if (_pathpos > 1)
        _pathpos = 1 - (_pathpos - 1);
}

if (sign(movespeed) == -1)
    _pathpos = 1 - _pathpos;

x = round(path_get_x(path, _pathpos)) - (sprite_width / 2);
y = round(path_get_y(path, _pathpos)) - (sprite_height / 2);
done_move = true;
