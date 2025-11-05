scale = min(scale + 0.1, 1);
image_xscale = scale * dir;
image_yscale = scale;

if (path != noone)
{
    var _framestocomplete = floor((path_get_length(path) / abs(movespeed)) * (path_get_closed(path) ? 1 : 2));
    var _cycle = get_cycle(_framestocomplete, cycleoffset);
    var _halftime = _framestocomplete / 2;
    
    if (skipcycle)
    {
        x = round(path_get_x(path, 0));
        y = round(path_get_y(path, 0));
        
        if (_cycle == 0)
            skipcycle = false;
    }
    else
    {
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
        
        x = round(path_get_x(path, _pathpos));
        y = round(path_get_y(path, _pathpos));
    }
}
