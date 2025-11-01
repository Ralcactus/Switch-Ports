function slope_height_at(arg0, arg1, arg2)
{
    var _total = arg2.bbox_right - arg2.bbox_left;
    
    if (arg2.slope_dir == 0 || arg2.slope_dir == 1)
        _total = arg2.bbox_bottom - arg2.bbox_top;
    
    var _pos = 0;
    var _w = bbox_right - bbox_left;
    var _h = bbox_bottom - bbox_top;
    var _xleft = arg0 - (arg0 - bbox_left);
    var _xright = arg0 + (bbox_right - arg0);
    var _ytop = arg1 - (arg1 - bbox_top);
    var _ybottom = arg1 + (bbox_bottom - arg1);
    
    switch (arg2.slope_dir)
    {
        case 3:
            _pos = _xright - arg2.bbox_left;
            break;
        
        case 2:
            _pos = arg2.bbox_right - _xleft;
            break;
        
        case 0:
            _pos = _ybottom - arg2.bbox_top;
            break;
        
        case 1:
            _pos = arg2.bbox_bottom - _ytop;
            break;
    }
    
    var _percent = _pos / _total;
    _percent = clamp(_percent, 0, 1);
    draw_rectangle(arg0, arg0 + 1, arg1, arg1 + 1, false);
    return floor(arg2.height * _percent);
}
