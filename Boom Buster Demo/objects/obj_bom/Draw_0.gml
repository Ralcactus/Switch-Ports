event_inherited();
get_cams();

if (!inPipe && (x < (camx + 32) || x > ((camx + camw) - 32)))
{
    var _spd;
    
    if (edge)
        _spd = 0.1;
    else
        _spd = 0.06;
    
    if (!exit_freeze())
    {
        hey_scale = approach(hey_scale, 0, _spd);
        
        if (hey_scale == 0)
            hey_scale = 1.5;
    }
}
else
{
    hey_scale = 1.5;
}
