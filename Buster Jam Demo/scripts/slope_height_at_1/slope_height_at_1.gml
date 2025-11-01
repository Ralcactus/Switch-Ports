function slope_height_at_1(arg0, arg1, arg2)
{
    var _pos, _total;
    
    if (arg2.slope_dir == 2 || arg2.slope_dir == 3)
    {
        _total = arg2.bbox_right - arg2.bbox_left;
        var _w = bbox_right - bbox_left;
        
        if (arg2.slope_dir == 3)
            _pos = arg0 - arg2.bbox_left;
        else
            _pos = arg0 - arg2.bbox_left;
    }
    else if (arg2.slope_dir == 1 || arg2.slope_dir == 0)
    {
        _pos = arg1 - arg2.bbox_top;
        _total = arg2.bbox_bottom - arg2.bbox_top - (((arg1 + (bbox_bottom - y)) - (arg1 - (y - bbox_top))) / 2);
        
        if (arg2.slope_dir == 0)
            _pos = arg1 - (bbox_bottom - bbox_top) - arg2.bbox_top;
    }
    
    var _percent = clamp(_pos / _total, 0, 1);
    
    if (arg2.slope_dir == 3 || arg2.slope_dir == 0)
        _percent = 1 - _percent;
    
    if (object_index == obj_map_player)
    {
    }
    
    return floor(arg2.height * _percent);
}
