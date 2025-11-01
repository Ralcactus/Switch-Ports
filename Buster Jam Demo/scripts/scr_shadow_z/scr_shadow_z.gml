function scr_shadow_z(arg0 = -4)
{
    if (!instance_exists(id) || !instance_exists(my_shadow))
        exit;
    
    if (arg0 != -4)
    {
        my_shadow.z = arg0;
        exit;
    }
    
    if (instance_place_3d(x, y, z, obj_solid))
    {
        with (my_shadow)
            inside_solid = true;
        
        exit;
    }
    
    with (my_shadow)
        inside_solid = false;
    
    var _array = instance_place_array(x, y, obj_solid);
    var _z = 0;
    
    for (var i = 0; i < array_length(_array); i++)
    {
        if (_array[i].render_layer != render_layer)
            continue;
        
        if (_array[i].z < z)
            continue;
        
        if (_array[i].object_index == obj_solid_ladder)
            continue;
        
        var _new = _array[i].z - _array[i].height;
        
        if (_array[i].object_index == obj_slope_3d)
            _new = _array[i].z - slope_height_at(x, y, _array[i]);
        
        if (_new < _z)
            _z = _new;
    }
    
    if (_z == 0)
        my_shadow.z = 0;
    else
        my_shadow.z = _z - 1;
}
