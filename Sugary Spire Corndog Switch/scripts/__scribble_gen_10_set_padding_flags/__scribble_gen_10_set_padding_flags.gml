function __scribble_gen_10_set_padding_flags()
{
    var _uses_halign_center, _uses_halign_left, _uses_halign_right;
    
    with (global.__scribble_generator_state)
    {
        _uses_halign_left = __uses_halign_left;
        _uses_halign_center = __uses_halign_center;
        _uses_halign_right = __uses_halign_right;
    }
    
    switch (__valign)
    {
        case 0:
            __pad_bbox_t = false;
            __pad_bbox_b = true;
            break;
        
        case 1:
            __pad_bbox_t = true;
            __pad_bbox_b = true;
            break;
        
        case 2:
            __pad_bbox_t = true;
            __pad_bbox_b = false;
            break;
    }
    
    if (_uses_halign_center)
    {
        __pad_bbox_l = true;
        __pad_bbox_r = true;
    }
    else if (_uses_halign_left)
    {
        if (_uses_halign_right)
        {
            __pad_bbox_l = true;
            __pad_bbox_r = true;
        }
        else
        {
            __pad_bbox_l = false;
            __pad_bbox_r = true;
        }
    }
    else if (_uses_halign_right)
    {
        __pad_bbox_l = true;
        __pad_bbox_r = false;
    }
    else
    {
        __pad_bbox_l = false;
        __pad_bbox_r = true;
    }
}
