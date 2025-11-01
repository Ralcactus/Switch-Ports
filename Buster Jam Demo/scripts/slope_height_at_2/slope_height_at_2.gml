function slope_height_at_2(arg0, arg1, arg2)
{
    var _total = arg2.bbox_right - arg2.bbox_left;
    var _pos = 0;
    
    if (arg2.slope_dir == 3)
        _pos = arg0 - arg2.bbox_left;
    
    var _percent = _pos / _total;
    _percent = clamp(_percent, 0, 1);
    return floor(arg2.height * _percent);
}
