function instance_place_3d(arg0, arg1, arg2, arg3)
{
    var _meetingXY = instance_place_array(arg0, arg1, arg3);
    
    for (var i = 0; i < array_length(_meetingXY); i++)
    {
        var _inst = _meetingXY[i];
        
        if (_inst.render_layer != render_layer)
            continue;
        
        if (_inst.object_index == obj_slope_3d)
        {
            var _inst_height = slope_height_at(arg0, arg1, _inst);
            var _collide_bottom = arg2 <= _inst.z && arg2 >= (_inst.z - _inst_height);
            var _collide_top = (arg2 - height) <= _inst.z && (arg2 - height) >= (_inst.z - _inst_height);
            
            if (_collide_bottom || _collide_top)
                return _meetingXY[i].id;
        }
        else
        {
            var _collide_bottom = arg2 <= _inst.z && arg2 >= (_inst.z - _inst.height);
            var _collide_top = (arg2 - height) <= _inst.z && (arg2 - height) >= (_inst.z - _inst.height);
            
            if (_collide_bottom || _collide_top)
                return _meetingXY[i].id;
        }
    }
    
    return false;
}
